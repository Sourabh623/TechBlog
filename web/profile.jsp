
<%@page import="com.sf.blog.entities.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.sf.blog.helper.ConnectionProvider"%>
<%@page import="com.sf.blog.dao.PostDao"%>
<%@page import="com.sf.blog.entities.Message"%>
<%@page import="com.sf.blog.entities.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="error_page.jsp" %>
<%
    User user = (User) session.getAttribute("currentUser");

    if (user == null) {
        response.sendRedirect("login_page.jsp");
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profile Page</title>

        <!--css-->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


    </head>
    <body>

        <!--start navbar-->

        <%@include file="components/navbar.jsp"%>

        <!--end of navbar-->

        <!-- setting the message-->

        <%            Message m = (Message) session.getAttribute("msg");

            if (m != null) {

        %>


        <div class="alert <%=m.getCssClass()%> alert-dismissible fade show mt-2"  role="alert">
                <%=m.getContent()%>
                
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>

        <%
                session.removeAttribute("msg");
            }


        %>

        <!--main body of the page-->

        <main>
            <div class="container-fluid">
                <div class="row mt-4">
                    <!--first col-->
                    <div class="col-md-3">
                        <!--categories-->
                        <div class="list-group">
                            <a href="#" onclick="getPosts(0), this" class="c-link list-group-item list-group-item-action active">
                                All Posts
                            </a>
                            <%                                PostDao pd = new PostDao(ConnectionProvider.getConnection());
                                ArrayList<Category> list1 = pd.getAllCategories();
                                for (Category cc : list1) {
                            %>
                            <a href="#" onclick="getPosts(<%= cc.getCid()%>, this)" class="c-link list-group-item list-group-item-action"><%= cc.getName()%></a>

                            <%
                                }
                            %>
                        </div>
                    </div>
                    <!--second col-->
                    <div class="col-md-8">
                        <div class="container text-center" id="loader">
                            <i class="fa fa-refresh fa-4x fa-spin"></i>
                            <h4 class="mt-2">Loading...</h4>
                        </div>

                        <div class="container-fluid" id="posts-container">
                            <!--posts show--> 
                        </div>

                    </div>

                </div>
            </div>
        </main>

        <!--start modal-->



        <!--Profile Modal -->
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
        <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
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
                    let
                    form = new FormData(this);
//                    now requesting to server
                    $.ajax({
                    url: "AddPostServlet",
                            type: "POST",
                            data: form,
                            success: function (data, textStatus, jqXHR) {
                            //success..
                            console.log(data);
                                    if (data.trim() == 'done') {
                            swal("Good job!", "Save Succfully", "success").then((value) => {
                            window.location = "profile.jsp";
                            })


                            }
                            else {
                            swal("Error!", "Something went wrong!", "error").then((value) => {
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
        <!--loading posts using ajax-->
        <script>
                    function getPosts(catId, temp){
                    $('#loader').show();
                            $('#posts-container').hide();
                            $('.c-link').removeClass('active')

                            $.ajax({
                            url:"load_posts.jsp",
                                    data:{cid:catId},
                                    success: function (data, textStatus, jqXHR) {
                                    console.log(data)
                                            $('#loader').hide();
                                            $('#posts-container').show();
                                            $('#posts-container').html(data);
                                            $(temp).addClass('active')
                                    }
                            })
                    }

            $(document).ready(function (e){
            let allPostsRef = $('.c-link')[0]
                    getPosts(0, allPostsRef)

            })
        </script>


    </body>
</html>
