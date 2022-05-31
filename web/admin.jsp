<%-- 
    Document   : admin
    Created on : Feb 21, 2022, 9:57:13 AM
    Author     : Bao
--%>

<%@page import="sample.product.VegetableError"%>
<%@page import="sample.product.VegetableDTO"%>
<%@page import="java.util.List"%>
<%@page import="sample.users.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">

        <!-- Mobile Metas -->
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!-- Site Metas -->
        <title>VegetableShop - Admin Page</title>
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
        <link rel="stylesheet" href="css/table.css">

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

                        <div class="our-link">
                            <ul>
                                <li><a href="MainController?action=Logout"><i class="fa fa-user s_color"></i> LOG OUT</a></li>
                            </ul>
                        </div>

                    </div>
                </div>
            </div>
        </div>
        <!-- End Main Top -->

        <!-- Start Main Top -->
        <header class="main-header">

        </header>
        <!-- End Main Top -->

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
                        <%
                            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
                            if (loginUser == null || !loginUser.getRoleID().equals("admin01")) {
                                response.sendRedirect("login.jsp");
                                return;
                            }
                            String search = request.getParameter("search");
                            if (search == null) {
                                search = "";
                            }
                        %>
                        <h2>Wellcome Admin: <%= loginUser.getFullName()%></h2>
                        <ul class="breadcrumb">
                            <li class="breadcrumb-item"><a href="addproduct.jsp">Add Product</a></li>
                            <li class="breadcrumb-item active"> Admin Page </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <!-- End All Title Box -->

        <!-- Start Contact Us  -->
        <div class="contact-box-main">
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 col-sm-12">
                        <div class="contact-form-right">
                            <h2>Search product name</h2>
                            <p>Enter product name to search.</p>
                            <form action="MainController">
                                <input type="text" name="search" required="" value="<%=search%>"placeholder="Input your text"/>
                                <input type="submit" name="action" value="SearchProduct"/>
                            </form>
                            <button><a href="MainController?action=Show">Show All Product</a></button>
                        </div>
                    </div>
                </div>  
            </div>
        </div>
        <!-- End Cart -->
        <%
            String notification = (String) request.getAttribute("DELETESUCCESS");
            if (notification == null) {
                notification = "";
            }
        %>
        <div class="title-all">
            <p class="notification" style="color: #34ce57"><%= notification%></p>
        </div>
        <!-- hiện bảng kết quả -->
        <div class="tableProduct">
            <%
                List<VegetableDTO> listProduct = (List<VegetableDTO>) request.getAttribute("LIST_PRODUCT");
                if (listProduct != null) {
                    if (listProduct.size() > 0) {
            %>
            <table border="1">
                <thead>
                    <tr class="table2">
                        <th>No</th>
                        <th>ProductID</th>
                        <th>Name</th>
                        <th>Image</th>
                        <th>Price</th>
                        <th>Quantity</th>
                        <th>Catagory</th>
                        <th>Import Day</th>
                        <th>Using Day</th>
                        <th>Update</th>
                        <th>Delete</th>

                    </tr>
                </thead>
                <tbody>
                    <%
                        int count = 1;
                        for (VegetableDTO product : listProduct) {
                    %>
                <form action="MainController">

                    <tr>
                        <td><%= count++%></td>
                        <td>
                            <input type="text" name="productID" value="<%= product.getVegetableID()%>" readonly=""/>
                        </td>
                        <td>
                            <input type="text" name="productName" value="<%= product.getVegetableName()%>" required="" />
                        </td>
                        <td>
                            <input type="text" name="image" value="<%= product.getImage()%>" required="" />
                        </td>
                        <td>
                            <input type="text" name="price" value="<%= product.getPrice()%>" required="" />
                        </td>
                        <td>
                            <input type="text" name="quantity" value="<%= product.getQuantity()%>" required="" />
                        </td>
                        <td>
                            <input type="text" name="categoryID" value="<%= product.getCatagoryID()%>" required="" />
                        </td>
                        <td>
                            <input type="date" name="importDate" value="<%= product.getImportDate()%>" required="" />
                        </td>
                        <td>
                            <input type="date" name="usingDate" value="<%= product.getUsingDate()%>" required="" />
                        </td>
                        <td>
                            <input type="submit" name="action" value="UpdateProduct" />
                            <input type="hidden" name="search" value="<%= search%>" />
                        </td>
                        <td>
                            <a href="MainController?action=DeleteProduct&productID=<%= product.getVegetableID()%>&productName=<%= product.getVegetableName()%>&search=<%= search%>">Delete</a>
                        </td>

                    </tr>
                </form>
                <%
                    }
                %>

                </tbody>
            </table>
            <%
                VegetableError productError = (VegetableError) request.getAttribute("PRODUCT_ERROR");
                if (productError == null) {
                    productError = new VegetableError();
                }
            %>
            <a><%= productError.getProductNameError() %> </a><br/>
            <a><%= productError.getUsingDateError()%> </a><br/>
            <a><%= productError.getPriceError()%> </a><br/>
            <a><%= productError.getCategoryError()%> </a><br/>
            <%
                    }
                }
            %>   
        </div>

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
