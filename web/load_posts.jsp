<%@page import="com.sf.blog.helper.Helper"%>
<%@page import="com.sf.blog.entities.User"%>
<%@page import="com.sf.blog.dao.LikeDao"%>
<%@page import="java.util.List"%>
<%@page import="com.sf.blog.entities.Posts"%>
<%@page import="com.sf.blog.helper.ConnectionProvider"%>
<%@page import="com.sf.blog.dao.PostDao"%>

<html>
    <head>

    </head>
    <body>
        <div class="container">

            <div class="row">
                <%

                    User user = (User) session.getAttribute("currentUser");
                    PostDao dao = new PostDao(ConnectionProvider.getConnection());
                    int cid = Integer.parseInt(request.getParameter("cid"));
                    List<Posts> post = null;
                    if (cid == 0) {
                        post = dao.getAllPosts();
                    } else {
                        post = dao.getPostByCatId(cid);
                    }
                    if (post.size() == 0) {
                %>

                <div class="container-fluid text-center">
                    <img src="pics/sorry.png" width="360px" height="306px" alt="Card image cap">
                    <h3 style="text-indent: 50px;font-family: 'Roboto', sans-serif;">No posts in this category.</h3>
                </div>

                <% }
                    for (Posts ps : post) {
                %>

                <!--posts load here-->
                <div class="col-md-6 mt-2 container-fluid">

                    <div class="card" style="width: 18rem;">
                        <img class="card-img-top img-fluid" src="blog_pics/<%= ps.getpPic()%>" alt="Card image cap">
                        <div class="card-body">
                            <h5 class="card-title"><%= ps.getpTitle()%></h5>
                            <p class="card-text"><%=  Helper.get10Words(ps.getpContent())%></p>



                            <%

                                LikeDao ldao = new LikeDao(ConnectionProvider.getConnection());

                            %>


                            <a href="#" onclick="doLike(<%= ps.getPid()%>,<%= user.getId()%>)" class="btn btn-outline-primary btn-sm"><i class="fa fa-thumbs-o-up"><span class="like-counter"><%= ldao.countLikeOnPost(ps.getPid())%></span></i></a>
                           
                            <a href="view_blog.jsp?post_id=<%= ps.getPid()%>" class="btn btn-outline-primary btn-sm">Read More</a>


                        </div>
                    </div>

                </div>



                <%
                    }
                %>

            </div>
        </div>

        <script src="js/myscript.js" type="text/javascript"></script>
        <script src=https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/10.12.0/sweetalert2.all.js></script>

    </body>
</html>