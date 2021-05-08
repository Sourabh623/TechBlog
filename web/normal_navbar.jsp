<%@page import="com.sf.blog.entities.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.sf.blog.entities.Posts"%>
<%@page import="com.sf.blog.dao.PostDao"%>
<%@page import="com.sf.blog.helper.ConnectionProvider"%>
<%@page import="com.sf.blog.dao.CategoryDao"%>
<nav class="navbar navbar-expand-lg navbar-dark  primary-background">
    <a class="navbar-brand" href="index.jsp"><span class="fa fa-star"></span> Tech Blog</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">

            <li class="nav-item active">
                <a class="nav-link" href="index.jsp"><span class="fa fa-home"></span> Home</a>
            </li>
            <li class="nav-item active">
                <a class="nav-link" href="about.jsp"><span class="fa fa-group"></span> About</a>
            </li>

            <li class="nav-item active">
                <a class="nav-link" href="contact.jsp"><span class="fa fa-id-badge"></span> Contact</a>
            </li>
            <li class="nav-item active">
                <a class="nav-link" href="admin_login.jsp"><span class="fa fa-user-circle"></span> Admin Login</a>
            </li>

            <li class="nav-item active">
                <a class="nav-link" href="login_page.jsp"><span class="fa fa-user-circle"></span> Login</a>
            </li>
            <li class="nav-item active">
                <a class="nav-link" href="signup_page.jsp"><span class="fa fa-user-plus"></span> Signup</a>
            </li>
        </ul>
        <form class="form-inline my-2 my-lg-0">
            <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
            <button class="btn btn-primary my-2 my-sm-0" type="submit">Search</button>
        </form>
    </div>
</nav>