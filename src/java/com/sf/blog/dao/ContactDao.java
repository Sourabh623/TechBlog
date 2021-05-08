
package com.sf.blog.dao;


import com.sf.blog.entities.Contact;
import java.sql.*;
import java.util.ArrayList;


public class ContactDao {
    
     Connection con;

    public ContactDao(Connection con) {
        this.con = con;
    }

    public boolean AddContact(Contact contact){
        
        boolean f = false;
        
        
        try {
              
            PreparedStatement ps=this.con.prepareStatement("insert into contact(name,surname,email,number,message) values(?,?,?,?,?)");
            ps.setString(1, contact.getName());
            ps.setString(2, contact.getSurname());
            ps.setString(3, contact.getEmail());
            ps.setLong(4, contact.getNumber());
            ps.setString(5, contact.getMessage());
            
            ps.executeUpdate();
            
            
            
            f=true;
            
            
        } catch (Exception e) {
            
            e.printStackTrace();
        }
        
        return f;
    }
    
    
    public ArrayList<Contact> getAllContacts(){
        ArrayList<Contact> list=new ArrayList<>();
        
        
        try {
            
            String q="select * from contact";
            Statement st=this.con.createStatement();
            ResultSet set=st.executeQuery(q);
            
            while(set.next()){
                int id=set.getInt("id");
                String name=set.getString("name");
                String surname=set.getString("surname");
                String email=set.getString("email");
                long number=set.getLong("number");
                String message=set.getString("message");
                Contact c=new Contact(id, name, surname, email, number, message);
                
                list.add(c);
            }
            
            
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return list;
    }
    
     public boolean getContactIdDeleteByAdmin(int cid) {

        boolean f = false;

        try {

            PreparedStatement ps = this.con.prepareStatement("delete from contact where id=?");
            ps.setInt(1, cid);
            ps.executeUpdate();
            f = true;

        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return f;

    }
    
}
