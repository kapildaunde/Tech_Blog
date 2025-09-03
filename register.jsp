
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> Register Page</title>
        
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link href="mycss.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    </head>
    <body>
        <%@include file="navbar.jsp" %>
        <main class="primary-background p-5">
            <div class="container">
                <div class="row">
                    <div class="col-md-6 offset-md-3">
                        <div class="card">
                            <div class="card-header text-center">
                            Register Here
                            </div>
                            <div class="card-body">
 
  <form action="RegisterServlet" method="post">
       <div class="mb-3">
    <label for="user_name" class="form-label">User Name</label>
    <input name="user_name" type="text" class="form-control" id="username" aria-describedby="enter name" placeholder="Enter Name">
    </div>
      
      
  <div class="mb-3">
    <label for="exampleInputEmail1" class="form-label">Email address</label>
    <input name="user_email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Email">
    <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
  </div>
      
      
  <div class="mb-3">
    <label for="exampleInputPassword1" class="form-label">Password</label>
    <input name="user_password" type="password" class="form-control" id="exampleInputPassword1" placeholder="Enter Password">
  </div>
   
  <div class="mb-3">
    <label for="gender" class="form-label">Select Gender</label>
    <br>
    <input type="radio" id="gender" name="gender" value="male">Male
    <input type="radio" id="gender" name="gender" value="female">Female
  </div>
      
      <div class="form-group">
          <textarea name="about" id="" class="form-control" cols="30" rows="5" placeholder="Enter Something About You"></textarea>
      </div>   
      
  <div class="mb-3 form-check">
    <input name="check" type="checkbox" class="form-check-input" id="exampleCheck1">
    <label class="form-check-label" for="exampleCheck1">Agree Term and Conditions</label>
  </div>
       
  <button type="submit" class="btn btn-primary">Submit</button>
</form>
               
                            </div>
                            <div class="card-footer">
                                
                            </div>
                            
                        </div>
                    </div>
                </div>
            </div>
        </main>
        
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
         <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

    </body>
</html>
