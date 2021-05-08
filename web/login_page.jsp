<%-- 
    Document   : login_page
    Created on : Nov 20, 2020, 7:09:01 PM
    Author     : Admin
--%>

<%@page import="com.sf.blog.entities.Message"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


    </head>
    <body>
        <!--navbar-->
        <%@include file="normal_navbar.jsp"%>

        <div class="container-fluid mb-4">
            <!-- setting the message-->

            <div class="row mt-5">
            
                <div class="col-md-4 offset-md-1">
                    <%
                Message m = (Message) session.getAttribute("msg");

                if (m != null) {

            %>


            <div class="alert <%=m.getCssClass()%> alert-dismissible fade show"  role="alert">
                <%=m.getContent()%>
                
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>


            <%

                    session.removeAttribute("msg");
                }


            %>

                    <div class="card-body">
                        <%@include file="components/message.jsp"%>
                        <h3 class="text-center my-3">Login here</h3>

                        <form action="LoginServlet" method="post">
                            <div class="form-group">
                                <label for="email">Email address</label>
                                <input type="email" class="form-control" id="email" name="email" aria-describedby="emailHelp" placeholder="Enter Your Email" required>
                                <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                            </div>

                            <div class="form-group">
                                <label for="exampleInputPassword1">Password</label>
                                <input type="password" name="password" class="form-control" id="Password1" placeholder="Password" required>
                            </div>

                            <div class="container mt-4">
                                <button type="submit" class="btn btn-outline-primary">Login</button>
                                <button type="reset" class="btn btn-outline-danger">Reset</button>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="col-md-4">
                    <img src="img/log.svg" width="650px;"  heigh=100px; class="image" alt="" />
                </div>
            </div>
        </div>


                        
   <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
                        
                        
    </body>
</html>
