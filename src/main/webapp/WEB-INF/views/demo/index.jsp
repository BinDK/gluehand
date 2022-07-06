<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="mt" tagdir="/WEB-INF/tags" %>
<mt:template>
    <jsp:attribute name="content">
<!-- Start Banner Hero -->
<div id="template-mo-zay-hero-carousel" class="carousel slide" style="background-color: #7ed6df !important;" data-bs-ride="carousel">
    <ol class="carousel-indicators">
        <li data-bs-target="#template-mo-zay-hero-carousel" data-bs-slide-to="0" class="active"></li>
        <li data-bs-target="#template-mo-zay-hero-carousel" data-bs-slide-to="1"></li>
        <!-- <li data-bs-target="#template-mo-zay-hero-carousel" data-bs-slide-to="2"></li> -->
    </ol>
    <div class="carousel-inner">
        <div class="carousel-item active">
            <div class="container">
                <div class="row p-5">
                    <div class="mx-auto col-md-8 col-lg-6 order-lg-last">
                        <img class=""   src="${pageContext.request.contextPath}/resources/assets/img/ban1.webp" width="588px" height="588px" alt="">
                    </div>
                    <div class="col-lg-6 mb-0 d-flex align-items-center">
                        <div class="text-align-left align-self-center">
                            <h1 class="h1 text-success" style="color: #3B3B98 !important;"><b>Gluehand</b> </h1>
                            <h3 class="h2">A No. 1 place for passionest bidders</h3>
                            <p>
                                Gluehand is an online auction platform with realtime compete with other bidder.
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="carousel-item">
            <div class="container">
                <div class="row p-5">
                    <div class="mx-auto col-md-8 col-lg-6 order-lg-last">
                        <img class="img-fluid" src="${pageContext.request.contextPath}/resources/assets/img/banner_img_02.jpg" alt="">
                    </div>
                    <div class="col-lg-6 mb-0 d-flex align-items-center">
                        <div class="text-align-left">
                            <h1 class="h1">Proident occaecat</h1>
                            <h3 class="h2">Aliquip ex ea commodo consequat</h3>
                            <p>
                                You are permitted to use this Zay CSS template for your commercial websites.
                                You are <strong>not permitted</strong> to re-distribute the template ZIP file in any kind of template collection websites.
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
    <a class="carousel-control-prev text-decoration-none w-auto ps-3" href="#template-mo-zay-hero-carousel" role="button" data-bs-slide="prev">
        <i class="fas fa-chevron-left"></i>
    </a>
    <a class="carousel-control-next text-decoration-none w-auto pe-3" href="#template-mo-zay-hero-carousel" role="button" data-bs-slide="next">
        <i class="fas fa-chevron-right"></i>
    </a>
</div>
<!-- End Banner Hero -->


<!-- Start Categories of The Month -->
<section class="container-fluid py-5" style="background-color: #130f40 !important">
    <div class="row text-center pt-3">
        <div class="col-lg-6 m-auto">
            <h1 class="h1" style="color: #4796cf !important;font-weight: 500 !important;">We're only focus on elctronic product</h1>
            <p style="color: antiquewhite; font-size: 25px !important;">
                We got a massive category on our platform, from Television to Smartphone even Tech stuff for kitchen...
            </p>
        </div>

        <div id="catecaro" class="carousel slide"  data-bs-ride="catecaro">
            <div class="carousel">

                <div class="carousel-item active">
                    <div class="container">
                        <div class="row p-5">
                            <div class="col col-md-4 p-5 mt-3">
                                <a href="#"><img src="${pageContext.request.contextPath}/resources/assets/img/category_img_01.jpg" class="rounded-circle img-fluid border"></a>
                                <h5 class="text-center mt-3 mb-3">Watches</h5>
                                <p class="text-center"><a class="btn btn-success">Go Shop</a></p>
                            </div>
                            <div class="col col-md-4 p-5 mt-3">
                                <a href="#"><img src="${pageContext.request.contextPath}/resources/assets/img/category_img_02.jpg" class="rounded-circle img-fluid border"></a>
                                <h2 class="h5 text-center mt-3 mb-3">Shoes</h2>
                                <p class="text-center"><a class="btn btn-success">Go Shop</a></p>
                            </div>
                            <div class="col col-md-4 p-5 mt-3">
                                <a href="#"><img src="${pageContext.request.contextPath}/resources/assets/img/category_img_03.jpg" class="rounded-circle img-fluid border"></a>
                                <h2 class="h5 text-center mt-3 mb-3">Accessories</h2>
                                <p class="text-center"><a class="btn btn-success">Go Shop</a></p>
                            </div>
                        </div>
                    </div>
                </div>


            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#catecaro" data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#catecaro" data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </button>

        </div>
    </div>

</section>
<!-- End Categories of The Month -->

    </jsp:attribute>
</mt:template>
