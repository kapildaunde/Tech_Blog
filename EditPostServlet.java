package com.tech.blog.servlets;

import com.tech.blog.dao.PostDao;
import com.tech.blog.entities.Message;
import com.tech.blog.entities.Post;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.*;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Part;

@WebServlet("/EditPostServlet")
@MultipartConfig


public class EditPostServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        int postId = Integer.parseInt(request.getParameter("post_id"));
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        String code = request.getParameter("code");
        Part part = request.getPart("pic");
        String imageName = part.getSubmittedFileName();

        HttpSession session = request.getSession();
        User currentUser = (User) session.getAttribute("currentUser");

        PostDao dao = new PostDao(ConnectionProvider.getConnection());
        Post oldPost = dao.getPostById(postId);

        if (oldPost != null && oldPost.getUserId() == currentUser.getId()) {
            // Update values
            oldPost.setpTitle(title);
            oldPost.setpContent(content);
            oldPost.setpCode(code);

            if (!imageName.isEmpty()) {
                // Optional: Delete old image
                String path = getServletContext().getRealPath("/") + "blog_pics" + File.separator + oldPost.getpPic();
                File oldFile = new File(path);
                if (oldFile.exists()) oldFile.delete();

                // Save new image
                String newPath = getServletContext().getRealPath("/") + "blog_pics" + File.separator + imageName;
                part.write(newPath);
                oldPost.setpPic(imageName);
            }

            if (dao.updatePost(oldPost)) {
                session.setAttribute("msg", new Message("Post updated successfully!", "success", "alert-success"));
            } else {
                session.setAttribute("msg", new Message("Update failed!", "error", "alert-danger"));
            }

        } else {
            session.setAttribute("msg", new Message("Unauthorized access!", "error", "alert-danger"));
        }

        response.sendRedirect("profile.jsp");
    }
}
