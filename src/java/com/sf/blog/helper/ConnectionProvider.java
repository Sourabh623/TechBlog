
package com.sf.blog.helper;
import java.sql.*;

public class ConnectionProvider {
    private static Connection con;
    
    public static Connection getConnection()
    {
    try
    {
        if(con==null){
            //driver class load
        Class.forName("com.mysql.jdbc.Driver");
        
        //create a connection 
        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/sfblog?zeroDateTimeBehavior=convertToNull","root","");
        
        }
    }
    catch(ClassNotFoundException | SQLException e)
    {
        e.printStackTrace();
    }
    return con;
    }
    
}
