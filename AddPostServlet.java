package com.tech.blog.servlets;

import com.tech.blog.dao.PostDao;
import com.tech.blog.entities.Message;
import com.tech.blog.entities.Post;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@MultipartConfig
public class AddPostServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        response.setContentType("text/html;charset=UTF-8");
        
        try (PrintWriter out = response.getWriter()) {

            int cid = Integer.parseInt(request.getParameter("cid"));
            String pTitle = request.getParameter("pTitle");
            String pContent = request.getParameter("pContent");
            String pCode = request.getParameter("pCode");
            Part part = request.getPart("pic"); // uploaded file
            
            // get current user from session
            HttpSession session = request.getSession(); 
            User user = (User) session.getAttribute("currentUser");

            // get image file name
            String fileName = part.getSubmittedFileName();

            // get real upload path (blog_pics folder in your project)
            String uploadPath = request.getRealPath("/") + "blog_pics" + File.separator + fileName;
            
            // create folder if not exists
            File uploadDir = new File(request.getRealPath("/") + "blog_pics");
            if (!uploadDir.exists()) {
                uploadDir.mkdir();
            }

            // Save the uploaded image to disk
            try (InputStream is = part.getInputStream(); FileOutputStream fos = new FileOutputStream(uploadPath)) {
                byte[] buffer = new byte[1024];
                int bytesRead;
                while ((bytesRead = is.read(buffer)) != -1) {
                    fos.write(buffer, 0, bytesRead);
                }
            } catch (Exception e) {
                e.printStackTrace();
            }

            // Save post to database
            Post p = new Post(pTitle, pContent, pCode, fileName, null, cid, user.getId());
            PostDao dao = new PostDao(ConnectionProvider.getConnection());

            if (dao.savePost(p)) {
                Message msg = new Message("Post added successfully!", "success", "alert-success");
                session.setAttribute("msg", msg);
            } else {
                Message msg = new Message("Something went wrong! Try again.", "error", "alert-danger");
                session.setAttribute("msg", msg);
            }

            // redirect back to profile page
            response.sendRedirect("profile.jsp");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Handles post upload with image";
    }
}
