<%-- 
    Document   : checkout
    Created on : Sep 12, 2020, 11:13:15 PM
    Author     : yokko
--%>


<%@page import="newpackage.User"%>
<%@page import="newpackage.UserDatabase"%>
<%@page import="newpackage.ConnectionPro"%>
<% User user = (User) session.getAttribute("loguser");
    if (user == null) {
        response.sendRedirect("index.jsp");
    }
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="HandheldFriendly" content="true">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
        <script src="https://use.fontawesome.com/4aed5cf91c.js"></script>
        <link rel="stylesheet" href="checkout.css">
        <script src ="/cse310demo/cartjs/script.js"></script>
        <title>HomePage</title>

        <!--Navbar-->
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-12">
                <div id="navbar">
                    <nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark">
                        <a class="navbar-brand" href="/cse310demo/homepage/homepage.jsp"><img src="/cse310demo/image/logo.png" alt=""></a>
                        </button>
                        <div class="collapse navbar-collapse" id="navbarSupportedContent">
                            <ul class="navbar-nav mr-auto">

                                <li class="nav-item">
                                    <div class="search-box">
                                        <input class="search-txt" type="text" placeholder="Type to search" id="search-box">
                                        <button class="search-btn" onclick="place()" id="search-btn"><a href="#"><img src="https://img.icons8.com/plasticine/40/000000/search-more.png"/>
                                        </button> 
                                </li>

                                <li class="nav-item cart mr-2" data-toggle="modal" data-target="#cart">
                                    <a href="#">
                                        <img src="https://img.icons8.com/plasticine/48/000000/favorite-cart.png"/>
                                        <span class="cart-items mr-3" style="font-size: 15px; color: white;">(0)</span>
                                    </a>
                                </li>
                                <li class="nav-item dropdown" id="user">
                                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <img src="https://img.icons8.com/doodle/40/000000/user-male-circle.png"/>
                                    </a>
                                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                        <a class="dropdown-item" href="/cse310demo/user/profile.jsp">User Profile</a>
                                        <a class="dropdown-item" href="/cse310demo/index.jsp">Log Out</a>
                                    </div>
                                </li>
                            </ul>
                    </nav>
                </div>
            </div>
        </div>
    </div>
</div>

<!--checkout-->
<div class="container">
    <div class="row mt-5">

        <div class="col-lg-6">
            <!--card details-->
            <div class="card mt-5">
                <div class="card-body">
                    <h3 class="text-center mb-5">Selected Items</h3>
                    <div class="cart-body"></div> 

                </div>
            </div>
        </div>
        <!--Final Modal -->
            <div class="modal fade" id="final" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Congratulations!!</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <h3>Your Order has been placed. You will get your products within 1 hour.</h3>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            <button type="button" class="btn btn-primary" onclick="reset()">Okay</button>
                        </div>
                    </div>
                </div>
            </div>
        <div class="cl-lg-6"></div>
        <!--address form-->
        <div class="card mt-5">
            <div class="card-body">
                <h3 class="text-center mb-5">Your Shipping  Details  for Placing Order </h3>
                <form action="">
                    <div class="form-group">
                        <label for="exampleInputEmail1">Email address</label>
                        <input type="email" class="form-control" id="email" aria-describedby="emailHelp" placeholder="Enter email" value="<%=user.getEmail()%>">
                        <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                    </div>
                    <%
                        UserDatabase db = new UserDatabase(ConnectionPro.getConnection());

                    %>
                    <div class="form-group">
                        <label for="exampleInputEmail1">Your Name</label>
                        <input type="text" class="form-control" id="name" placeholder="Enter Name" value="<%=user.getName()%>">
                    </div>
                    <div class="form-group">
                        <label for="exampleInputEmail1">Phone</label>
                        <input type="text" class="form-control" id="name" placeholder="Phone" value="<%=user.getPhone()%>">
                    </div>
                    <div class="form-group">
                        <label for="exampleFormControlTextarea1">Detailed Address</label>
                        <textarea class="form-control" id="address" rows="3"></textarea>
                    </div>
                    <div class="form-group">
                        <label for="exampleFormControlTextarea1">Payment Method</label>
                        <select>
                            <option>Cash On Delivery</option>
                            <option>Bkash</option>
                            <option>Nagad</option>
                        </select>             
                    </div>
                    <div class="container text-center">
                        <button type="button" class="btn btn-success" data-toggle="modal" data-target="#final">Order now</button>
                    </div>
            </div>
            

        </div>
    </div>
