package com.sf.blog.dao;

import com.sf.blog.entities.User;
import java.sql.*;
import java.util.ArrayList;

public class UserDao {

    private Connection con;

    public UserDao(Connection con) {
        this.con = con;
    }

   //method insert user data
    public boolean saveUser(User user) {
        
        boolean f=false;

        try {
            //user database 

            String query = "insert into user(name,email,password,gender,about) values(?,?,?,?,?)";

            PreparedStatement ps = this.con.prepareStatement(query);

            ps.setString(1, user.getName());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getPassword());
            ps.setString(4, user.getGender());
            ps.setString(5, user.getAbout());

            ps.executeUpdate();
            
            f=true;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }
    
   //get user by useremail and userpassword
    
    public User getUserByEmailAndPassword(String email, String password){
        User user=null;
        
        try {
            
            String query="select * from  user where email=? and password=?";
            
            PreparedStatement ps=con.prepareStatement(query);
            
            ps.setString(1, email);
            ps.setString(2, password);
            
            ResultSet set=ps.executeQuery();
            
            if(set.next()){
                
                user=new User();
//                data fetch from db
                
                String name=set.getString("name");
                
                //set to user object
                
                user.setName(name);
                
                user.setId(set.getInt("id"));
                
                user.setEmail(set.getString("email"));
                
                user.setPassword(set.getString("password"));
                
                user.setGender(set.getString("gender"));
                
                user.setAbout(set.getString("about"));
                
                user.setDateTime(set.getTimestamp("rdate"));
                
                user.setProfile(set.getString("profile"));
                
                user.getUserType();
                
               
             
            }
            
            
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        
        return user;
    
    }
    
  
    public boolean updateUser(User user){
        
         boolean f=false;
        
        
        try {
            
            //new user data
            String query = "update user set name=?, email=?, password=?, gender=?, about=?, profile=? where id=? ";

            PreparedStatement ps = this.con.prepareStatement(query);

            ps.setString(1, user.getName());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getPassword());
            ps.setString(4, user.getGender());
            ps.setString(5, user.getAbout());
            ps.setString(6, user.getProfile());
            ps.setInt(7, user.getId());

            ps.executeUpdate();
            
            f=true;

            
            
        } catch (Exception e) {
            e.printStackTrace();
        }
       return f;
        
    }
    
    public User getUserIdByUserId(int userId){
        User user=null;
        try {
            String q="select * from user where id=?";
            
            PreparedStatement ps=this.con.prepareStatement(q);
            ps.setInt(1, userId);
            
            ResultSet set=ps.executeQuery();
            while(set.next()){
                
                user=new User();
                //data fetch from db
                
                String name=set.getString("name");
                
                //set to user object
                
                user.setName(name);
                
                user.setId(set.getInt("id"));
                
                user.setEmail(set.getString("email"));
                
                user.setPassword(set.getString("password"));
                
                user.setGender(set.getString("gender"));
                
                user.setAbout(set.getString("about"));
                
                user.setDateTime(set.getTimestamp("rdate"));
                
                user.setProfile(set.getString("profile"));
                
                
                
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }
    
    public ArrayList<User> getAllUser(){
        ArrayList<User> list=new ArrayList<>();
         User user=null;
        
        try {
            
            String q="select * from user";
            Statement st=this.con.createStatement();
            ResultSet set=st.executeQuery(q);
            
            while(set.next()){
                
                 user=new User();
                //data fetch from db
                
                String name=set.getString("name");
                
                //set to user object
                
                user.setName(name);
                
                user.setId(set.getInt("id"));
                
                user.setEmail(set.getString("email"));
                
                user.setPassword(set.getString("password"));
                
                user.setGender(set.getString("gender"));
                
                user.setAbout(set.getString("about"));
                
                user.setDateTime(set.getTimestamp("rdate"));
                
                user.setProfile(set.getString("profile"));
                
                list.add(user);
                
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    
     public boolean getUserIdDeleteByAdmin(int uid) {

        boolean f = false;

        try {

            PreparedStatement ps = this.con.prepareStatement("delete from user where id=?");
            ps.setInt(1, uid);
            ps.executeUpdate();
            f = true;

        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return f;

    }
    
}
