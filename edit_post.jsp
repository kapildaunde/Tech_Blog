<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.entities.User"%>
<%@page import="java.util.*"%>
<%@page import="javax.servlet.*"%>

<%
    User user = (User) session.getAttribute("currentUser");
    int postId = Integer.parseInt(request.getParameter("post_id"));
    PostDao dao = new PostDao(ConnectionProvider.getConnection());
    Post post = dao.getPostById(postId);

    if (post == null || post.getUserId() != user.getId()) {
        out.println("<h3 style='color:red;'>Unauthorized access</h3>");
        return;
    }
%>

<html>
<head>
    <title>Edit Post</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container mt-5">
    <h3>Edit Your Post</h3>
    <form action="EditPostServlet" method="post" enctype="multipart/form-data">
        <input type="hidden" name="post_id" value="<%= post.getPid() %>">
        
        <div class="mb-3">
            <label>Post Title</label>
            <input type="text" class="form-control" name="title" value="<%= post.getpTitle() %>">
        </div>
        
        <div class="mb-3">
            <label>Content</label>
            <textarea class="form-control" name="content" rows="5"><%= post.getpContent() %></textarea>
        </div>
        
        <div class="mb-3">
            <label>Code (optional)</label>
            <textarea class="form-control" name="code" rows="5"><%= post.getpCode() %></textarea>
        </div>

        <div class="mb-3">
            <label>Change Image (optional)</label>
            <input type="file" name="pic" class="form-control">
        </div>

        <button type="submit" class="btn btn-primary">Update Post</button>
    </form>
</div>

</body>
</html>
