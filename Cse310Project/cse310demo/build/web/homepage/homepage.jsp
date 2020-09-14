<%-- 
    Document   : homepage
    Created on : Sep 4, 2020, 1:21:38 AM
    Author     : yokko
--%>
<%@page import="newpackage.Helper"%>
<%@page import="newpackage.Category"%>
<%@page import="newpackage.CategoryDatabase"%>
<%@page import="java.util.List"%>
<%@page import="newpackage.Product"%>
<%@page import="newpackage.ProductDatabase"%>
<%@page import="newpackage.ConnectionPro"%>
<%@page import="newpackage.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    response.setHeader("Cache-Control", "no-cache");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", -1);

    User user = (User) session.getAttribute("loguser");
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
        <link rel="stylesheet" href="stylehomepage.css">
        <script src ="/cse310demo/cartjs/script.js"></script>
        <title>HomePage</title>

        <!--        <script>
                    $(document).ready(function () {
                        $('#exampleModalCenter').modal('show');
        
                    });
                </script>-->
    </head>
    <body>
        <!--Modal-->
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalCenterTitle">Welcome!</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <h4>Hello, <%=user.getName()%></h4>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Okay</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!--Navbar-->
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12">
                    <div id="navbar">
                        <nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark">
                            <a class="navbar-brand" href="homepage.jsp"><img src="/cse310demo/image/logo.png" alt=""></a>
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
                                            <a class="dropdown-item" href="/cse310demo/index.jsp" onclick="logout()">Log Out</a>
                                        </div>
                                    </li>
                                </ul>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!--Cart_Modal-->


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



    <!--Carousel-->
    <div class="container-fluid">
        <div class="row">
            <!--            <div class="col-md-3"></div>-->
            <div class="col-md-12" >
                <div class="carousel">
                    <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                        <ol class="carousel-indicators">
                            <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                            <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                            <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                            <li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
                            <li data-target="#carouselExampleIndicators" data-slide-to="4"></li>
                        </ol>
                        <div class="carousel-inner">
                            <div class="carousel-item active">
                                <img class="d-block w-100" src="image/car1.jpg" alt="First slide" height="400px" width="500px">
                            </div>
                            <div class="carousel-item">
                                <img class="d-block w-100" src="image/car2.jpg" alt="Second slide"height="400px" width="500px">
                            </div>
                            <div class="carousel-item">
                                <img class="d-block w-100" src="image/car3.jpg" alt="Third slide" height="400px" width="500px">
                            </div>
                            <div class="carousel-item">
                                <img class="d-block w-100" src="image/car4.jpg" alt="Fourth slide" height="400px" width="500px">
                            </div>
                            <div class="carousel-item">
                                <img class="d-block w-100" src="image/car6.jpg" alt="Fifth slide" height="400px" width="500px">
                            </div>
                        </div>
                        <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                            <span class="sr-only">Previous</span>
                        </a>
                        <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                            <span class="sr-only">Next</span>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="container-fluid">

        <div class="row mt-3 mx-2">

            <%
                String cat = request.getParameter("category");

                ProductDatabase proReg = new ProductDatabase(ConnectionPro.getConnection());
                List<Product> list = null;

                if (cat == null) {
                    list = proReg.getAllProducts();
                } else if (cat.trim().equals("all")) {
                    list = proReg.getAllProducts();
                } else {
                    int cid = Integer.parseInt(cat.trim());
                    list = proReg.getAllProductsById(cid);
                }

                CategoryDatabase catReg = new CategoryDatabase(ConnectionPro.getConnection());
                List<Category> listcat = catReg.getAllcategories();
            %>
            <!--show categories-->
            <div class="col-md-2">
                <div class="list-group mt-4">
                    <a href="homepage.jsp?category=all" class="list-group-item list-group-item-action active">
                        All Products
                    </a>

                    <%
                        for (Category category : listcat) {
                    %>
                    <a href="homepage.jsp?category=<%=category.getCatId()%>" class="list-group-item list-group-item-action"><%=category.getCatTitle()%></a>
                    <% }%>


                </div>
            </div>
            <!--show products-->
            <div class="col-md-10">
                <!--row-->
                <div class="row mt-4 ">
                    <!--col:12-->
                    <div class="col-md-12">
                        <div class="card-columns ">
                            <!--looping through products-->
                            <%
                                for (Product p : list) {
                            %>

                            <!--product card-->
                            <div class="card product-card">

                                <img class="card-img-top"  src="image/card-bg.png" alt="Card image cap">
                                <div class="card-body">
                                    <h5 class="card-title"><%=p.getpName()%></h5>
                                    <p class="card-text"><%=Helper.get10Words(p.getpDesc())%></p>
                                </div>

                                <div class="card-footer text-center">
                                    <button class="btn btn-dark text-white" onclick="add_to_cart(<%=p.getpId()%>, '<%=p.getpName()%>',<%=p.getPriceAfterDiscount()%>)">Add To Cart</button>
                                    <button class="btn btn-outline-success ">&#2547; <%=p.getPriceAfterDiscount()%>/- <span class=" discount-label"><del>&#2547; <%=p.getpPrice()%></del> <%=p.getpDiscount()%>% off</span></button>
                                </div>
                            </div>

                            <%}
                                if (list.size() == 0) {
                                    out.println("<h3>No Items in this Category</h3>");
                                }

                            %>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <!--Footer-->
    <!-- Footer -->
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

    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
    <script src= 
            "https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js">
    </script> 
    <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
</body>
</html>
