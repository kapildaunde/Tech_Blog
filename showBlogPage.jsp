
<%@page import="com.tech.blog.dao.UserDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.entities.Categories"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.entities.User"%>
<%@page errorPage="error_page.jsp" %>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="myjs.js"></script>


<%
   User user=(User)session.getAttribute("currentUser");
   if(user==null){
    response.sendRedirect("login.jsp");
    }
    
 %>   


<%
    int postid=Integer.parseInt(request.getParameter("post_id"));
    PostDao dd=new PostDao(ConnectionProvider.getConnection());
    Post p=dd.getPostById(postid);
    %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%=p.getpTitle()%></title>
        
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="mycss.css" rel="stylesheet" type="text/css"/>
        
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        
        <style>
            .post--title{
                font-weight: 100;
                font-size: 30px;
                }
                .post-content{
                    font-weight: 100;
                    font-size: 25px;
                }    
                .post-date{
                    font-style: italic;
                    font-weight: bold;
                }
                .post-user-info{
                    font-size: 20px;
                }
                .row-user{
                    border:1px solid;
                    padding :10px;
                }
                body{
                    background: url(img/vecteezy_graphics-design-illustration-digital-circuit-with-binary_7213032.jpg);
                    background-size: cover;
                    background-attachment: fixed;
                }
        </style>
        
        
    </head>
    <body>
        
        
        <nav class="navbar navbar-expand-lg navbar-dark primary-background">
  <div class="container-fluid">
      <a class="navbar-brand" href="index.jsp"><span class="fa fa-certificate"></span>TechBlog</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="#"><span class="fa fa-bell-o"></span>ProgrammingWithKapil</a>
        </li>
       
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            <span class="fa fa-check-square-o"></span> Categories
          </a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
            <li><a class="dropdown-item" href="#">Programming Language</a></li>
            <li><a class="dropdown-item" href="#">Project Implementation</a></li>
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="#">Data Structure</a></li>
          </ul>
        </li>
        
      </ul>
        
        <ul class="navbar-nav mr-right">
            
            <li class="nav-item">
               <a class="navbar-brand" href="#!" data-bs-toggle="modal" data-bs-target="#profile-modal"><span class="fa fa-user-circle-o"></span><%=user.getName()%></a>
    
            </li>
        
            <li class="nav-item">
                <a class="navbar-brand" href="LogoutServlet"><span class="fa fa-power-off "></span>LogOut</a>
        </li>
        </ul>
      </form>
    </div>
  </div>
</nav>
        
               <div class="container">
                   <div class="row my-4">
                       <div class="col-md-8 offset-md-2">
                           <div class="card">
                           <div class="card-header">
                               <h4 class="post-title"><%=p.getpTitle()%></h4>
                           </div>
                           
                           <div class="card-body">
                               <img src="<%= request.getContextPath() %>/img/<%=p.getpPic()%>" class="card-img-top" alt="Post Image">

                               <div class="row my-3 row-user">
                                   <%UserDao d=new UserDao(ConnectionProvider.getConnection());%>
                                   <div class="col-md-8">
                                       <p class="post-user-info"><a href="#!"><%=d.getUserByUserId(p.getUserId()).getName()%></a>has posted</p>
                                   </div>
                                   <div class="col-md-4">
                                       <p class="post-date"><%=p.getpDate().toLocaleString()%></p>
                                   </div>
                               </div>

                               <p class="post-content"><%=p.getpContent()%></p>
                               
                               <br><br>
                               <div class="post-code">
                               <pre><%=p.getpCode()%></pre>
                           </div>
                           </div>
                           
                           
         <div class="card-footer primary-background text-white">

             <a href="#!" onclick="doLike(<%=p.getPid()%>, <%=user.getId()%>)" class="btn btn-outline-primary btn-sm"><i class="fa fa-thumbs-o-up"></i>
</a>

             <a href="#" class="btn btn-outline-primary btn-sm"><i class="fa fa-commenting-o"></i></a>   
            
             
            </div>
                           </div>
             
                       </div>
                   </div>
               </div>            
               
               
   
        <!-- Modal (note the id="myModal") -->
