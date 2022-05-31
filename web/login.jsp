<%-- 
    Document   : login
    Created on : Feb 20, 2022, 3:27:27 PM
    Author     : Bao
--%>

<%@page import="sample.users.UserError"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">

        <!-- Mobile Metas -->
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!-- Site Metas -->
        <title>VegetableShop - Login Page</title>
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



        <!-- Start All Title Box -->
        <div class="all-title-box">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <h2>WellCome to QuanShop</h2>
                        <ul class="breadcrumb">
                            <li class="breadcrumb-item"><a href="MainController?action=Upload">Shop</a></li>
                            <li class="breadcrumb-item active">Login Page</li>
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
                    <div class="col-sm-6 col-lg-6 mb-3">
                        <div class="title-left">
                            <h3>Account Login</h3>
                        </div>
                        <h5><a data-toggle="collapse" href="#formLogin" role="button" aria-expanded="false">Click here to Login</a></h5>
                        <form class="mt-3 collapse review-form-box" id="formLogin" action="MainController" method="POST">
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="InputEmail" class="mb-0">User Name</label>
                                    <input type="text" name="userID" class="form-control" id="InputEmail" placeholder="Enter User Name" required=""> </div>
                                <div class="form-group col-md-6">
                                    <label for="InputPassword" class="mb-0">Password</label>
                                    <input type="password" name="password" class="form-control" id="InputPassword" placeholder="Password" required=""> </div>                     
                                <div class="g-recaptcha" data-sitekey="6Lcok9QeAAAAAPxDJvPiRLvo5eKbv4_Liqzbl9M1"></div>                                                           
                            </div>
                            <button type="submit" class="btn hvr-hover" name="action" value="Login">Login</button>
                        </form>
                        <div id="ERROR" style="color: red"></div> 
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


                    <div class="col-sm-6 col-lg-6 mb-3">
                        <div class="title-left">
                            <h3>Create New Account</h3>
                        </div>
                        <h5><a data-toggle="collapse" href="#formRegister" role="button" aria-expanded="false">Click here to Register</a></h5>
                        <%
                            UserError userError = (UserError) request.getAttribute("USER_ERROR");
                            if (userError == null) {
                                userError = new UserError();
                            }
                        %>
                        <form class="mt-3 collapse review-form-box" id="formRegister" action="MainController" method="POST">
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="InputName" class="mb-0">Full Name</label>
                                    <input type="text" name="fullName" required="" class="form-control" id="InputName" placeholder="Enter Your Full Name"> <p style="color: red"><%= userError.getFullNameError()%> </p></div>
                                <div class="form-group col-md-6">
                                    <label for="InputLoginname" class="mb-0">Login Name</label>
                                    <input type="text" name="userID" required="" class="form-control" id="InputLoginname" placeholder="Enter Name To Login"><p style="color: red"> <%= userError.getUserIDError()%> </p></div>
                                <div class="form-group col-md-6">
                                    <label for="InputPassword1" class="mb-0">Password</label>
                                    <input type="password" name="password" required="" class="form-control" id="InputPassword1" placeholder="Enter Your Password"> </div>
                                <div class="form-group col-md-6">
                                    <label for="InputPassword1" class="mb-0">Confirm Password</label>
                                    <input type="password" name="confirm" required="" class="form-control" id="InputPassword1" placeholder="Confirm Your Password"> <p style="color: red"><%= userError.getConfirmError()%></p></div>
                            </div>
                            <button type="submit" name="action" value="Create" class="btn hvr-hover">Register</button>
                        </form>
                        <%
                            String success = (String) request.getAttribute("success");
                            if (success == null) {
                                success = "";
                            }
                        %>
                        <%= success%>
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
        
        <!-- recapcha ở đây-->
        <script src="https://www.google.com/recaptcha/api.js" async defer></script>
        <script>
            window.onload = function () {
                const recap = document.getElementById("formLogin");
                const error = document.getElementById("ERROR");
                
                recap.addEventListener("submit", function (event) {

                    const response = grecaptcha.getResponse();
                    if (response) {
                        recap.submit();
                    } else {
                        event.preventDefault();
                        error.innerHTML = "Please Check Recapcha before login !!";
                    }
                });
            }
        </script>
    </body>
</html>
