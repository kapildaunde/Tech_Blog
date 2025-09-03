
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="com.tech.blog.helper.ConnectionProvider" %>

<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
       
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link href="mycss.css" rel="stylesheet" type="text/css"/>
        
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

        
        
        <style>
            .banner-bachground{
                clip-path: polygon(50% 0%, 99% 1%, 99% 100%, 73% 96%, 28% 98%, 0 95%, 0 0);
            }
        </style>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
        <script src="myjs.js" type="text/javascript"></script>
    </head>
    <body>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
        <%@include file="navbar.jsp"%>        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

        
        <div class="container-fluid p-0 m-0">
            <div class="jumbotron primary-background">
            <div class="container">
                <h1>Welcome to Tech Blog</h1>
<p>Explore the latest in technology and innovation.</p>
<p>Stay updated with trends, tips, and tutorials.</p>
<p>Simple, smart, and made for curious minds.</p>

                
                <button class="btn btn-outline-light btn-lg"><span class="fa fa-user-plus"></span>Start !its Free</button>
                <a href="login.jsp" class="btn btn-outline-light btn-lg"><span class="fa fa-user-circle"></span>Login</a>
                <br><br><br>
            </div>
                 </div>
                </div>
                <div class="container">
                   <div class="row mt-4">
    <div class="col-md-4">
        <div class="card">
            <div class="card-body">
                <h5 class="card-title">Web Development</h5>
                <p class="card-text">Learn to build dynamic websites using HTML, CSS, JavaScript, and modern frameworks like React and Angular.</p>
                <a href="#" class="btn primary-background">Read More</a>
            </div>
        </div>
    </div>
    
    <div class="col-md-4">
        <div class="card">
            <div class="card-body">
                <h5 class="card-title">Data Structures</h5>
                <p class="card-text">Master the fundamentals of data structures like arrays, linked lists, trees, and graphs to ace your coding interviews.</p>
                <a href="#" class="btn primary-background">Read More</a>
            </div>
        </div>
    </div>
    
    <div class="col-md-4">
        <div class="card">
            <div class="card-body">
                <h5 class="card-title">Machine Learning</h5>
                <p class="card-text">Dive into AI with concepts like regression, classification, clustering, and neural networks using Python and libraries like TensorFlow.</p>
                <a href="#" class="btn primary-background">Read More</a>
            </div>
        </div>
    </div>
</div>

<div class="row mt-4">
    <div class="col-md-4">
        <div class="card">
            <div class="card-body">
                <h5 class="card-title">Mobile App Development</h5>
                <p class="card-text">Build powerful mobile apps for Android and iOS using Flutter, Kotlin, or Swift. Get started with UI/UX design too!</p>
                <a href="#" class="btn primary-background">Read More</a>
            </div>
        </div>
    </div>

    <div class="col-md-4">
        <div class="card">
            <div class="card-body">
                <h5 class="card-title">Cyber Security</h5>
                <p class="card-text">Understand the principles of security, ethical hacking, encryption, and how to protect systems against cyber attacks.</p>
                <a href="#" class="btn primary-background">Read More</a>
            </div>
        </div>
    </div>

    <div class="col-md-4">
        <div class="card">
            <div class="card-body">
                <h5 class="card-title">Cloud Computing</h5>
                <p class="card-text">Explore cloud platforms like AWS, Azure, and Google Cloud to deploy scalable, distributed applications in the cloud.</p>
                <a href="#" class="btn primary-background">Read More</a>
            </div>
        </div>
    </div>
</div>

</div>             
    </body>
</html>
