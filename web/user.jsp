<%-- 
    Document   : user
    Created on : Mar 1, 2022, 10:06:55 PM
    Author     : Bao
--%>

<%@page import="sample.users.UserDTO"%>
<%@page import="sample.users.UserError"%>
<%@page import="sample.product.VegetableDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">

        <!-- Mobile Metas -->
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!-- Site Metas -->
        <title> My Acount Page</title>
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
        <!-- Start Main Top -->
        <div class="main-top">
            <div class="container-fluid">
                <div class="row">

                    <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">

                        <div class="text-slid-box">
                            <div id="offer-box" class="carouselTicker">
                                <ul class="offer-box">
                                    <li>
                                        <i class="fab fa-opencart"></i> Rau sạch giá rẻ các loại
                                    </li>
                                    <li>
                                        <i class="fab fa-opencart"></i> Siêu sale 50% ngày thứ 7.
                                    </li>
                                    <li>
                                        <i class="fab fa-opencart"></i> Giảm giá 10% rau củ các loại!
                                    </li>
                                    <li>
                                        <i class="fab fa-opencart"></i> Giảm 50% mua ngay!!!!
                                    </li>
                                    <li>
                                        <i class="fab fa-opencart"></i> Săn mã giảm giá hằng ngày!
                                    </li>
                                    <li>
                                        <i class="fab fa-opencart"></i> Shop rau củ quả bao ngon bao sạch bao rẻ
                                    </li>
                                    <li>
                                        <i class="fab fa-opencart"></i> Mua ngay kẻo hết
                                    </li>
                                    <li>
                                        <i class="fab fa-opencart"></i> FreshShop cửa hàng rau củ quả số 1 việt nam!    
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- End Main Top -->


        <%
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            if (loginUser == null || !loginUser.getRoleID().equals("user02")) {
                response.sendRedirect("login.jsp");
                return;
            }
        %>
        <!-- Start All Title Box -->
        <div class="all-title-box">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <h2>My Acount: <%= loginUser.getFullName()%></h2>
                        <ul class="breadcrumb">
                            <li class="breadcrumb-item"><a href="MainController?action=Upload">Shop</a></li>
                            <li class="breadcrumb-item active">My Acount: </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <!-- End All Title Box -->

        <!-- Start Cart  -->
        <div class="cart-box-main">
            <div class="container">
                <div class="row new-account-login">
                    <div class="col-sm-6 col-lg-6 mb-3">                                  <!-- show thông tin khách hàng  -->
                        <div class="title-left">
                            <h3>Account Information</h3>
                        </div>
                        <h5><a   href="MainController?action=Search&userID=<%= loginUser.getUserID()%>" >Click here to show your information</a></h5>
                        <%
                            UserDTO accountUser = (UserDTO) request.getAttribute("ACCOUNT_USER");
                            if (accountUser == null) {
                                accountUser = new UserDTO();
                            }
                        %>

                        <ul class="breadcrumb">
                            <li class="breadcrumb-item" style="color: red"><a>User ID</a></li>
                            <li class="breadcrumb-item active"><%= accountUser.getUserID()%> </li>
                        </ul>
                        <ul class="breadcrumb">
                            <li class="breadcrumb-item" style="color: red"><a>User Name</a></li>
                            <li class="breadcrumb-item active"><%= accountUser.getFullName()%> </li>
                        </ul>
                        <ul class="breadcrumb">
                            <li class="breadcrumb-item" style="color: red"><a>Role ID</a></li>
                            <li class="breadcrumb-item active"><%= accountUser.getRoleID()%> </li>
                        </ul>
                        <ul class="breadcrumb">
                            <li class="breadcrumb-item" style="color: red"><a>Address</a></li>
                            <li class="breadcrumb-item active"><%= accountUser.getAddress()%> </li>
                        </ul>
                        <ul class="breadcrumb">
                            <li class="breadcrumb-item" style="color: red"><a>Birthday</a></li>
                            <li class="breadcrumb-item active"><%= accountUser.getBirthDay()%> </li>
                        </ul>
                        <ul class="breadcrumb">
                            <li class="breadcrumb-item" style="color: red"><a>Phone</a></li>
                            <li class="breadcrumb-item active"><%= accountUser.getPhone()%> </li>
                        </ul>
                        <ul class="breadcrumb">
                            <li class="breadcrumb-item" style="color: red"><a>Email</a></li>
                            <li class="breadcrumb-item active"><%= accountUser.getEmail()%> </li>
                        </ul>

                        <%
                            String error = (String) request.getAttribute("ERROR");
                            if (error == null) {
                                error = "";
                            }
                        %>
                        <div class="title-all">
                            <p style="color: red"><%= error%></p>
                        </div>
                    </div>


                    <div class="col-sm-6 col-lg-6 mb-3">                                    <!-- update thông tin khách hàng  -->
                        <div class="title-left">
                            <h3>Update User Information</h3>
                        </div>
                        <h5><a data-toggle="collapse" href="#formRegister" role="button" aria-expanded="false">Click here to Update</a></h5>
                        <%
                            UserError userError = (UserError) request.getAttribute("USER_ERROR");
                            if (userError== null) {
                                userError = new UserError();
                            }
                        %>
                        <form class="mt-3 collapse review-form-box" id="formRegister" action="MainController" method="POST">
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="InputUserID" class="mb-0">UserID</label>
                                    <input type="text" name="userID" value="<%= accountUser.getUserID()%>" class="form-control" id="InputUserID" readonly=""> </div>
                                <div class="form-group col-md-6">
                                    <label for="InputName" class="mb-0">Full Name</label>
                                    <input type="text" name="fullName" value="<%= accountUser.getFullName()%>" class="form-control" id="InputName">  <p style="color: red"><%= userError.getFullNameError()%> </p></div>
                                <div class="form-group col-md-6">
                                    <label for="InputAddress" class="mb-0">Address</label>
                                    <input type="text" name="address" value="<%= accountUser.getAddress()%>" class="form-control" id="InputAddress"> <p style="color: red"> <%= userError.getUserIDError()%> </p></div>
                                 <div class="form-group col-md-6">
                                    <label for="InputBirthday" class="mb-0">Birthday</label>
                                    <input type="date" max="2022-01-01" min="1940-01-01" name="birthday" value="<%= accountUser.getBirthDay()%>" class="form-control" id="InputBirthday"> <p style="color: red"> <%= userError.getUserIDError()%> </p></div>
                                 <div class="form-group col-md-6">
                                    <label for="InputPhone" class="mb-0">Phone</label>
                                    <input type="text" name="phone" value="<%= accountUser.getPhone()%>" class="form-control" id="InputPhone"> <p style="color: red"> <%= userError.getPhoneError()%> </p></div>
                                 <div class="form-group col-md-6">
                                    <label for="InputEmail" class="mb-0">Email</label>
                                    <input type="email" name="email" value="<%= accountUser.getEmail()%>" class="form-control" id="InputEmail"> <p style="color: red"> <%= userError.getUserIDError()%> </p></div>
                                 
                            </div>
                            <button type="submit" name="action" value="UpdateUser" class="btn hvr-hover">Update</button>
                        </form>
                        <%
                            String success = (String) request.getAttribute("SUCCESS");
                            if (success== null) {
                                success = "";
                            }
                        %>
                        <a style="color: blue"><%= success%></a>
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
