
<%@page import="com.sf.blog.entities.Contact"%>
<%@page import="com.sf.blog.dao.ContactDao"%>
<%@page import="com.sf.blog.entities.Message"%>
<%@page import="com.sf.blog.dao.AdminDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.sf.blog.dao.UserDao"%>
<%@page import="com.sf.blog.entities.Posts"%>
<%@page import="com.sf.blog.entities.Category"%>
<%@page import="java.util.List"%>
<%@page import="com.sf.blog.dao.PostDao"%>
<%@page import="com.sf.blog.helper.ConnectionProvider"%>
<%@page import="com.sf.blog.entities.User"%>
<%@page import="com.sf.blog.entities.Admin"%>
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
<html lang="en" dir="ltr">
    <head>
        <meta charset="utf-8">
        <title>Dashboard</title>
        <link rel="stylesheet" href="adminprofile/style1.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
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
                <a href="AdminLogoutServlet" class="logout_btn" style="text-decoration: none;">Logout</a>
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



        <%

            UserDao udao = new UserDao(ConnectionProvider.getConnection());
            List<User> ulist = udao.getAllUser();

            PostDao pdao = new PostDao(ConnectionProvider.getConnection());
            List<Category> clist = pdao.getAllCategories();

            List<Posts> plist = pdao.getAllPosts();
            
            AdminDao adao=new AdminDao(ConnectionProvider.getConnection());
            List<Admin> alist= adao.getAllAdmin();
            
            ContactDao cdao=new ContactDao(ConnectionProvider.getConnection());
            List<Contact> conlist=cdao.getAllContacts();

        %>

        <!--main content-->
        <div class="content">
            <!--card-->
            <div class="container-fluid">
                <%@include file="components/message.jsp" %>
                <div class="row">
                    <div class="col-md-4" style="margin-top: 110px;">
                        <div class="card" style="width: 18rem;">
                            <div class="card-body text-center">
                                <div class="container">
                                    <img src="adminprofile/img/teamwork.png" class="container-fluid" style="max-width:  125px;" alt=""/>
                                </div>
                                <h5 class="card-title">All Users</h5>
                                <h6 class="card-subtitle mb-2 text-muted"><%= ulist.size()%></h6>
                                <a href="show_all_user.jsp" class="card-link">View Users</a>
                                <a href="#" class="card-link">Add User</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4" style="margin-top: 110px;">
                        <div class="card" style="width: 18rem;">
                            <div class="card-body text-center">
                                <div class="container">
                                    <img src="adminprofile/img/tasks.png" class="container-fluid" style="max-width:  125px;" alt=""/>
                                </div>
                                <h5 class="card-title">All Categories</h5>
                                <h6 class="card-subtitle mb-2 text-muted"><%= clist.size()%></h6>
                                <a href="categories.jsp" class="card-link">View Categories</a>
                                <a href="#" class="card-link" data-toggle="modal" data-target="#add-category-modal">Add Category</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4" style="margin-top: 110px;">
                        <div class="card" style="width: 18rem;">
                            <div class="card-body text-center">
                                <div class="container">
                                    <img src="adminprofile/img/posts.png" class="container-fluid" style="max-width:  125px;" alt=""/>
                                </div>
                                <h5 class="card-title">All Posts</h5>
                                <h6 class="card-subtitle mb-2 text-muted"><%= plist.size()%></h6>
                                <a href="All_Posts.jsp" class="card-link">View Posts</a>
                                <a href="#" class="card-link" data-toggle="modal" data-target="#add-post-modal">Add Post</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-4" style="margin-top: 70px;">
                        <div class="card" style="width: 18rem;">
                            <div class="card-body text-center">
                                <div class="container">
                                    <img src="adminprofile/img/team.png" class="container-fluid" style="max-width:  125px;" alt=""/>
                                </div>
                                <h5 class="card-title">Add secondary admin</h5>
                                <h6 class="card-subtitle mb-2 text-muted"><%= alist.size()%></h6>
                             
                                <a href="view_administers.jsp" class="card-link">View Admins</a>
                                <a href="#" class="card-link" data-toggle="modal" data-target="#add-admin-modal">Add Admin</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4" style="margin-top: 70px;">
                        <div class="card" style="width: 18rem;">
                            <div class="card-body text-center">
                                <div class="container">
                                    <img src="adminprofile/img/download.png" class="container-fluid" style="max-width:  125px;" alt=""/>
                                </div>
                                <h5 class="card-title">Contact Notification</h5>
                                <h6 class="card-subtitle mb-2 text-muted"><%= conlist.size()%></h6>
                                
                                <a href="#" class="card-link">View </a>
                                <a href="#" class="card-link">Delete</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4" style="margin-top: 70px;">
                        <div class="card" style="width: 18rem;">
                            <div class="card-body text-center">
                                <div class="container">
                                    <img src="adminprofile/img/send.png" class="container-fluid" style="max-width:  125px;" alt=""/>
                                </div>
                                <h5 class="card-title">Send Mail</h5>
                                <h6 class="card-subtitle mb-2 text-muted">Card subtitle</h6>
                               
                                <a href="#" class="card-link" data-toggle="modal" data-target="#send-mail-modal">Send Mail</a>
                                <a href="#" class="card-link">Another link</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!--add category modal-->  

            <!-- Modal -->
            <div class="modal fade" id="add-category-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Provide the category details</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">

                            <form action="AddCategoryServlet" method="POST">

                                <div class="form-group">
                                    <input name="name" type="text" placeholder="Enter your category name" class="form-control" required>
                                </div>

                                <div class="form-group">
                                    <textarea name="desc" class="form-control" style="height: 200px;" placeholder="Enter your category description" required></textarea>
                                </div>

                                <div class="container text-right">
                                    <button type="reset" class="btn btn-outline-danger">Reset</button>
                                    <button class="btn btn-outline-primary" type="submit">Save Category</button>
                                </div>    


                            </form>

                        </div>
                  

                    </div>
                </div>
            </div>

            <!--end category modal-->




            <!--add post modal-->




            <!-- Modal -->
            <div class="modal fade" id="add-post-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header primary-background">
                            <h5 class="modal-title" id="exampleModalLabel">Provide the post details</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <form id="add-post-form" action="AddPostServlet" method="POST">

                                <div class="form-group">

                                    <select class="form-control" name="cid" required="Select any category">
                                        <option selected disabled>---Select Categories---</option>
                                        <%
                                            PostDao postd = new PostDao(ConnectionProvider.getConnection());
                                            ArrayList<Category> list = postd.getAllCategories();
                                            for (Category c : list) {

                                        %> 
                                        <option value="<%= c.getCid()%>"><%= c.getName()%></option>
                                        <%
                                            }
                                        %>
                                    </select>

                                </div>

                                <div class="form-group">
                                    <input name="pTitle" type="text" placeholder="Enter your post title" class="form-control" required>
                                </div>

                                <div class="form-group">
                                    <textarea name="pContent" class="form-control" style="height: 200px;" placeholder="Enter your content" required></textarea>
                                </div>

                                <div class="form-group">
                                    <textarea name="pCode" class="form-control" style="height: 200px;" placeholder="Enter your program code(if any)"></textarea>
                                </div>

                                <div class="form-group">
                                    <label>select pic..</label>
                                    <br>
                                    <input type="file" name="pic">
                                </div>

                                <div class="container text-right">

                                    <button class="btn btn-outline-danger" type="reset">RESET</button>
                                    <button class="btn btn-outline-primary" type="submit">POST</button>
                                </div>    

                            </form>
                        </div>


                    </div>
                </div>
            </div>
            <!--end post modal-->


           <!--add secondary administer modal-->  

            <!-- Modal -->
            <div class="modal fade" id="add-admin-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Provide the admin details</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">

                            <form action="AddAdminServlet" method="POST" enctype="multipart/form-data">

                                <div class="form-group">
                                    <input name="name" type="text" placeholder="Enter your admin name" class="form-control" required>
                                </div>
                                
                                <div class="form-group">
                                    <input name="password" type="password" placeholder="Enter your password name" class="form-control" required>
                                </div>

                                
                                 <div class="form-group">
                                    <label>select pic..</label>
                                    <br>
                                    <input type="file" name="pic">
                                </div>

                                <div class="container text-right">
                                    <button type="reset" class="btn btn-outline-danger">Reset</button>
                                    <button class="btn btn-outline-primary" type="submit">Add Admin</button>
                                </div>    


                            </form>

                        </div>
                  

                    </div>
                </div>
            </div>

            <!--end category modal-->
            
            
           <!--send mail modal-->  

            <!-- Modal -->
            <div class="modal fade" id="send-mail-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Provide the admin details</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">

                            <!--start form-->
                             <form action="Send" method="POST">
                                 
                                 
                                  <div class="form-group">
                                      <input class="form-control" type="email" name="n1" placeholder="Enter sender email" required>
                                  </div>
                                 
                                  <div class="form-group">
                                     <input class="form-control" type="email" name="n2" placeholder="Reconfirm email" required>
                                  </div>
                                 
                                  <div class="form-group">
                                      <input class="form-control" type="password" name="n3" placeholder="Enter your email password" required>
                                  </div>
                                 
                                  <div class="form-group">
                                      <input class="form-control" type="text" name="n4" placeholder="Enter your Company Name" required>
                                  </div>
                                 
                                  <div class="form-group">
                                      <input class="form-control" type="text" name="n5" placeholder="Enter Subject" required>
                                  </div>
                                 
                                  <div class="form-group">
                                      <input class="form-control" type="text" name="n6" placeholder="Enter Content" required>
                                  </div>
                                 
                                  <div class="form-group">
                                      <input class="form-control" type="email" name="n7" placeholder="Enter Recipient Email" required>
                                  </div>
                                 <div class="text-center">
                                 <button type="reset" class="btn btn-outline-danger">Reset</button>
                                 <button type="submit" class="btn btn-outline-primary">Send</button>
                                 </div>
                             </form>
                            <!--end form-->

                        </div>
                  

                    </div>
                </div>
            </div>

            <!--end send mail modal-->



        </div>
        <!--javaScript-->
        <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

        
        
        
        
    </body>
</html>