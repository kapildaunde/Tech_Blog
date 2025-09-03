<%@page import="com.tech.blog.entities.User"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="java.util.List"%>

<%
    User currentUser = (User) session.getAttribute("currentUser");
    PostDao d = new PostDao(ConnectionProvider.getConnection());

    int cid = 0;
    try {
        cid = Integer.parseInt(request.getParameter("cid"));
    } catch (Exception e) {
        cid = 0; // fallback to all posts
    }

    List<Post> posts = (cid == 0) ? d.getAllPosts() : d.getPostByCatId(cid);

    if (posts == null || posts.isEmpty()) {
%>
    <h3 class='display-4 text-center mt-5'>NO POST IN THIS CATEGORY</h3>
<%
    }

    for (Post p : posts) {
%>
   <div class="col-12 col-md-10 offset-md-1 mt-4">
    <div class="card shadow-sm" style="border-radius: 10px; overflow: hidden;">
        <!-- Post Image -->
        <img src="blog_pics/<%=p.getpPic()%>" class="card-img-top w-100" alt="Post Image"
             style="max-height: 200px; object-fit: cover;">

        <!-- Post Content -->
        <div class="card-body">
            <h5 class="fw-bold"><%= p.getpTitle() %></h5>
            <p>
                <%= p.getpContent().length() > 120
                        ? p.getpContent().substring(0, 120) + "..."
                        : p.getpContent() %>
            </p>
        </div>

        <!-- Post Actions -->
        <div class="card-footer primary-background text-center">
            <a href="#" class="btn btn-outline-primary btn-sm"><i class="fa fa-thumbs-o-up"></i></a>
            <a href="showBlogPage.jsp?post_id=<%=p.getPid()%>" class="btn btn-outline-primary btn-sm">
                Read More
            </a>
            <a href="#" class="btn btn-outline-primary btn-sm"><i class="fa fa-commenting-o"></i></a>

            <%-- Show edit/delete only for post owner --%>
            <% if (currentUser != null && currentUser.getId() == p.getUserId()) { %>
                <a href="edit_post.jsp?post_id=<%=p.getPid()%>" class="btn btn-outline-warning btn-sm">
                    <i class="fa fa-pencil"></i> Edit
                </a>
                <a href="DeletePostServlet?post_id=<%=p.getPid()%>" class="btn btn-outline-danger btn-sm"
                   onclick="return confirm('Are you sure you want to delete this post?');">
                    <i class="fa fa-trash"></i> Delete
                </a>
            <% } %>
        </div>
    </div>
</div>
<%
    } // end for
%>
