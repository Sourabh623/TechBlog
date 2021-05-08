<%@page import="com.sf.blog.helper.Helper"%>
<%@page import="com.sf.blog.entities.Posts"%>
<%@page import="java.util.List"%>
<%@page import="com.sf.blog.dao.PostDao"%>
<%@page import="com.sf.blog.helper.ConnectionProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>
        <!--css-->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

        <style>
            .banner-background{
                clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 70%, 0 100%, 0 0);
            }
        </style>

    </head>
    <body>
        
        <%
            Connection con = ConnectionProvider.getConnection();
        %>
        <%=con%>
           
        <!--navbar-->
        <%@include file="normal_navbar.jsp"%> 

        <!--banner start-->

        <div class="container-fluid p-0 m-0 banner-background">
            <div class="jumbotron primary-background">
                <div class="container">

                    <h3 class="display-3">Welcome to TechBlog</h3>
                    <p>A programming language is a formal language comprising a set of instructions that produce various kinds of output. Programming languages are used in computer programming to implement algorithms.</p>
                    <p>Most programming languages consist of instructions for computers. There are programmable machines that use a set of specific instructions, rather than general programming languages.</p>
                    <button class="btn btn-outline-light btn-lg"><span class="fa fa-user-plus"></span> Start it's Free</button>
                    <a href="login_page.jsp" class="btn btn-outline-light btn-lg"><span class="fa fa-user-circle fa-spin"></span> Login</a>


                </div>
            </div>
        </div>
        <!--banner end-->

        <%

            String cat = request.getParameter("categoryId");
            //out.println(postid);
            PostDao pdao = new PostDao(ConnectionProvider.getConnection());
            List<Posts> plist = null;

            if (cat == null || cat.trim().equals("all")) {

                plist = pdao.getAllPosts();
            } else {

                int cid = Integer.parseInt(cat.trim());
                plist = pdao.getPostByCatId(cid);

            }

            ArrayList<Category> clist = pdao.getAllCategories();

        %>

        <!--show category-->
        <div class="row">

            <div class="col-md-12">

                <nav class="navbar navbar-expand-lg navbar-dark primary-background mb-4">
                    <a class="navbar-brand" href="index.jsp?catgoryId=all">All Posts</a>
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarText">
                        <ul class="navbar-nav mr-auto">
                            <li class="nav-item active">
                                <a class="nav-link" href="#"><span class="sr-only">(current)</span></a>
                            </li>
                            <%                        for (Category c : clist) {


                            %>
                            <li class="nav-item">
                                <a class="nav-link"  href="index.jsp?categoryId=<%= c.getCid()%>" style="text-decoration: none; color: white;"><%= c.getName()%></a>
                            </li>

                            <%

                                }


                            %>

                        </ul>

                    </div>
                </nav>

            </div>
        </div>





        <!--show all posts-->
        <!--create cards-->
        <div class="col-md-12 mb-4">
            <!--row-->
            <div class="row">

                <div class="col-md-12">

                    <div class="card-columns ">
                        <!--traversing products-->
                        <%                                for (Posts p : plist) {


                        %>   
                        <div class="card product-card">

                            <div class="container text-center">

                                <img class="img-fluid mt-2" style="height: auto; max-width: 100%;" src="blog_pics/<%= p.getpPic()%>" alt="Card image cap">
                            </div>

                            <div class="card-body">

                                <h5 class="card-title"><%= p.getpTitle()%></h5>

                                <div class="card-text"><%= Helper.get10Words(p.getpContent())%></div>

                            </div>

                            <div class="card-footer">
                                <a href="view_blog.jsp?post_id=<%= p.getPid() %>" type="btn" class="btn btn-outline-primary">Read More</a>

                            </div>    

                        </div>

                        <%
                            }

                            if (plist.size() == 0) {


                        %>
                        <div class="text-center">
                            <img src="pics/sorry.png" class="card-img-top m-2 img-fluid" alt="Card image cap">
                            <h3 style="text-indent: 50px;font-family: 'Roboto', sans-serif;">No posts available in this category.</h3>
                        </div>


                        <%                                    }

                        %>
                        <!--end cards-->

                    </div>

                </div>


            </div>
        </div>



        <!--about page here-->
        <%@include file="components/footer.jsp" %>



        <!--javaScript-->
        <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
       

    </body>
</html>
