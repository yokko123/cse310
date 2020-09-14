<%-- 
    Document   : login
    Created on : Aug 27, 2020, 2:05:57 PM
    Author     : yokko
--%>
<%response.setHeader("Cache-control","no-cache,no-store,must-revalidate");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>login</title>
        <link rel="stylesheet" href="stylelogin.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
        <script src="https://use.fontawesome.com/4aed5cf91c.js"></script>
    </head>
    <body>
        <!--Background Image-->
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="img-area">

                    </div>
                </div>
            </div>
        </div>
        <!--Logo top left-->
        <div class="container">
            <div class="row">
                <div class="col-lg-6">
                    <div class="logo">
                        <a href="/cse310demo/index.jsp"><img src="image/logo.png" alt=""></a>
                    </div>
                </div>
            </div>
        </div>
       
        <div class="container">
            <div class="row">
                <div class="box">
                    <h2>Log in</h2>
                    <form action="/cse310demo/LoginServlet" method="post">
                        <div class="inputBox">
                            <input type="text" required="" name="email">
                            <label for="">Email</label>
                        </div>
                        <div class="inputBox">
                            <input type="password" required="" name="password">
                            <label for="">Password</label>
                        </div>
                        <input type="submit" value="Login" onclick="logout()">
                        <p>Don't have an account?<a href="/cse310demo/signup/signup.jsp">SignUp</a> here</p>
                    </form>
                </div>
            </div>
        </div>
        
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
    </body>
</html>