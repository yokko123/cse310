<%
    response.setHeader("Cache-Control", "no-cache");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", -1);
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>

        <link rel="stylesheet" href="style.css">
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
                        <a href="index.jsp"><img src="image/logo.png" alt=""></a> 
                    </div>
                </div>
            </div>
        </div>
        <!--logo 2-->
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="logo2">
                        <img src="image/logo2.png" alt="">
                    </div>
                </div>
            </div>
        </div>
        <!--Search box and button-->
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="search-box">
                        <button class="search-btn" onclick="place()" id="search-btn"><a href="#"> <img src="https://img.icons8.com/doodle/35/000000/user-location.png"/></a></button>
                        <form action="IndexServlet" method="post">
                            <input class="search-txt" type="text" placeholder="Type to search" id="search-box" name="search" required>

                            <button id="find-shops" class="btn btn-dark">Find Shops</button>
                        </form>

                    </div>
                </div>
            </div>
        </div>
        <!--   <div class="container">
               <div class="row">
                   <div class="col-lg-6">
                       <div class="button">
                           <button class="log_in">
                              <a href="login/login.jsp"><img src="image/log_in.png" alt=""></a> 
                           </button>
                           <button class="sign_up">
                              <a href="signup/signup.jsp"><img src="image/sign_up.png" alt=""></a> 
                           </button>
                       </div>
                   </div>
               </div>
           </div>-->
        <script src= 
                "https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js">
        </script> 
        <script src="script.js"></script>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
    </body>
</html>