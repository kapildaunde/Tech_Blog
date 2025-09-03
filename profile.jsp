
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.entities.Categories"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.entities.User"%>
<%@page import="com.tech.blog.servlets.LogoutServlet" %>
<%@page import="com.tech.blog.entities.Message" %>
<%@page import="com.tech.blog.dao.PostDao" %>
<%
   User user=(User)session.getAttribute("currentUser");
   if(user==null){
    response.sendRedirect("login.jsp");
    }
    
 %>   
 <link href="mycss.css" rel="stylesheet" type="text/css"/>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="mycss.css" rel="stylesheet" type="text/css"/>
        
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

        
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
        <script src="myjs.js" type="text/javascript"></script>
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <style>
            
            #category-box {
    position: sticky;
    top: 80px; /* Adjust if navbar height is different */
    z-index: 1000;
    height: calc(100vh - 100px); /* Full height minus header */
    overflow-y: auto;
}

                body{
                    background: url(img/vecteezy_graphics-design-illustration-digital-circuit-with-binary_7213032.jpg);
                    background-size: cover;
                    background-attachment: fixed;
                }
                .help-button {
    position: fixed;
    bottom: 30px;
    right: 30px;
    z-index: 9999;
    border-radius: 50px;
    padding: 10px 20px;
    box-shadow: 0 4px 8px rgba(0,0,0,0.2);
    font-weight: bold;
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
        <li class="nav-item ">
            <a class="nav-link active" href="#"><span class="fa fa-bell-o"></span>ProgrammingWithKapil</a>
 
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle active" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
              <span class="fa fa-check-square-o"></span>Categories
          </a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
            <li><a class="dropdown-item" href="#">Programming Language</a></li>
            <li><a class="dropdown-item" href="#">Project Implementation</a></li>
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="#">Data Structure</a></li>
          </ul>
        </li>
        
        <li class="nav-item ">
            <a class="navbar-brand" href="#!" data-bs-toggle="modal" data-bs-target="#add-post-modal"><span class="	fa fa-plus-square"></span>
                                                                                                        DoPost</a>
 
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
        
               
                    <%
                                 Message m=(Message)session.getAttribute("msg");
                                 if(m!=null){
                                 %>
                                 
                                 <div class="alert <%=m.getCssclass()%>" role="alert">
                                       <%= m.getContent() %>
                                 </div>
                                 
                                 <% session.removeAttribute("msg");
                                 }
                                 
                                 %>
                                 
    <main>
        <div class="container">
            <div class="row mt-4">
        <div class="col-md-4" id="category-box">
    <div class="list-group">
        <a href="#" onclick="getPosts(0,this)" class="list-group-item list-group-item-action active c-link" aria-current="true">All Posts</a>
        <% 
            PostDao d=new PostDao(ConnectionProvider.getConnection());
            ArrayList<Categories>list1=d.getAllCategories();
            for(Categories cc:list1) {
        %>
        <a href="#" onclick="getPosts(<%=cc.getCid()%>,this)" class="list-group-item list-group-item-action c-link"><%=cc.getName()%></a>
        <% } %>
    </div>
</div>


                <div class="col-md-8">
                    <div class="container text-center" id="loader">
                        <i class="fa fa-refresh fa-3x fa-spin"></i>
                        <h3 class="mt-2">Loading....</h3>
                    </div>
                    <div class="container-fluid" id="post-container"></div>
                </div>
            </div>
        </div>
         
    </main>                  
                                 
                                 
   
        <!-- Modal (note the id="myModal") -->
<div class="modal fade" id="profile-modal" tabindex="-1" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header primary-background text-white justify-content-center">
        <h5 class="modal-title text-center" id="exampleModalLabel"><span class="fa fa-certificate"></span>TechBlog</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
          <div class="container text-center">
              
              <h5 class="modal-title" id="exampleModalLabel"><span class="fa fa-user-circle-o"></span><%= user.getName()%></h5>
          
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
  <h5 class="modal-title w-100 text-center" id="exampleModalLabel">Provide the post Details</h5>

        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
         <!-- Category Selection -->
         
         
         
         <form id="add-post-form" action="AddPostServlet" method="post"enctype="multipart/form-data">
  <div class="form-group mb-3">
    <select class="form-control  dark-select" name="cid" required>
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
<script>
    function getPosts(catId,temp) {
        $("#loader").show();
        $("#post-container").hide();
        $(".c-link").removeClass('active')

        $.ajax({
            url: "loadPost.jsp", // Check that this JSP exists and works
            data: { cid: catId },
            success: function (data, textStatus, jqXHR) {
                console.log(data);
                $("#loader").hide();
                $("#post-container").show();
                $("#post-container").html(data);
                $(temp).addClass('active')
            },
            error: function (xhr, status, error) {
                console.error("Error loading posts:", error);
            }
        });
    }

    $(document).ready(function () {
        let allpost=$('.c-link')[0]
        getPosts(0,allpost); // Load all posts on page load
    });
</script>
<script>
  $(document).ready(function () {
    $('#send-btn').click(function () {
      const userInput = $('#chat-input').val().trim();
      if (userInput === '') return;

      $('#chat-area').append(`<div><strong>You:</strong> ${userInput}</div>`);

      $('#chat-input').val('');
      $.ajax({
        url: 'ChatGPTServlet',
        method: 'POST',
        data: { prompt: userInput },
        success: function (response) {
          $('#chat-area').append(`<div><strong>ChatGPT:</strong> ${response}</div>`);
          $('#chat-area').scrollTop($('#chat-area')[0].scrollHeight);
        },
        error: function () {
          $('#chat-area').append(`<div class="text-danger">Error communicating with ChatGPT.</div>`);
        }
      });
    });
  });
</script>

<!-- Floating Help Button -->


    </body>
</html>
