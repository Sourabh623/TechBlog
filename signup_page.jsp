

<%@page import="com.sf.blog.entities.Message"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sign Up Page</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>

            .image {

                transition: transform 1.1s ease-in-out;
                transition-delay: 0.4s;
                image-resolution: from-image;


            }


        </style>

    </head>
    <body>
        <%@include file="normal_navbar.jsp"%>

        <div class="container-fluid">

            <div class="row mt-5">
                
                <div class="col-md-4 offset-md-1">
                    
                    
                    
                        <%
                            Message m = (Message) session.getAttribute("msg");

                            if (m != null) {

                        %>       

                        <div class="alert <%= m.getCssClass()%> alert-dismissible fade show" role="alert">
                            <%= m.getContent()%>
                            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>

                            <%
                                    session.removeAttribute("msg");
                                }
                            %>
                        
                    
                    <div class="card-body">
                        <h3 class="text-center my-3">Signup here</h3>

                            <form id="reg-form" action="SignupServlet" method="POST">
                                <div class="form-group">
                                    <label for="user">User Name</label>
                                    <input type="text" name="user_name" class="form-control" id="email" aria-describedby="emailHelp" placeholder="Enter Your Name" required>

                                </div>
                                <div class="form-group">
                                    <label for="">Email address</label>
                                    <input type="email" class="form-control" id="email" name="user_email" aria-describedby="emailHelp" placeholder="Enter Your Email" required>
                                    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                </div>

                                <div class="form-group">
                                    <label for="exampleInputPassword1">Password</label>
                                    <input type="password" name="user_password" class="form-control" id="Password1" placeholder="Password" required>
                                </div>


                                <div class="form-group">
                                    <label for="gender">Gender</label><br>
                                    <input type="radio"  name="gender" value="male"> Male
                                    <input type="radio"  name="gender" value="female"> Female
                                </div>

                                <div class="form-group">
                                    <textarea name="user_about" class="form-control" rows="2" placeholder="Enter something about yourself"></textarea>
                                </div>

                               
                                <div class="container text-center mt-2">
                                    <button type="submit" class="btn btn-outline-primary">Signup</button>
                                    <button type="reset" class="btn btn-outline-danger">Reset</button>
                                </div>

                            </form>
                        </div>


                    </div>
                    <div class="col-md-4">
                        <img src="img/register.svg" width="650px;"  heigh=100px; class="image" alt="" />
                    </div>
                </div>

            </div>


            <!--javaScript-->
            <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
            <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
            <script src="js/myjs.js" type="text/javascript"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
    </body>
</html>
