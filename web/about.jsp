
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link href="css/aboutcss.css" rel="stylesheet" type="text/css"/>

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <style>
            .banner-background{
                clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 70%, 0 100%, 0 0);
            }
        </style>
    </head>
    <body>

        <%@include file="normal_navbar.jsp" %>

       

        <h2 style="text-align:center">Our Team</h2>
        <div class="row">
            <div class="column">
                <div class="card">
                    <img src="pics/s.png" alt="Jane" style="width:100%">
                    <div class="container">
                        <h2>Abhishek</h2>
                        <p class="title">Programmer</p>
                        <p>I am programmer.</p>
                        <p>abhishekdubey225@gmail.com</p>
                        <p><button class="button">Contact</button></p>
                    </div>
                </div>
            </div>
            <div class="column">
                <div class="card">
                    <img src="pics/hiker-man.svg" alt="Jane" style="width:88%">
                    <div class="container">
                        <h2>Piyush</h2>
                        <p class="title">DBA</p>
                        <p>I am database administrator.</p>
                         <p>piyush786@gmail.com</p>
                        <p><button class="button">Contact</button></p>
                    </div>
                </div>
            </div>
            <div class="column">
                <div class="card">
                    <img src="pics/p.png" alt="Jane" style="width:100%">
                    <div class="container">
                        <h2>anurag</h2>
                        <p class="title">Web Designer</p>
                        <p>I am web designer.</p>
                        <p>an86@gmail.com</p>
                        <p><button class="button">Contact</button></p>
                    </div>
                </div>
            </div>

       
        </div>



        <!--footer section-->

        <div class="about-section">
            <h1>About Us Page</h1>
            <p>Some text about who we are and what we do.</p>
            <p>Resize the browser window to see that this page is responsive by the way.</p>
        </div>

    </body>
</html>
