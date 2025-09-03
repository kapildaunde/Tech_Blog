
package com.tech.blog.dao;
import java.sql.*;
import com.tech.blog.entities.User;
public class UserDao {
  private Connection con; 

    public UserDao(Connection con) {
        this.con=con;
    }
    
  //method to insert user to data base
    public boolean saveUser(User user){
    boolean f=false;
    try{
        String query = "insert into user(name,email,password,gender,about,rdate) values(?,?,?,?,?,?)";
    PreparedStatement pstmt=this.con.prepareStatement(query);
    pstmt.setString(1, user.getName());
    pstmt.setString(2,user.getEmail() );
    pstmt.setString(3,user.getPassword());
    pstmt.setString(4,user.getGender());
    pstmt.setString(5,user.getAbout());
    pstmt.setTimestamp(6, user.getDatetime());
    
    pstmt.executeUpdate();
    f=true;
    }
    catch(Exception e){
    e.printStackTrace();
    }
    return f;
    }
    public User getUserByEmailAndPassword(String email,String password){
    User user=null;
    try{
    String query= "select * from user where email=? and password=?";
    PreparedStatement ptmt=con.prepareStatement(query);
    ptmt.setString(1, email);
    ptmt.setString(2, password);
    
    ResultSet rs=ptmt.executeQuery();
    
    if(rs.next()){
    user=new User();
    
    user.setId(rs.getInt("id"));
    user.setName(rs.getString("name"));
    user.setEmail(rs.getString("email"));
    user.setPassword(rs.getString("password"));
    user.setGender(rs.getString("gender"));
    user.setAbout(rs.getString("about"));
    user.setDatetime(rs.getTimestamp("rdate"));
    user.setProfile(rs.getString("profile"));
    
    }
    }
    catch(Exception e){
    e.printStackTrace();
    }
    return user;
    }
    
    public boolean UpdateUser(User user){
       boolean f=false;
       
       try{
         
           String query = "UPDATE user SET name=?, email=?, password=?, gender=?, about=?, profile=? WHERE id=?";

           PreparedStatement ps=con.prepareStatement(query);
           
           ps.setString(1, user.getName());
           ps.setString(2, user.getEmail());
           ps.setString(3, user.getPassword());
           ps.setString(4, user.getGender());
           ps.setString(5, user.getAbout());
           ps.setString(6, user.getProfile());
           ps.setInt(7, user.getId());
           
           ps.executeUpdate();
           f=true;
           
       }
       catch(Exception e){
       e.printStackTrace();
       }
    return f;
        
    }
    public User getUserByUserId(int userId){
      User user=null;
     try{
     String q="select * from  user where id=?";
     PreparedStatement ps=this.con.prepareStatement(q);
     ps.setInt(1, userId);
     ResultSet rs=ps.executeQuery();
     if(rs.next()){
        user=new User();
    user.setId(rs.getInt("id"));
    user.setName(rs.getString("name"));
    user.setEmail(rs.getString("email"));
    user.setPassword(rs.getString("password"));
    user.setGender(rs.getString("gender"));
    user.setAbout(rs.getString("about"));
    user.setDatetime(rs.getTimestamp("rdate"));
    user.setProfile(rs.getString("profile"));
    
     }
     }
     catch(Exception e){
     e.printStackTrace();
     }
    
    return user;
}
}