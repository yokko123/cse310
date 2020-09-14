<%-- 
    Document   : admin
    Created on : Sep 9, 2020, 1:49:13 AM
    Author     : yokko
--%>

<%@page import="newpackage.Product"%>
<%@page import="newpackage.UserDatabase"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.util.Hashtable"%>
<%@page import="java.util.List"%>
<%@page import="newpackage.ConnectionPro"%>
<%@page import="java.lang.String"%>
<%@page import="newpackage.Category"%>
<%@page import="newpackage.CategoryDatabase"%>
<%@page import="newpackage.ProductDatabase"%>
<%@page import="newpackage.User"%>
<%
    response.setHeader("Cache-control", "no-cache,no-store,must-revalidate");
    User user = (User) session.getAttribute("loguser");
    if (user == null) {
        session.setAttribute("message", "You are not logged in!");
        response.sendRedirect("/cse310demo/login/login.jsp");
        return;

    } else {
        if (user.getUser_type().equals("normal")) {
            session.setAttribute("message", "You are not an admin");
            response.sendRedirect("/cse310demo/homepage/homepage.jsp");

        }
    }

%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%    CategoryDatabase catReg = new CategoryDatabase(ConnectionPro.getConnection());
    List<Category> catlist = catReg.getAllcategories();
    Hashtable<Integer, String> cat = catReg.getCategory();

    UserDatabase regUser = new UserDatabase(ConnectionPro.getConnection());
    Hashtable<Integer, String> map = regUser.getUserCount();
    List<User> list = regUser.getUserList();

    ProductDatabase proReg = new ProductDatabase(ConnectionPro.getConnection());
    Hashtable<Integer, String> prod = proReg.getProductCount();
    List<Product> prodlist = proReg.getAllProducts();
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Admin Panel</title>
        <link rel="stylesheet" href="styleadmin.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
        <script src="https://use.fontawesome.com/4aed5cf91c.js"></script>
    </head>
    <body>
        <h1 class="text-center"> ADMIN PANEL</h1>
        <div class="container ">
            <div class="row">
                <div class="col-lg-12">
                    <div id="navbar">
                        <nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark" style="max-height: 50px;">
                            <a class="navbar-brand" href="homepage.html"><img src="/cse310demo/image/logo.png" alt=""></a>
                            </button>
                            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                                <ul class="navbar-nav mr-auto">

                                    <li class="nav-item dropdown" id="user">
                                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            <img src="https://img.icons8.com/doodle/40/000000/user-male-circle.png"/>
                                        </a>
                                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                            <a class="dropdown-item" href="/cse310demo/index.jsp">Log Out</a>
                                        </div>
                                    </li>
                                </ul>
                        </nav>
                    </div>
                </div>
            </div>
        </div>

        <div class="container admin">
            <div class="row mt-5 mb-5">

                <div class="col-md-4">
                    <div class="card" data-toggle="modal" data-target="#userlist">
                        <div class="card-body text-center">

                            <div class="container">
                                <img style="max-width: 125px;" class="img-fluid " src="image/users.png" alt="">
                            </div>
                            <h1><%=map.size()%></h1>
                            <h1 class="text-uppercase  text-muted">Users</h1>
                        </div>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body text-center" data-toggle="modal" data-target="#categorylist">

                            <div class="container">
                                <img style="max-width: 125px;" class="img-fluid rounded-circle" src="image/checklist.png" alt="">
                            </div>
                            <h1><%=cat.size()%></h1>
                            <h1 class="text-uppercase text-muted">Categories</h1>
                        </div>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body text-center" data-toggle="modal" data-target="#productlist">

                            <div class="container">
                                <img style="max-width: 125px;" class="img-fluid " src="image/product.png" alt="">
                            </div>
                            <h1><%=prod.size()%></h1>
                            <h1 class="text-uppercase text-muted">Products</h1>
                        </div>
                    </div>
                </div>


            </div>
            <div class="row">
                <div class="col-md-4">
                    <div class="card" data-toggle="modal" data-target="#add-category-modal">
                        <div class="card-body text-center">

                            <div class="container">
                                <img style="max-width: 125px;" class="img-fluid rounded-circle" src="image/plus.png" alt="">
                            </div>
                            <p>Click Here to Add Category</p>
                            <h1 class="text-uppercase text-muted">Add Category</h1>
                        </div>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="card" data-toggle="modal" data-target="#add-product-modal">
                        <div class="card-body text-center">

                            <div class="container">
                                <img style="max-width: 125px;" class="img-fluid rounded-circle" src="image/mathematics.png" alt="">
                            </div>
                            <p>Click here to add products</p>
                            <h1 class="text-uppercase text-muted">Add Products</h1>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card" data-toggle="modal" data-target="#orderlist">
                        <div class="card-body text-center">

                            <div class="container">
                                <img style="max-width: 125px;" class="img-fluid " src="image/order.png" alt="">
                            </div>
                            <p>Click here to see all orders</p>
                            <h1 class="text-uppercase text-muted">Order List</h1>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <!--add category modal-->
        <!-- Button trigger modal -->


        <!-- Modal -->
        <div class="modal fade" id="add-category-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Fill Category Details</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="/cse310demo/ProductOperationServlet" method="post">
                            <input type="hidden" name="operation" value="addcategory">
                            <div class="form-group">
                                <input type="text" class="form-control" name="catTitle" placeholder="Enter Category Title" required>

                            </div>

                            <div class="form-group">
                                <textarea style="height: 300px;" class="form-control" placeholder="Enter Category Description" name="catDescription" required=""></textarea>
                            </div>

                            <div class="container text-center">
                                <button class="btn btn-outline-success">Add Category</button>
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            </div>

                        </form>
                    </div>

                </div>
            </div>
        </div>

        <!--end add category modal-->


        <!--product modal-->

        <!--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-->

        <!-- Modal -->
        <div class="modal fade" id="add-product-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Product Details</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="/cse310demo/ProductOperationServlet" method="post" enctype = "multipart/form-data">

                            <input type="hidden" name="operation" value="addproduct"/>
                            <!--product title-->
                            <div class="form-group">
                                <input type="text" class="form-control" placeholder="Enter title of the product" name="pName" required/>                               
                            </div>

                            <!--product description-->
                            <div class="form-group">
                                <textarea style="height: 150px;" class="form-control" placeholder="Enter Product Description" name="pDesc" required></textarea>
                            </div>

                            <!--product price-->
                            <div class="form-group">
                                <input type="number" class="form-control" placeholder="Enter price of the product" name="pPrice" required/>                               
                            </div>

                            <!--product discount-->
                            <div class="form-group">
                                <input type="number" class="form-control" placeholder="Enter product discount" name="pDiscount" required/>                               
                            </div>

                            <!--product quantity-->
                            <div class="form-group">
                                <input type="number" class="form-control" placeholder="Enter product quantity" name="pQuantity" required/>                               
                            </div>

                            <!--product category-->


                            <div class="form-group">


                                <select name="catId" class="form-control">
                                    <%

                                        Set<Map.Entry<Integer, String>> entries = cat.entrySet();
                                        for (Map.Entry<Integer, String> entry : entries) {
                                    %>
                                    <option value="<%=entry.getKey()%>"><%= entry.getValue() + " " + entry.getKey()%> </option>
                                    <%}%>   


                                </select>
                            </div>

                            <!--product file-->
                            <div class="form-group">
                                <label for="">Select Product Picture</label>
                                <br>
                                <input type="file"  name="pPic" enctype = "multipart/form-data">
                            </div>

                            <!--submit button-->
                            <div class="container text-center">
                                <button class="btn btn-outline-success">Add Product</button>
                            </div>



                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>


        <!--end product modal-->

        <!--Users List Modal-->
        <!-- Modal -->
        <div class="modal fade" id="userlist" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content ">
                    <div class="modal-header text-center">
                        <h5 class="modal-title w-100" id="exampleModalLabel">All Users Registered in This Website</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <table class="table">
                            <thead class="thead-dark">
                                <tr>
                                    <th scope="col">User Id</th>
                                    <th scope="col">Name</th>
                                    <th scope="col">Email</th>
                                    <th scope="col">Phone</th>
                                    <th scope="col">User Type</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%

                                    for (User u : list) {
                                %>
                                <tr>
                                    <td><%=u.getId()%></td>
                                    <td><%=u.getName()%></td>
                                    <td><%=u.getEmail()%></td>
                                    <td><%=u.getPhone()%></td>
                                    <td><%=u.getUser_type()%></td>
                                </tr>
                                <%}%>

                            </tbody>
                        </table>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>


        <!--CategoryList modal-->
        <!-- Modal -->
        <div class="modal fade" id="categorylist" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content ">
                    <div class="modal-header text-center">
                        <h5 class="modal-title w-100" id="exampleModalLabel">All Categories</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <table class="table">
                            <thead class="thead-dark">
                                <tr>
                                    <th scope="col">Category Id</th>
                                    <th></th>
                                    <th scope="col">Category</th>
                                    <th></th>
                                    <th scope="col">Category Description</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%

                                    for (Category c : catlist) {
                                %>
                                <tr>
                                    <td><%=c.getCatId()%></td>
                                    <td></td>
                                    <td><%=c.getCatTitle()%></td>
                                    <td></td>
                                    <td><%=c.getCatDescription()%></td>

                                </tr>
                                <%}%>

                            </tbody>
                        </table>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>

        <!--Product List Modal-->
        <!-- Modal -->
        <div class="modal fade" id="productlist" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content ">
                    <div class="modal-header text-center">
                        <h5 class="modal-title w-100" id="exampleModalLabel">All Products</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <table class="table">
                            <thead class="thead-dark">
                                <tr>
                                    <th scope="col">Product Id</th>                                   
                                    <th scope="col">Product Name</th>                                    
                                    <th scope="col">Product Description</th>
                                    <th>Product Price</th>
                                    <th>Product Discount</th>
                                    <th>Product Quantity Available</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%

                                    for (Product p : prodlist) {
                                %>
                                <tr>
                                    <td><%=p.getpId()%></td>                                  
                                    <td><%=p.getpName()%></td>                                   
                                    <td><%=p.getpDesc()%></td>
                                    <td><%=p.getpPrice()%></td>
                                    <td><%=p.getpDiscount()%></td>
                                    <td><%=p.getpQuantity()%></td>

                                </tr>
                                <%}%>

                            </tbody>
                        </table>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
                                
                                
        <!--order list-->
        <div class="modal fade" id="orderlist" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content ">
                    <div class="modal-header text-center">
                        <h5 class="modal-title w-100" id="exampleModalLabel">All Orders</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                         <div class="cart-body"></div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>




        <script src="https://kit.fontawesome.com/a076d05399.js"></script>
        <script src= 
                "https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js">
        </script> 
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
    </body>
</html>