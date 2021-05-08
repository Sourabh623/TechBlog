
package com.sf.blog.entities;

import java.sql.Timestamp;

public class Admin {
    private int id;
    private String username;
    private String password;
    private String userType;
    private String pic;
    private Timestamp rdate;

    public Admin() {
    }

    public Admin(String username, String password, String pic) {
        this.username = username;
        this.password = password;
        this.pic = pic;
    }

    public Admin(String username, String password, String userType, String pic, Timestamp rdate) {
        this.username = username;
        this.password = password;
        this.userType = userType;
        this.pic = pic;
        this.rdate = rdate;
    }

    public Admin(int id, String username, String password, String userType, String pic, Timestamp rdate) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.userType = userType;
        this.pic = pic;
        this.rdate = rdate;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
    
    

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getUserType() {
        return userType;
    }

    public void setUserType(String userType) {
        this.userType = userType;
    }

    public String getPic() {
        return pic;
    }

    public void setPic(String pic) {
        this.pic = pic;
    }

    public Timestamp getRdate() {
        return rdate;
    }

    public void setRdate(Timestamp rdate) {
        this.rdate = rdate;
    }
  
}
