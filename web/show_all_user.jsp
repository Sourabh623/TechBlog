<%@page import="com.sf.blog.helper.ConnectionProvider"%>
<%@page import="com.sf.blog.dao.UserDao"%>
<%@page import="com.sf.blog.entities.Message"%>
<%@page import="com.sf.blog.entities.Admin"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%

    Admin admin = (Admin) session.getAttribute("admin");

    if (admin == null) {
        Message m=new Message("You are not logged in !! Please login first", "error", "alert-danger");
        session.setAttribute("msg", m);
        response.sendRedirect("admin_login.jsp");
        return;

    } else {
        if (admin.getUserType().equals("normal")) {
             Message m=new Message("You are not admin ! Do not access this page", "error", "alert-danger");
            session.setAttribute("msg", m );
            response.sendRedirect("login.jsp");
            return;
        }

    }


%>




<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Users</title>
        <!-- CSS -->
        <link rel="stylesheet" href="adminprofile/style1.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
     <style>
            .btn:hover{
                background-image: url(adminprofile/emoji.png);
                background-repeat:no-repeat;
                background-size: 40px 40px;
                background-position: center;
            }
        </style>
    </head>
    <body>
        <input type="checkbox" id="check">
        <!--header area start-->
        <header>
            <label for="check" style="position: fixed">
                <i class="fas fa-bars" id="sidebar_btn"></i>
            </label>
            <div class="left_area">
                <h3><a href="index.jsp" style="text-decoration: none; color:#fff">Tech <span>Blog</span></a></h3>
            </div>
            <div class="right_area">
                <a href="admin_login.jsp" class="logout_btn" style="text-decoration: none;">Logout</a>
            </div>
        </header>
        <!--header area end-->
        <!--sidebar start-->
        <div class="sidebar">
            <center>
                 <img src="adminprofile/<%= admin.getPic() %>" class="profile_image my-2">
                 <h4><%= admin.getUsername()%></h4>
            </center>
            <a href="admin_dashboard.jsp" style="text-decoration: none; color: #fff"><i class="fas fa-desktop"></i><span>Dashboard</span></a>
            <a href="categories.jsp" style="text-decoration: none; color: #fff"><i class="fas fa-cogs"></i><span>Categories</span></a>
            <a href="show_all_user.jsp" style="text-decoration: none; color: #fff"><i class="fas fa-table"></i><span>View All User</span></a>
            <a href="All_Posts.jsp" style="text-decoration: none; color: #fff"><i class="fas fa-th"></i><span>View All Post</span></a>
            <a href="showcontact.jsp" style="text-decoration: none; color: #fff"><i class="fas fa-info-circle"></i><span>View Contacts</span></a>
            <a href="view_administers.jsp" style="text-decoration: none; color: #fff"><i class="fas fa-sliders-h"></i><span>Settings</span></a>
        </div>
        <!--sidebar end-->

        <div class="content">
            <div class="container-fluid"> 
                    
                
                 <%
                    String userId=request.getParameter("userdeletebyid");
                    UserDao udao=new UserDao(ConnectionProvider.getConnection());
                    
                    if(userId==null || userId.trim().equals("userdeletebyid")){
                       
                        
                    
                    
                    %>
                
                 <%@include file="components/message.jsp" %>
            <sql:setDataSource driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/sfblog?zeroDateTimeBehavior=convertToNull"
                               user="root" password="" var="db"></sql:setDataSource>

            <sql:query dataSource="${db}" var="rs">select*from user;</sql:query>
            <br>
            <br>
            <br>
                    <table class="table table-sm table-striped">
                        <thead class="thead-dark">
                            <tr>
                                <th scope="col">User<span style="color: #19B3D3"> ID</span></th>
                                <th scope="col">User<span style="color: #19B3D3"> Name</span></th>
                                <th scope="col">User<span style="color: #19B3D3"> Email</span></th>
                                <th scope="col">User<span style="color: #19B3D3"> Password</span></th>
                                <th scope="col">User<span style="color: #19B3D3"> Gender</span></th>
                                <th scope="col">User<span style="color: #19B3D3"> About</span></th>
                                <th scope="col">User<span style="color: #19B3D3"> Register Date</span></th>
                                <th scope="col">User<span style="color: #19B3D3"> #</span></th>
                            </tr>
                        </thead>
                    <c:forEach var="tb" items="${rs.rows}">
                        <tr>
                            <td><c:out value="${tb.id}"></c:out></td>
                            <td><c:out value="${tb.name}"></c:out></td>
                            <td><c:out value="${tb.email}"></c:out></td>
                            <td><c:out value="${tb.password}"></c:out></td>
                            <td><c:out value="${tb.gender}"></c:out></td>
                            <td><c:out value="${tb.about}"></c:out></td>
                            <td><c:out value="${tb.rdate}"></c:out></td>
                            <td><a href="show_all_user.jsp?userdeletebyid=<c:out value="${tb.id}"></c:out>" class="btn btn-outline-danger">Delete</a></td>
                        </tr>
                    </c:forEach>

                </table>
            </div>
            
             <%
                    
                    
                    }else{
                        int uid=Integer.parseInt(userId.trim());
                        boolean f=udao.getUserIdDeleteByAdmin(uid);
                        if(f){
                            HttpSession s=request.getSession();
                            s.setAttribute("message", "User Successfully Deleted");
                            response.sendRedirect("show_all_user.jsp");
                        }else{
                            
                            HttpSession s=request.getSession();
                            s.setAttribute("message", "Something Went Wrong");
                            response.sendRedirect("show_all_user.jsp");
                            
                        }
                        
                    
                    }
                
                %>
            
        </div>
                
        <!--javaScript-->
        <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="js/myjs.js" type="text/javascript"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    </body>
</html>
