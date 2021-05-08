
package com.sf.blog.dao;
import com.sf.blog.entities.Category;
import com.sf.blog.entities.Posts;
import  java.sql.*;
import java.util.ArrayList;
import java.util.List;
public class PostDao {
    Connection con;

    public PostDao(Connection con) {
        this.con = con;
    }
    
    public ArrayList<Category> getAllCategories(){
        ArrayList<Category> list=new ArrayList<>();
        
        
        try {
            
            String q="select * from categories";
            Statement st=this.con.createStatement();
            ResultSet set=st.executeQuery(q);
            
            while(set.next()){
                int cid=set.getInt("cid");
                String name=set.getString("name");
                String description=set.getString("description");
                Category c=new Category(cid,name,description);
                list.add(c);
            }
            
            
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return list;
    }
    
    public boolean savePost(Posts post){
        boolean f=false;
        
        try {
            
            String q="insert into posts(pTitle,pContent,pCode,pPic,catId,userId) values(?,?,?,?,?,?)";
            
            PreparedStatement p=con.prepareStatement(q);
            
            p.setString(1, post.getpTitle());
            
            p.setString(2, post.getpContent());
            
            p.setString(3, post.getpCode());
            
            p.setString(4, post.getpPic());
            
            p.setInt(5, post.getCatId());
            
            p.setInt(6, post.getUserId());
            
            p.executeUpdate();
            
            f=true;
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return f;
    }
    
    
    public boolean savePostByAdmin(Posts post){
        boolean f=false;
        
        try {
            
            String q="insert into posts(pTitle,pContent,pCode,pPic,catId,userId) values(?,?,?,?,?,?)";
            
            PreparedStatement p=con.prepareStatement(q);
            
            p.setString(1, post.getpTitle());
            
            p.setString(2, post.getpContent());
            
            p.setString(3, post.getpCode());
            
            p.setString(4, post.getpPic());
            
            p.setInt(5, post.getCatId());
            
            p.setInt(6, post.getUserId());
            
            p.executeUpdate();
            
            f=true;
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return f;
    }
    
    //get all the posts
    public List<Posts> getAllPosts(){
        List<Posts> list=new ArrayList<>();
        try {
            //fetch all posts from db
            String q="select * from posts order by pid desc";
            
            PreparedStatement ps=con.prepareStatement(q);
            
            ResultSet set=ps.executeQuery();
            
            while(set.next()){
                int pid=set.getInt("pid");
                String pTitle=set.getString("pTitle");
                String pContent=set.getString("pContent");
                String pCode=set.getString("pCode");
                String pPic=set.getString("pPic");
                Timestamp pDate=set.getTimestamp("pDate");
                int catId=set.getInt("catId");
                int userId=set.getInt("userid");
                Posts p=new Posts(pid, pTitle, pContent, pCode, pPic, pDate, catId, userId);
                
                list.add(p);
            }
            
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    //get posts by categories
    public List<Posts> getPostByCatId(int catId){
        //fetch all posts by catid
        List<Posts> list=new ArrayList<>();
        try {
            //fetch all posts from db
            String q="select * from posts where catId=?";
            
            PreparedStatement ps=con.prepareStatement(q);
            ps.setInt(1, catId);
            
            ResultSet set=ps.executeQuery();
            
            while(set.next()){
                int pid=set.getInt("pid");
                String pTitle=set.getString("pTitle");
                String pContent=set.getString("pContent");
                String pCode=set.getString("pCode");
                String pPic=set.getString("pPic");
                Timestamp pDate=set.getTimestamp("pDate");
                int userId=set.getInt("userid");
                
                Posts p=new Posts(pid, pTitle, pContent, pCode, pPic, pDate, catId, userId);
                
                list.add(p);
            }
            
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    
    public List<Posts> getPostByPostId(int pid){
        //fetch all posts by catid
        List<Posts> list=new ArrayList<>();
        try {
            //fetch all posts from db
            String q="select * from posts where pid=?";
            
            PreparedStatement ps=con.prepareStatement(q);
            ps.setInt(1, pid);
            
            ResultSet set=ps.executeQuery();
            
            while(set.next()){
             
                String pTitle=set.getString("pTitle");
                String pContent=set.getString("pContent");
                String pCode=set.getString("pCode");
                String pPic=set.getString("pPic");
                Timestamp pDate=set.getTimestamp("pDate");
                int catId=set.getInt("catId");
                int userId=set.getInt("userid");
                
                Posts p=new Posts(pid, pTitle, pContent, pCode, pPic, pDate, catId, userId);
                
                list.add(p);
            }
            
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    
}
    
    
       public boolean getPostIdByAdminDelete(int pid) {

        boolean f = false;

        try {

            PreparedStatement ps = this.con.prepareStatement("delete from posts where pid=?");
            ps.setInt(1, pid);
            ps.executeUpdate();
            f = true;

        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return f;

    }
    

}
