<%@page import="java.util.ArrayList"%>
<%@page import="model.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    ArrayList<Product> list = (ArrayList<Product>)request.getAttribute("listProduct");
    int tab = (int) list.size()/6;
    if(tab*6 < list.size()){
        tab+=1;
    }
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <%@include file="components/head.jsp" %>

        <title>The Sneaker Garden</title>
        <link href="./css/style.css" rel="stylesheet">
        <link rel="stylesheet" href="./css/shop.css" />
        <link rel="stylesheet" href="./css/style.css">

    </head>

    <body>
        <%@include file="components/header.jsp" %>
        <!-- Start Content -->
        <div class="container py-5" style="margin-top: 80px">
            <div class="row mt-5">
                <div class="col-lg-3">
                    <h1 class="h2 pb-4">Categories</h1>
                    <ul class="list-unstyled templatemo-accordion">
                        
                        <li class="pb-3">
                            <a class="collapsed d-flex justify-content-between h3 text-decoration-none" href="#">
                                Type
                                <i class="pull-right fa fa-fw fa-chevron-circle-down mt-1"></i>
                            </a>
                            <ul id="collapseThree" class="collapse list-unstyled pl-3">
                                <li><a class="text-decoration-none" href="#">Shoes</a></li>
                                <li><a class="text-decoration-none" href="#">Socks</a></li>
                                <li><a class="text-decoration-none" href="#">Hats</a></li>
                                <li><a class="text-decoration-none" href="#">Backpacks</a></li>
                            </ul>
                        </li>
                       
                    </ul>
                </div>

                <div class="col-lg-9">
                    <div class="row">
                        <div class="col-md-6">
                            <ul class="list-inline shop-top-menu pb-3 pt-1">
                                <li class="list-inline-item">
                                    <a class="h3 text-white text-decoration-none mr-3 btn-black ps-5 pe-5 pt-1 pb-1 rounded "
                                       href="./shop">All</a>
                                </li>
                                <li class="list-inline-item">
                                    <a class="h3 text-dark text-decoration-none mr-3 not-active ps-2 pe-2 pt-1 pb-1 rounded" href="shop?cId=1">Nike</a>
                                </li>
                                <li class="list-inline-item">
                                    <a class="h3 text-dark text-decoration-none not-active ps-2 pe-2 pt-1 pb-1 rounded" href="shop?cId=2">Adidas</a>
                                </li>
                            </ul>
                        </div>
                        <div class="col-md-3 pb-4">
                            <div class="d-flex">
                                <select class="form-control">
                                    <option>Newest</option>
                                    <option>A to Z</option>
                                    <option>Z to A</option>
                                    <option>Price ascending</option>
                                    <option>Price descending</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-md-3 pb-4">
                            <div class="d-flex">
                                <select class="form-control">
                                    <option>Filter</option>
                                    <option>Under VNĐ50</option>
                                    <option>VNĐ50 - VNĐ100</option>
                                    <option>VNĐ100 - VNĐ200</option>
                                    <option>Over VNĐ200</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    
                    <div class="row">
                        <%
                            int index = 6;
                            int step = 0;
                            if(list.size()<6){
                                index = list.size();
                            }else if(request.getAttribute("tab") != null){
                                if(6 * Integer.valueOf(request.getAttribute("tab").toString()) < list.size()){
                                index = 6 * Integer.valueOf(request.getAttribute("tab").toString());
                                }else{
                                index = list.size();
                                }
                            
                                step = (Integer.valueOf(request.getAttribute("tab").toString()) - 1) * 6;
                            }
                            for(int i = step; i < index; i++){
                        %>
                        <div class="col-md-4">
                            <div class="card mb-4 product-wap rounded-0">
                                <div class="card rounded-0">
                                    <img class="card-img-product card-img rounded-0 img-fluid" src="<%=list.get(i).getImage()%>" />
                                    <div class="card-img-overlay rounded-0 product-card-img-productoverlay d-flex align-items-center justify-content-center">
                                        <ul class="list-unstyled">
                                            <li><a class="btn mt-2 btn-main" href="./product-detail?id=<%=list.get(i).getId()%>" tabindex="0"><i class="far fa-eye"></i></a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="card-body card-body-height">
                                    <a href="product-detail.jsp" class="h3 text-decoration-none">
                                        <h5><%=list.get(i).getName()%></h5>
                                    </a>
                                    <ul class="list-unstyled d-flex justify-content-center mb-1">
                                        <li>
                                            <i class="text-warning fa fa-star"></i>
                                            <i class="text-warning fa fa-star"></i>
                                            <i class="text-warning fa fa-star"></i>
                                            <i class="text-muted fa fa-star"></i>
                                            <i class="text-muted fa fa-star"></i>
                                        </li>
                                    </ul>
                                    <p class="text-center mb-0" style="color: #333"><b><%=Math.round(list.get(i).getPrice())%> VNĐ</b></p>
                                </div>
                            </div>
                        </div>
                            <%
                                }
                            %>
                    <div div="row">
                        <ul class="pagination pagination-lg justify-content-end">
                            <%
                                for (int i = 0; i < tab; i++) {
                            %>
                            <li class="page-item">
                                <a class="page-link rounded-0 mr-3 shadow-sm border-top-0 border-left-0" href="./shop?tab=<%=i+1%>"
                                ><%=i+1%></a>
                            </li>
                            <%}%>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <!-- End Content -->

        <!-- Start Brands -->
        <section class="bg-light py-5 mt-5">
            <div class="container my-4">
                <div class="row text-center py-3">
                    <div class="col-lg-6 m-auto">
                        <h1 class="header">Our Brands</h1>
                        <p>
                            Whether you make it loud or keep it neutral, customise a shoe
                            that's more like you with Nike's co-creation service.
                        </p>
                    </div>
                    <div class="col-lg-9 m-auto tempaltemo-carousel">
                        <div class="row d-flex flex-row">
                            <!--Controls-->
                            <div class="col-1 align-self-center">
                                <a class="h1" href="#multi-item-example" role="button" data-bs-slide="prev">
                                    <i class="text-light fas fa-chevron-left"></i>
                                </a>
                            </div>
                            <!--End Controls-->

                            <!--Carousel Wrapper-->
                            <div class="col">
                                <div class="carousel slide carousel-multi-item pt-2 pt-md-0" id="multi-item-example"
                                     data-bs-ride="carousel">
                                    <!--Slides-->
                                    <div class="carousel-inner product-links-wap" role="listbox">
                                        <!--First slide-->
                                        <div class="carousel-item active">
                                            <div class="row">
                                                <div class="col-3 p-md-5">
                                                    <a href="#"><img class="img-fluid brand-img" src="./img/brand_01.png" alt="Brand Logo" /></a>
                                                </div>
                                                <div class="col-3 p-md-5">
                                                    <a href="#"><img class="img-fluid brand-img" src="./img/brand_02.png" alt="Brand Logo" /></a>
                                                </div>
                                                <div class="col-3 p-md-5">
                                                    <a href="#"><img class="img-fluid brand-img" src="./img/brand_03.png" alt="Brand Logo" /></a>
                                                </div>
                                                <div class="col-3 p-md-5">
                                                    <a href="#"><img class="img-fluid brand-img" src="./img/brand_04.png" alt="Brand Logo" /></a>
                                                </div>
                                            </div>
                                        </div>
                                        <!--End First slide-->

                                        <!--Second slide-->
                                        <div class="carousel-item">
                                            <div class="row">
                                                <div class="col-3 p-md-5">
                                                    <a href="#"><img class="img-fluid brand-img" src="./img/brand_01.png" alt="Brand Logo" /></a>
                                                </div>
                                                <div class="col-3 p-md-5">
                                                    <a href="#"><img class="img-fluid brand-img" src="./img/brand_02.png" alt="Brand Logo" /></a>
                                                </div>
                                                <div class="col-3 p-md-5">
                                                    <a href="#"><img class="img-fluid brand-img" src="./img/brand_03.png" alt="Brand Logo" /></a>
                                                </div>
                                                <div class="col-3 p-md-5">
                                                    <a href="#"><img class="img-fluid brand-img" src="./img/brand_04.png" alt="Brand Logo" /></a>
                                                </div>
                                            </div>
                                        </div>
                                        <!--End Second slide-->

                                        <!--Third slide-->
                                        <div class="carousel-item">
                                            <div class="row">
                                                <div class="col-3 p-md-5">
                                                    <a href="#"><img class="img-fluid brand-img" src="./img/brand_01.png" alt="Brand Logo" /></a>
                                                </div>
                                                <div class="col-3 p-md-5">
                                                    <a href="#"><img class="img-fluid brand-img" src="./img/brand_02.png" alt="Brand Logo" /></a>
                                                </div>
                                                <div class="col-3 p-md-5">
                                                    <a href="#"><img class="img-fluid brand-img" src="./img/brand_03.png" alt="Brand Logo" /></a>
                                                </div>
                                                <div class="col-3 p-md-5">
                                                    <a href="#"><img class="img-fluid brand-img" src="./img/brand_04.png" alt="Brand Logo" /></a>
                                                </div>
                                            </div>
                                        </div>
                                        <!--End Third slide-->
                                    </div>
                                    <!--End Slides-->
                                </div>
                            </div>
                            <!--End Carousel Wrapper-->

                            <!--Controls-->
                            <div class="col-1 align-self-center">
                                <a class="h1" href="#multi-item-example" role="button" data-bs-slide="next">
                                    <i class="text-light fas fa-chevron-right"></i>
                                </a>
                            </div>
                            <!--End Controls-->
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!--End Brands-->

        <%@include file="components/footer.jsp" %>

        <!-- Start Script -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
                integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <script src="./js/shop.js"></script>
        <!-- End Script -->
    </body>

</html>