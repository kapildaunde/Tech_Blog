
package com.tech.blog.servlets;
import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class RegisterServlet extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
           
            
            String check=request.getParameter("check");
             if(check==null){
             out.println("Please check term and condition");
             }       
             else{
             String name=request.getParameter("user_name");
             String email=request.getParameter("user_email");
             String password=request.getParameter("user_password");
             String gender=request.getParameter("gender");
             String about=request.getParameter("about");
             
             User user = new User(name, email, password, gender, about, new Timestamp(System.currentTimeMillis()));

             
             UserDao dao=new UserDao(ConnectionProvider.getConnection());
             if(dao.saveUser(user)){
             out.println("<!DOCTYPE html>");
out.println("<html>");
out.println("<head>");
out.println("<title>Registration Successful</title>");
out.println("<link href='https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css' rel='stylesheet'>");
out.println("</head>");
out.println("<body class='bg-light'>");

out.println("<div class='container d-flex justify-content-center align-items-center' style='height:100vh;'>");
out.println("  <div class='card shadow-lg p-4' style='min-width: 400px;'>");
out.println("    <div class='card-body text-center'>");

out.println("      <h3 class='text-success mb-3'>✔ Registration Successful!</h3>");
out.println("      <p>Welcome, <strong>" + name + "</strong>! Your account has been created successfully.</p>");

out.println("      <table class='table table-bordered text-start mt-3'>");
out.println("        <tr><th>Name</th><td>" + name + "</td></tr>");
out.println("        <tr><th>Email</th><td>" + email + "</td></tr>");
out.println("        <tr><th>Gender</th><td>" + gender + "</td></tr>");
out.println("        <tr><th>About</th><td>" + about + "</td></tr>");
out.println("        <tr><th>Registered At</th><td>" + new Timestamp(System.currentTimeMillis()) + "</td></tr>");
out.println("      </table>");

out.println("      <a href='login.jsp' class='btn btn-primary w-100 mt-3'>Go to Login</a>");
out.println("    </div>");
out.println("  </div>");
out.println("</div>");

out.println("</body>");
out.println("</html>");

             }
             
             }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