<div class="modal fade" id="profile-modal" tabindex="-1" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header primary-background text-white">
        <h5 class="modal-title" id="exampleModalLabel">TechBlog</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
          <div class="container text-center">
              
        <h5 class="modal-title" id="exampleModalLabel"><%= user.getName()%></h5>
          
        <div id="profile-details">
          <table class="table">
 
  <tbody>
    <tr>
      <th scope="row"> ID :</th>
      <td><%= user.getId()%></td>
    </tr>
    <tr>
      <th scope="row"> Name :</th>
      <td><%= user.getName()%></td>
    </tr>
    <tr>
      <th scope="row"> Email :</th>
       <td><%= user.getEmail()%></td>
    </tr>
    <tr>
      <th scope="row"> Gender :</th>
       <td><%= user.getGender()%></td>
    </tr>
    <tr>
      <th scope="row"> About :</th>
       <td><%= user.getAbout()%></td>
    </tr>
    <tr>
      <th scope="row"> Registered on:</th>
      <td>
  <%= user.getDatetime() != null ? user.getDatetime().toString() : "Not Available" %>
</td>

    </tr>
  </tbody>
</table>  
        </div>
      
<div id="profile-edit" style ="display: none">
    <h3 class="mt-2"> Please Edit Carefully</h3>
    <form action="EditServlet" method="post" enctype="multipart/form-data">
        <table class="table">
            <tr>
                <td> ID :</td>
                <td><%= user.getId()%></td>
            </tr>
            <tr>
                <td>Email :</td>
                <td><input type="email" class="form-control" name="user_email" value="<%= user.getEmail()%>"</td>
            </tr>
            
            <tr>
                <td>Name :</td>
                <td><input type="Text" class="form-control" name="user_name" value="<%= user.getName()%>"</td>
            </tr>
            <tr>
                <td>Password :</td>
                <td><input type="password" class="form-control" name="user_password" value="<%= user.getPassword()%>"</td>
            </tr>
            <tr>
                <td> Gender :</td>
                <td><%= user.getGender().toUpperCase()%></td>
            </tr>
            <tr>
            <td>About : </td>
            <td>
                <textarea rows="3" class="form-control" name="user_about"><%= user.getAbout()%>
                </textarea>
            </td>
            </tr>
            <tr>
            <td>New Profile Pic : </td>
            <td>
                <input type="file" name="image" class="form-control">
            </td>
            </tr>
        </table>
                <div class="container">
                    <button type="submit" class="btn btn-outline-primary">Save</button>
    </form>
</div>

          </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary" id="edit-profile-button">Edit</button>

      </div>
    </div>
  </div>
</div>
   </div>     
                

<!-- Modal -->
<div class="modal fade" id="add-post-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Provide the post Details</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
         <!-- Category Selection -->
         
         
         
         <form id="add-post-form" action="AddPostServlet" method="post"enctype="multipart/form-data">
  <div class="form-group mb-3">
    <select class="form-control" name="cid" required>
      <option selected disabled>---Select Category---</option>
      
      <%
          PostDao post=new PostDao(ConnectionProvider.getConnection());
          ArrayList<Categories>list=post.getAllCategories();
          for(Categories c:list)
          {
          %>
        <option value="<%=c.getCid()%>"><%=c.getName()%></option>

      <%
              }
           %>
      
    </select>
  </div>

  <!-- Post Title -->
  <div class="form-group mb-3">
    <input type="text" name="pTitle" placeholder="Enter Post Title" class="form-control" required />
  </div>

  <!-- Post Content -->
  <div class="form-group mb-3">
    <textarea class="form-control" name="pContent" style="height: 150px;" placeholder="Enter your content" required></textarea>
  </div>

  <!-- Program Code (optional) -->
  <div class="form-group mb-3">
    <textarea class="form-control" name="pCode" style="height: 150px;" placeholder="Enter your program (if any)"></textarea>
  </div>

  <!-- Image Upload -->
  <div class="form-group mb-3">
    <label for="pic">Select your pic:</label>
    <input type="file" name="pic" class="form-control" />
  </div>
  <div class="container text-center">
      <button type="submit" class="btn btn-outline-primary">Post</button>
  </div>
</form>
          
          
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>



    <!-- ✅ jQuery (Only if your custom JS needs it) -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<!-- ✅ Bootstrap 5.3.3 JS Bundle (includes Popper.js) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

<!-- ✅ Your custom JS -->
 <script src="myjs.js" type="text/javascript"></script>



<script>
    $(document).ready(function(){
        let editStatus=false;
        
        $('#edit-profile-button').click(function()
                
        {
            if(editStatus == false)
            {
                $("#profile-details").hide();
                
                $("#profile-edit").show();
                editStatus=true;
                $(this).text("back");
            }else{
                $("#profile-details").show();
                
                $("#profile-edit").hide();
                editStatus=false;
                $(this).text("Edit")
            }
        })
    })
    
   
    </script>        
        
         </body>
</html>