</div>
</div>
</div>

</div>


<!-- Modal -->
<div class="modal fade" id="cart" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Your Cart</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="cart-body">

                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary checkout-btn" onclick="goToCheckout()">Check Out</button>
            </div>
        </div>
    </div>
</div>
<!--Footer-->
<!-- Footer -->
<div class="container">
    <div class="row">
        <div class="col-lg-12">
            <footer class="page-footer font-small mdb-color lighten-3 pt-4">

                <!-- Footer Links -->
                <div class="container text-center text-md-left">

                    <!-- Grid row -->
                    <div class="row">

                        <!-- Grid column -->
                        <div class="col-md-4 col-lg-3 mr-auto my-md-4 my-0 mt-4 mb-1">

                            <!-- Content -->
                            <h5 class="font-weight-bold text-uppercase mb-4">Khawadawa & Co.</h5>
                            <p>Khawadawa & Co. is an ecommerce based company.</p>

                        </div>
                        <!-- Grid column -->

                        <hr class="clearfix w-100 d-md-none">

                        <!-- Grid column -->
                        <div class="col-md-2 col-lg-3 mx-auto my-md-4 my-0 mt-4 mb-1">

                            <!-- Links -->
                            <h5 class="font-weight-bold text-uppercase mb-4">Partner With Us</h5>
                            <p>To become our business partner please send an email to partner@khawadawa.com</p>

                        </div>
                        <!-- Grid column -->

                        <hr class="clearfix w-100 d-md-none">

                        <!-- Grid column -->
                        <div class="col-md-4 col-lg-3 mx-auto my-md-4 my-0 mt-4 mb-1">

                            <!-- Contact details -->
                            <h5 class="font-weight-bold text-uppercase mb-4">Address</h5>

                            <ul class="list-unstyled">
                                <li>
                                    <p>
                                        <i class="fas fa-home mr-3"></i> Uttara,Dhaka,Bangladesh</p>
                                </li>
                                <li>
                                    <p>
                                        <i class="fas fa-envelope mr-3"></i> support@khawadawa.com</p>
                                </li>
                                <li>
                                    <p>
                                        <i class="fas fa-phone mr-3"></i> +880961111111</p>
                                </li>

                            </ul>

                        </div>
                        <!-- Grid column -->

                        <hr class="clearfix w-100 d-md-none">

                        <!-- Grid column -->
                        <div class="col-md-2 col-lg-2 text-center mx-auto my-4">

                            <!-- Social buttons -->
                            <h5 class="font-weight-bold text-uppercase mb-4">Follow Us</h5>

                            <!-- Facebook -->
                            <p><a type="button" class="btn-floating btn-fb">
                                    <img src="https://img.icons8.com/ios-filled/30/000000/facebook-new.png"/>
                                </a></p>
                            <!-- Twitter -->
                            <p><a type="button" class="btn-floating btn-tw">
                                    <img src="https://img.icons8.com/cotton/30/000000/twitter.png"/>
                                </a></p>
                            <!-- Google +-->
                            <p><a type="button" class="btn-floating btn-tw">
                                    <img src="https://img.icons8.com/officel/30/000000/instagram-new.png"/>
                                </a></p>
                        </div>
                        <!-- Grid column -->

                    </div>
                    <!-- Grid row -->

                </div>
                <!-- Footer Links -->

                <!-- Copyright -->
                <div class="footer-copyright text-center py-3">© 2020 Copyright:
                    <a href="/index.html">Khawadawa.com</a>
                </div>
                <!-- Copyright -->

            </footer>
            <!-- Footer -->
        </div>
    </div>
</div>

<script src="https://kit.fontawesome.com/a076d05399.js"></script>
<script src= 
        "https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js">
</script> 
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
</body>
</html>
