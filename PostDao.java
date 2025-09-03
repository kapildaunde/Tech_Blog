package com.tech.blog.dao;

import com.tech.blog.entities.Categories;
import com.tech.blog.entities.Post;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PostDao {
    Connection con;

    public PostDao(Connection con) {
        this.con = con;
    }

    // Get all categories
    public ArrayList<Categories> getAllCategories() {
        ArrayList<Categories> list = new ArrayList<>();

        try {
            String q = "SELECT * FROM Categories";
            Statement st = this.con.createStatement();
            ResultSet rs = st.executeQuery(q);

            while (rs.next()) {
                int cid = rs.getInt("cid");
                String name = rs.getString("name");
                String description = rs.getString("description");

                Categories c = new Categories(cid, name, description);
                list.add(c);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    // Save new post
    public boolean savePost(Post p) {
        boolean f = false;

        try {
            String q = "INSERT INTO posts(pTitle, pContent, pCode, pPic, catId, userId) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(q);

            ps.setString(1, p.getpTitle());
            ps.setString(2, p.getpContent());
            ps.setString(3, p.getpCode());
            ps.setString(4, p.getpPic());
            ps.setInt(5, p.getCatId());
            ps.setInt(6, p.getUserId());

            ps.executeUpdate();
            f = true;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;
    }

    // Get all posts
    public List<Post> getAllPosts() {
        List<Post> list = new ArrayList<>();
        try {
            PreparedStatement p = con.prepareStatement("SELECT * FROM posts ORDER BY pDate DESC");
            ResultSet rs = p.executeQuery();

            while (rs.next()) {
                Post post = extractPostFromResultSet(rs);
                list.add(post);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    // Get posts by category
    public List<Post> getPostByCatId(int catId) {
        List<Post> list = new ArrayList<>();
        try {
            PreparedStatement p = con.prepareStatement("SELECT * FROM posts WHERE catId=? ORDER BY pDate DESC");
            p.setInt(1, catId);
            ResultSet rs = p.executeQuery();

            while (rs.next()) {
                Post post = extractPostFromResultSet(rs);
                list.add(post);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    // ✅ FIXED NAME: getPostById (was: getPostByPostId)
    public Post getPostById(int postId) {
        Post p = null;

        try {
            String q = "SELECT * FROM posts WHERE pid=?";
            PreparedStatement ps = con.prepareStatement(q);
            ps.setInt(1, postId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                p = extractPostFromResultSet(rs);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return p;
    }

    // ✅ Add method to update post
    public boolean updatePost(Post p) {
        boolean f = false;

        try {
            String q = "UPDATE posts SET pTitle=?, pContent=?, pCode=?, pPic=?, catId=? WHERE pid=?";
            PreparedStatement ps = con.prepareStatement(q);
            ps.setString(1, p.getpTitle());
            ps.setString(2, p.getpContent());
            ps.setString(3, p.getpCode());
            ps.setString(4, p.getpPic());
            ps.setInt(5, p.getCatId());
            ps.setInt(6, p.getPid());

            int affected = ps.executeUpdate();
            f = affected == 1;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;
    }

    // ✅ Add method to delete post
    public boolean deletePost(int pid) {
        boolean f = false;

        try {
            String q = "DELETE FROM posts WHERE pid=?";
            PreparedStatement ps = con.prepareStatement(q);
            ps.setInt(1, pid);

            int affected = ps.executeUpdate();
            f = affected == 1;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;
    }

    // ✅ Utility method to avoid duplication
    private Post extractPostFromResultSet(ResultSet rs) throws SQLException {
        return new Post(
            rs.getInt("pid"),
            rs.getString("pTitle"),
            rs.getString("pContent"),
            rs.getString("pCode"),
            rs.getString("pPic"),
            rs.getTimestamp("pDate"),
            rs.getInt("catId"),
            rs.getInt("userId")
        );
    }
 

}
