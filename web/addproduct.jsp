<%-- 
    Document   : addproduct
    Created on : Mar 4, 2022, 4:39:12 PM
    Author     : Bao
--%>

<%@page import="sample.users.UserDTO"%>
<%@page import="sample.product.VegetableError"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">

        <!-- Mobile Metas -->
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!-- Site Metas -->
        <title>Admin - Add Product Page</title>
        <meta name="keywords" content="">
        <meta name="description" content="">
        <meta name="author" content="">

        <!-- Site Icons -->
        <link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon">
        <link rel="apple-touch-icon" href="images/apple-touch-icon.png">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <!-- Site CSS -->
        <link rel="stylesheet" href="css/style.css">
        <!-- Responsive CSS -->
        <link rel="stylesheet" href="css/responsive.css">
        <!-- Custom CSS -->
        <link rel="stylesheet" href="css/custom.css">

        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
          <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->

    </head>

    <body>
        <!-- Start Top Search -->
        <div class="top-search">
            <div class="container">
                <div class="input-group">
                    <span class="input-group-addon"><i class="fa fa-search"></i></span>
                    <input type="text" class="form-control" placeholder="Search">
                    <span class="input-group-addon close-search"><i class="fa fa-times"></i></span>
                </div>
            </div>
        </div>
        <!-- End Top Search -->

        <!-- Start All Title Box -->
        <div class="all-title-box">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <h2>Add Product</h2>
                        <ul class="breadcrumb">
                            <li class="breadcrumb-item"><a href="admin.jsp">Admin Page</a></li>
                            <li class="breadcrumb-item active"> Add Product </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <!-- End All Title Box -->
        <%
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            if (loginUser == null || !loginUser.getRoleID().equals("admin01")) {
                response.sendRedirect("login.jsp");
                return;
            }

        %>
        <!-- Start Contact Us  -->
        <div class="contact-box-main">
            <div class="container">
                <div class="row">
                    <div class="col-sm-6 col-lg-6 mb-3">
                        <div class="title-left">
                            <h3>Create new product</h3>
                        </div>
                        <h5><a data-toggle="collapse" >Enter the infomation to add new product</a></h5>
                        <%                           
                            VegetableError productError = (VegetableError) request.getAttribute("PRODUCT_ERROR");
                            if (productError == null) {
                                productError = new VegetableError();
                            }
                        %>
                        <form  id="formLogin" action="MainController" method="POST">
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="ID" class="mb-0">Product ID</label>
                                    <input type="text" name="productID" class="form-control" id="ID" placeholder="Enter product ID" required=""><p style="color: red"><%= productError.getProductIDError()%> </p> </div>
                                <div class="form-group col-md-6">
                                    <label for="name" class="mb-0">Product Name</label>
                                    <input type="text" name="productName" class="form-control" id="name" placeholder="Enter product name" required=""><p style="color: red"><%= productError.getProductNameError()%> </p> </div>
                                <div class="form-group col-md-6">
                                    <label for="image" class="mb-0">Image</label>
                                    <input type="text" name="image" class="form-control" id="image" placeholder="Enter link image" required=""> </div>
                                <div class="form-group col-md-6">
                                    <label for="price" class="mb-0">Price</label>
                                    <input type="number" min="1" name="price" class="form-control" id="price" placeholder="Enter price" required=""><p style="color: red"><%= productError.getPriceError()%> </p> </div>
                                <div class="form-group col-md-6">
                                    <label for="quantity" class="mb-0">Quantity</label>
                                    <input type="number" min="1" name="quantity" class="form-control" id="quantity" placeholder="Enter quantity" required=""><p style="color: red"><%= productError.getQuantityError()%> </p> </div>
                                <div class="form-group col-md-6">
                                    <label for="category" class="mb-0">CategoryID</label>
                                    <input type="text" name="categoryID" class="form-control" id="category" placeholder="Enter Category" required=""><p style="color: red"><%= productError.getCategoryError()%> </p> </div>
                                <div class="form-group col-md-6">
                                    <label for="import" class="mb-0">ImportDate</label>
                                    <input type="date" name="importDate" class="form-control" id="import"  required=""> </div>
                                <div class="form-group col-md-6">
                                    <label for="using" class="mb-0">UsingDate</label>
                                    <input type="date" name="usingDate" class="form-control" id="using"  required=""><p style="color: red"><%= productError.getUsingDateError()%> </p> </div>
                            </div>
                            <button type="submit" class="btn hvr-hover" name="action" value="CreateProduct">Create</button>
                        </form>
                        <%
                            String message = (String) request.getAttribute("MESSAGE");
                            if (message == null) {
                                message = "";
                            }
                        %>
                        <div class="title-all">
                            <p style="color: red"><%= message%></p>
                        </div>
                    </div>
                    <div class="col-lg-4 col-sm-12">
                        <div class="contact-info-left">
                            <h2>CONTACT INFO</h2>
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent urna diam, maximus ut ullamcorper quis, placerat id eros. Duis semper justo sed condimentum rutrum. Nunc tristique purus turpis. Maecenas vulputate. </p>
                            <ul>
                                <li>
                                    <p><i class="fas fa-map-marker-alt"></i>Address: Michael I. Days 9000 <br>Preston Street Wichita,<br> KS 87213 </p>
                                </li>
                                <li>
                                    <p><i class="fas fa-phone-square"></i>Phone: <a href="tel:+1-888705770">+1-888 705 770</a></p>
                                </li>
                                <li>
                                    <p><i class="fas fa-envelope"></i>Email: <a href="mailto:contactinfo@gmail.com">contactinfo@gmail.com</a></p>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- End Cart -->

        <!-- Start Instagram Feed  -->
        <div class="instagram-box">
            <div class="main-instagram owl-carousel owl-theme">
                <div class="item">
                    <div class="ins-inner-box">
                        <img src="images/instagram-img-01.jpg" alt="" />
                        <div class="hov-in">
                            <a href="#"><i class="fab fa-instagram"></i></a>
                        </div>
                    </div>
                </div>
                <div class="item">
                    <div class="ins-inner-box">
                        <img src="images/instagram-img-02.jpg" alt="" />
                        <div class="hov-in">
                            <a href="#"><i class="fab fa-instagram"></i></a>
                        </div>
                    </div>
                </div>
                <div class="item">
                    <div class="ins-inner-box">
                        <img src="images/instagram-img-03.jpg" alt="" />
                        <div class="hov-in">
                            <a href="#"><i class="fab fa-instagram"></i></a>
                        </div>
                    </div>
                </div>
                <div class="item">
                    <div class="ins-inner-box">
                        <img src="images/instagram-img-04.jpg" alt="" />
                        <div class="hov-in">
                            <a href="#"><i class="fab fa-instagram"></i></a>
                        </div>
                    </div>
                </div>
                <div class="item">
                    <div class="ins-inner-box">
                        <img src="images/instagram-img-05.jpg" alt="" />
                        <div class="hov-in">
                            <a href="#"><i class="fab fa-instagram"></i></a>
                        </div>
                    </div>
                </div>
                <div class="item">
                    <div class="ins-inner-box">
                        <img src="images/instagram-img-06.jpg" alt="" />
                        <div class="hov-in">
                            <a href="#"><i class="fab fa-instagram"></i></a>
                        </div>
                    </div>
                </div>
                <div class="item">
                    <div class="ins-inner-box">
                        <img src="images/instagram-img-07.jpg" alt="" />
                        <div class="hov-in">
                            <a href="#"><i class="fab fa-instagram"></i></a>
                        </div>
                    </div>
                </div>
                <div class="item">
                    <div class="ins-inner-box">
                        <img src="images/instagram-img-08.jpg" alt="" />
                        <div class="hov-in">
                            <a href="#"><i class="fab fa-instagram"></i></a>
                        </div>
                    </div>
                </div>
                <div class="item">
                    <div class="ins-inner-box">
                        <img src="images/instagram-img-09.jpg" alt="" />
                        <div class="hov-in">
                            <a href="#"><i class="fab fa-instagram"></i></a>
                        </div>
                    </div>
                </div>
                <div class="item">
                    <div class="ins-inner-box">
                        <img src="images/instagram-img-05.jpg" alt="" />
                        <div class="hov-in">
                            <a href="#"><i class="fab fa-instagram"></i></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- End Instagram Feed  -->




        <!-- Start copyright  -->
        <div class="footer-copyright">
            <p class="footer-company">All Rights Reserved. &copy; 2018 <a href="#">ThewayShop</a> Design By :
                <a href="https://html.design/">html design</a></p>
        </div>
        <!-- End copyright  -->

        <a href="#" id="back-to-top" title="Back to top" style="display: none;">&uarr;</a>

        <!-- ALL JS FILES -->
        <script src="js/jquery-3.2.1.min.js"></script>
        <script src="js/popper.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <!-- ALL PLUGINS -->
        <script src="js/jquery.superslides.min.js"></script>
        <script src="js/bootstrap-select.js"></script>
        <script src="js/inewsticker.js"></script>
        <script src="js/bootsnav.js."></script>
        <script src="js/images-loded.min.js"></script>
        <script src="js/isotope.min.js"></script>
        <script src="js/owl.carousel.min.js"></script>
        <script src="js/baguetteBox.min.js"></script>
        <script src="js/form-validator.min.js"></script>
        <script src="js/contact-form-script.js"></script>
        <script src="js/custom.js"></script>
    </body>
</html>
