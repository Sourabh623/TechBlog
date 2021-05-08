  
<%@page import="com.sf.blog.entities.User"%>
<%

    User user1 = (User) session.getAttribute("currentUser");


%>



<!--navbar-->
<nav class="navbar navbar-expand-lg navbar-dark primary-background">
    <a class="navbar-brand" href="index.jsp"><span class="fa fa-star"></span> Tech Blog</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">

        <%                    if (user1 == null) {

        %>
        <ul class="navbar-nav mr-auto">

            <li class="nav-item active">
                <a class="nav-link" href="index.jsp"><span class="fa fa-home"></span> Home</a>
            </li>
            <li class="nav-item active">
                <a class="nav-link" href="#"><span class="fa fa-group"></span> About</a>
            </li>

            <li class="nav-item active">
                <a class="nav-link" href="#"><span class="fa fa-id-badge"></span> Contact</a>
            </li>
            
            <li class="nav-item active">
                <a class="nav-link" href="login_page.jsp"><span class="fa fa-user-circle"></span> Login</a>
            </li>
            
            <li class="nav-item active">
                <a class="nav-link" href="signup_page.jsp"><span class="fa fa-user-plus"></span> Signup</a>
            </li>
            <%   
            }  else{  
        %>

            
        </ul>
        
        

        <ul class="navbar-nav ml-auto">
            
            <li class="nav-item active">
                <a class="nav-link" href="#" data-toggle="modal" data-target="#add-post-modal"><span class="fa fa-plus"></span> Add Post</a>
            </li>

            <li class="nav-item active">
                <a class="nav-link" href="#!" data-toggle="modal" data-target="#profile-modal"><span class="fa fa-user-circle"></span><%=user1.getName()%></a>
            </li>
            <li class="nav-item active">
                <a class="nav-link" href="LogoutServlet"><span class="fa fa-sign-out"></span> Logout</a>
            </li>
        </ul>
      <%
      
        }
      %>
    </div>
</nav>