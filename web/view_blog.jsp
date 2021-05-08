<%@page import="com.sf.blog.dao.LikeDao"%>
<%@page import="java.text.DateFormat"%>
<%@page import="com.sf.blog.dao.UserDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.sf.blog.entities.Category"%>
<%@page import="com.sf.blog.entities.User"%>
<%@page import="java.util.List"%>
<%@page import="com.sf.blog.entities.Posts"%>
<%@page import="com.sf.blog.helper.ConnectionProvider"%>
<%@page import="com.sf.blog.dao.PostDao"%>
<%@page errorPage="error_page.jsp" %>
<%
    User user = (User) session.getAttribute("currentUser");

    if (user == null) {
        response.sendRedirect("login_page.jsp");
    }
%>

<%
    int pid = Integer.parseInt(request.getParameter("post_id"));
    PostDao dao = new PostDao(ConnectionProvider.getConnection());
    List<Posts> post;
    post = dao.getPostByPostId(pid);
    for (Posts ps : post) {
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%= ps.getpTitle()%> || Learn by TechBlog</title>
        <!--css-->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            .post-title{
                font-weight: 100;
                font-size: 30px;
            }
            .post-content{
                font-weight: 100;
                font-size: 20px;
            }
            .post-date{
                font-style: italic;
                font-weight: bold;
            }
            .user-info{
                font-size: 20px;
            }
            .user-row{
                border: 1px solid #e2e2e2;
                padding-top: 15px;
            }

        </style>

    <div id="fb-root"></div>
    <script async defer crossorigin="anonymous" src="https://connect.facebook.net/en_GB/sdk.js#xfbml=1&version=v9.0" nonce="soMJBN6O"></script>

    <div id="fb-root"></div>
    <script async defer crossorigin="anonymous" src="https://connect.facebook.net/en_US/sdk.js#xfbml=1&version=v9.0" nonce="BZO7Lfkh"></script>


</head>
<body>
    <!--navbar-->
    <nav class="navbar navbar-expand-lg navbar-dark primary-background">
        <a class="navbar-brand" href="index.jsp"><span class="fa fa-star"></span> Tech Blog</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="profile.jsp"><span class="fa fa-user"></span><%= user.getName()%></a>
                </li>

                <li class="nav-item active">
                    <a class="nav-link" href="index.jsp"><span class="fa fa-home"></span> Home</a>
                </li>

                <li class="nav-item active">
                    <a class="nav-link" href="about.jsp"><span class="fa fa-group"></span> About</a>
                </li>

                <li class="nav-item active">
                    <a class="nav-link" href="contact.jsp"><span class="fa fa-id-badge"></span> Contact</a>
                </li>
            </ul>

            <ul class="navbar-nav mr-right">

                <li class="nav-item active">
                    <a class="nav-link" href="#!" data-toggle="modal" data-target="#profile-modal"><span class="fa fa-user-circle"></span> <%=user.getName()%></a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link" href="LogoutServlet"><span class="fa fa-sign-out"></span> Logout</a>
                </li>
            </ul>

        </div>
    </nav>

    <!--end of navbar-->
    
    
    <!--main content of body-->
    <div class="container-fluid">
        <div class="row">
            
           <div class="col-md-6 offset-md-3 mt-4">


                <div class="card">

                    <div class="card-header text-white primary-background">

                        <h4 class="post-title"><%= ps.getpTitle()%></h4>

                    </div>


                        <img class="card-img-top mt-4" src="blog_pics/<%= ps.getpPic()%>" alt="Card image cap">

                    <div class="card-body">

                        <div class="row my-2 user-row">

                            <div class="col-md-8">

                                <%
                                    UserDao dao1 = new UserDao(ConnectionProvider.getConnection());

                                %>

                                <p class="user-info"><a href="#!"><%= dao1.getUserIdByUserId(ps.getUserId()).getName()%></a> has posted:</p> 
                            </div>

                            <div class="col-md-4">
                                <p class="post-date"><%= DateFormat.getDateTimeInstance().format(ps.getpDate())%></p>
                            </div>

                        </div>


                        <p class="post-content"><%= ps.getpContent()%></p>

                        <div class="post-code">
                            <pre><%= ps.getpCode()%></pre>
                        </div>
                    </div>

                    <%

                        LikeDao ldao = new LikeDao(ConnectionProvider.getConnection());

                    %>

                    <div class="card-footer">
                        <!--button..-->
                        <a href="#" onclick="doLike(<%= ps.getPid()%>,<%= user.getId()%>)" class="btn btn-outline-primary btn-sm"><i class="fa fa-thumbs-o-up"><span class="like-counter"><%= ldao.countLikeOnPost(ps.getPid())%></span></i></a>  
                    </div>

                  
                    <div class="card-footer">
                        <div class="fb-comments" data-href="http://localhost:8080/SFBlog/view_blog.jsp?post_id=<%= ps.getPid()%>" data-numposts="5" data-width=""></div>
                    </div>

                </div>




            </div>
                    
                    
                    
            <%
                }

            %>
        </div>
    </div>
    <!--end main content-->

    <!--Start Profile Modal -->
    <div class="modal fade" id="profile-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header primary-background text-white">
                    <h5 class="modal-title" id="exampleModalLabel">TechBlog</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="container text-center">
                        <img src="pics/<%= user.getProfile()%>" width="100px" class="img-fluid" style=" border-radius: 50%">
                        <h5 class="modal-title mt-2" id="exampleModalLabel"><%= user.getName()%></h5>

                        <!--profile details show-->
                        <div id="profile-details">
                            <table class="table table-striped mt-2">

                                <tbody>
                                    <tr>
                                        <th scope="row">ID</th>
                                        <td><%= user.getId()%></td>

                                    </tr>

                                    <tr>
                                        <th scope="row">About</th>
                                        <td><%= user.getAbout()%></td>

                                    </tr>

                                    <tr>
                                        <th scope="row">Gender</th>
                                        <td><%= user.getGender().toUpperCase()%></td>

                                    </tr>

                                    <tr>
                                        <th scope="row">Email</th>
                                        <td><%= user.getEmail()%></td>

                                    </tr>

                                    <tr>
                                        <th scope="row">Register on</th>
                                        <td><%= user.getDateTime()%></td>

                                    </tr>

                                </tbody>
                            </table>
                        </div>

                        <!--profile edit-->
                        <div id="profile-edit" style="display: none">
                            <div class="container">
                                <div class="alert alert-primary" role="alert">Edit Profile Carefully</div>
                                <form action="EditServlet" method="POST" enctype="multipart/form-data">
                                    <table class="table">
                                        <tr>
                                            <th>#ID</th>
                                            <td><%= user.getId()%></td>
                                        </tr>
                                        <tr>
                                            <th>Name</th>
                                            <td><input class="form-control" type="text" name="user_name" value="<%= user.getName()%>"></td>
                                        </tr>
                                        <tr>
                                            <th>About</th>
                                            <td><textarea row="5" class="form-control" type="text" name="user_about"><%= user.getAbout()%></textarea></td>
                                        </tr>
                                        <tr>
                                            <th>Email</th>
                                            <td><input class="form-control" type="text" name="user_email" value="<%= user.getEmail()%>"></td>
                                        </tr>
                                        <tr>
                                            <th>Password</th>
                                            <td><input class="form-control" type="text" name="user_password" value="<%= user.getPassword()%>"></td>
                                        </tr>
                                        <tr>
                                            <th>Edit Profile</th>
                                            <td><input class="form-control" type="file" name="image" value="<%= user.getProfile()%>"></td>
                                        </tr>

                                    </table>
                                    <div class="container">
                                        <button type="submit" class="btn btn-outline-primary">Save</button>
                                    </div>
                                </form>
                            </div>
                        </div>

                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button id="edit-profile-button" type="button" class="btn btn-primary">Edit</button>
                </div>
            </div>
        </div>
    </div>

    <!--end modal-->

    <!--add post modal-->

    <!-- Modal -->
    <div class="modal fade" id="add-post-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header primary-background text-white">
                    <h5 class="modal-title" id="exampleModalLabel">Provide the post details</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form id="add-post-form" action="AddPostServlet" method="POST">

                        <div class="form-group">

                            <select class="form-control" name="cid">
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
                            <input name="pTitle" type="text" placeholder="Enter your post title" class="form-control">
                        </div>

                        <div class="form-group">
                            <textarea name="pContent" class="form-control" style="height: 200px;" placeholder="Enter your content"></textarea>
                        </div>

                        <div class="form-group">
                            <textarea name="pCode" class="form-control" style="height: 200px;" placeholder="Enter your program code(if any)"></textarea>
                        </div>

                        <div class="form-group">
                            <label>select your pic..</label>
                            <br>
                            <input type="file" name="pic">
                        </div>

                        <div class="container text-center">
                            <button class="btn btn-outline-primary" type="submit">POST</button>
                        </div>    

                    </form>
                </div>


            </div>
        </div>
    </div>
    <!--end post modal-->







    <!--javaScript-->
    <!--facebook like-->
    <div id="fb-root"></div>
    <script async defer crossorigin="anonymous" src="https://connect.facebook.net/en_US/sdk.js#xfbml=1&version=v9.0" nonce="wQ4sAKAs"></script>
    <script src="js/myscript.js" type="text/javascript"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script src=https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/10.12.0/sweetalert2.all.js></script>
    <script>
                                    $(document).ready(function () {
                            //alert("clicked") 
                            let
                                    editStatus = false;
                                    $('#edit-profile-button').click(function () {
                            if (editStatus == false) {
                            $('#profile-details').hide();
                                    $('#profile-edit').show();
                                    editStatus = true;
                                    $(this).text("Back");
                            } else {
                            $('#profile-details').show();
                                    $('#profile-edit').hide();
                                    editStatus = false;
                                    $(this).text("Edit");
                            }
                            })
                            });</script>

    <!--now add post js-->
    <script>
                $(document).ready(function () {
        $('#add-post-form').on('submit', function (Event) {
//                    this code gets called when form is submitted..
        Event.preventDefault();
                let form = new FormData(this);
//                    now requesting to server
                $.ajax({
                url: "AddPostServlet",
                        type: "POST",
                        data: form,
                        success: function (data, textStatus, jqXHR) {
                        //success..
                        console.log(data);
                                if (data.trim() == 'done') {
                        swal("Good job!", "Save Succfully", "success").then((value) = > {
                        window.location = "profile.jsp";
                        })


                        }
                        else {
                        swal("Error!", "Something went wrong!", "error").then((value) = > {
                        window.location = "profile.jsp";
                        })

                        }

                        },
                        error: function (jqXHR, textStatus, errorThrown) {
//                                    error
                        swal("Error!", "Something went wrong!", "error");
                        },
                        processData: false,
                        contentType: false

                })

        })
        })
    </script>


</body>
</html>
