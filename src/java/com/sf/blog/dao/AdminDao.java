package com.sf.blog.dao;

import com.sf.blog.entities.Admin;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

public class AdminDao {

    private Connection con;

    public AdminDao(Connection con) {
        this.con = con;
    }

    public boolean saveAdmin(Admin admin) {
        boolean f = false;

        try {

            String q = "insert into admin(username,password,pic) values(?,?,?)";

            PreparedStatement p = this.con.prepareStatement(q);

            p.setString(1, admin.getUsername());

            p.setString(2, admin.getPassword());

            p.setString(3, admin.getPic());

            p.executeUpdate();

            f = true;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;
    }

    public Admin getAdminByEmailAndPassword(String username, String password) {
        Admin admin = null;

        try {

            String query = "select * from  admin where username=? and password=?";

            PreparedStatement ps = con.prepareStatement(query);

            ps.setString(1, username);
            ps.setString(2, password);

            ResultSet set = ps.executeQuery();

            if (set.next()) {

                admin = new Admin();
                //data fetch from db & set to user object

                admin.setUsername(set.getString("username"));
                admin.setPassword(set.getString("password"));
                admin.setUserType(set.getString("userType"));
                admin.setPic(set.getString("pic"));
                admin.setRdate(set.getTimestamp("rdate"));

            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return admin;

    }

    public List<Admin> getAllAdmin() {
        List<Admin> list = new ArrayList<>();
        try {
            //fetch all posts from db
            String q = "select * from admin";

            PreparedStatement ps = con.prepareStatement(q);

            ResultSet set = ps.executeQuery();

            while (set.next()) {

                String username = set.getString("username");
                String password = set.getString("password");
                String pic = set.getString("pic");
                Timestamp rDate = set.getTimestamp("rdate");
                Admin admin = new Admin(username, password, "admin", pic, rDate);

                list.add(admin);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public boolean getAdminUsernameDeleteByAdmin(String username) {

        boolean f = false;

        try {

            PreparedStatement ps = this.con.prepareStatement("delete from admin where username=?");
            ps.setString(1, username);
            ps.executeUpdate();
            f = true;

        } catch (Exception ex) {
            ex.printStackTrace();
        }

        return f;

    }

}
