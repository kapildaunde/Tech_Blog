package com.tech.blog.servlets;

import com.tech.blog.dao.PostDao;
import com.tech.blog.helper.ConnectionProvider;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/DeletePostServlet")
public class DeletePostServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            int pid = Integer.parseInt(request.getParameter("post_id"));

            PostDao dao = new PostDao(ConnectionProvider.getConnection());
            boolean deleted = dao.deletePost(pid);

            if (deleted) {
                response.sendRedirect("profile.jsp"); // redirect to your profile or dashboard
            } else {
                response.getWriter().println("❌ Failed to delete post.");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("❌ Error occurred while deleting post.");
        }
    }
}
