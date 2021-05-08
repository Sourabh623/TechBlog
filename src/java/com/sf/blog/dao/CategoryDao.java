package com.sf.blog.dao;

import com.sf.blog.entities.Category;
import java.sql.*;

public class CategoryDao {

    Connection con;

    public CategoryDao(Connection con) {
        this.con = con;
    }

    public boolean getCatgoryAddByAdmin(Category cat) {

        boolean f = false;

        try {

            PreparedStatement ps = this.con.prepareStatement("insert into categories(name,description) values(?,?)");
            ps.setString(1, cat.getName());
            ps.setString(2, cat.getDescription());
            ps.executeUpdate();
            f = true;

        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return f;

    }

    public boolean getCatgoryIdDeleteByAdmin(int cid) {

        boolean f = false;

        try {

            PreparedStatement ps = this.con.prepareStatement("delete from categories where cid=?");
            ps.setInt(1, cid);
            ps.executeUpdate();
            f = true;

        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return f;

    }

}
