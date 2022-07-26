
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="mt" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<mt:template>
    <jsp:attribute name="content">
<div class="container py-5">
    <div class="row">
            <!-- SIDEBAR filter -->
<%--        <div class="col-lg-3">--%>
<%--            <h1 class="h2 pb-4">Filter</h1>--%>
<%--            <ul class="list-unstyled templatemo-accordion">--%>
<%--                <li class="pb-3">--%>
<%--                    <a class="collapse d-flex justify-content-between h3 text-decoration-none" href="#">--%>
<%--                        Gender--%>
<%--                        <i class="fa fa-fw fa-chevron-circle-down mt-1"></i>--%>
<%--                    </a>--%>
<%--                    <ul class="collapse list-unstyled pl-3" style="display: none;">--%>
<%--                        <li><a class="text-decoration-none" href="#">Men</a></li>--%>
<%--                        <li><a class="text-decoration-none" href="#">Women</a></li>--%>
<%--                    </ul>--%>
<%--                </li>--%>
<%--                <li class="pb-3">--%>
<%--                    <a class="collapsed d-flex justify-content-between h3 text-decoration-none" href="#">--%>
<%--                        Sale--%>
<%--                        <i class="pull-right fa fa-fw fa-chevron-circle-down mt-1"></i>--%>
<%--                    </a>--%>
<%--                    <ul id="collapseTwo" class="collapse list-unstyled pl-3" style="display: none;">--%>
<%--                        <li><a class="text-decoration-none" href="#">Sport</a></li>--%>
<%--                        <li><a class="text-decoration-none" href="#">Luxury</a></li>--%>
<%--                    </ul>--%>
<%--                </li>--%>
<%--                <li class="pb-3">--%>
<%--                    <a class="collapsed d-flex justify-content-between h3 text-decoration-none" href="#">--%>
<%--                        Product--%>
<%--                        <i class="pull-right fa fa-fw fa-chevron-circle-down mt-1"></i>--%>
<%--                    </a>--%>
<%--                    <ul id="collapseThree" class="collapse list-unstyled pl-3" style="display: none;">--%>
<%--                        <li><a class="text-decoration-none" href="#">Bag</a></li>--%>
<%--                        <li><a class="text-decoration-none" href="#">Sweather</a></li>--%>
<%--                        <li><a class="text-decoration-none" href="#">Sunglass</a></li>--%>
<%--                    </ul>--%>
<%--                </li>--%>
<%--            </ul>--%>
<%--        </div>--%>
            <!-- SIDEBAR filter -->


        <!-- Start Foreach Product -->
        <div class="col-lg-12">
            <div class="row">
                <div class="col-md-6">
                    <ul class="list-inline shop-top-menu pb-3 pt-1">
                        <li class="list-inline-item">
                            <a class="h3 text-dark text-decoration-none mr-3" href="#">Almost There</a>
                        </li>
                        <li class="list-inline-item">
                            <a class="h3 text-dark text-decoration-none mr-3" href="#">Live</a>
                        </li>
                        <li class="list-inline-item">
                        </li>
                    </ul>
                </div>
                <div class="col-md-6 pb-4">
                    <div class="d-flex">
                        <select class="form-control">
                            <option>Featured</option>
                            <option>A to Z</option>
                            <option>Item</option>
                        </select>
                    </div>
                </div>
            </div>
            <div class="row">
                <c:forEach var = "i" items= "${prods}">


                <div class="col-md-4">
                    <div class="card mb-4 product-wap rounded-0">

                        <div class="card rounded-0">
                            <a class="nav-link" href="${pageContext.request.contextPath}/user/auction?id=${i.product_id}">
                                <c:set var = "imgg" value ="${i.img}"/>
                                <c:if test = "${imgg == null}">
                                <img alt="peacock" class="card-img rounded-0 img-fluid" src="https://avatars.dicebear.com/api/pixel-art/null-${i.img}.svg?b=%2375507b">

                                </c:if>

                                <c:if test = "${imgg != null}">
                                 <img alt="peacock" class="card-img rounded-0 img-fluid" src="${pageContext.request.contextPath}/uploads/images/${i.img}">
                                </c:if>

                            <%--                                <c:if test="${i.imgg} == null">--%>
<%--                                <img alt="peacock" class="card-img rounded-0 img-fluid" src="https://avatars.dicebear.com/api/pixel-art/${i.img}.svg?b=%2375507b">--%>

<%--                                </c:if>--%>

<%--                                <c:if test="${i.imgg != null}">--%>
<%--                                <img alt="peacock" class="card-img rounded-0 img-fluid" src="${pageContext.request.contextPath}/uploads/imgs/${i.img}">--%>

<%--                                </c:if>--%>
                            </a>
                        </div>
                        <div class="card-body cardpd">
                            <a href="shop-single.html" class="h3 text-decoration-none">${i.product_name}</a>

                            <ul class="w-100 list-unstyled d-flex justify-content-between mb-0">
                                <li>M/L/X/XL</li>
                                <li class="pt-2">
                                    <span class="product-color-dot color-dot-red float-left rounded-circle ml-1"></span>
                                    <span class="product-color-dot color-dot-blue float-left rounded-circle ml-1"></span>
                                    <span class="product-color-dot color-dot-black float-left rounded-circle ml-1"></span>
                                    <span class="product-color-dot color-dot-light float-left rounded-circle ml-1"></span>
                                    <span class="product-color-dot color-dot-green float-left rounded-circle ml-1"></span>
                                </li>
                            </ul>
                            <p class="text-center mb-0 textcd" id="cd-${i.product_id}"></p>
                            <p class="text-center mb-0">$250.00</p>
                        </div>
                    </div>
                </div>
                </c:forEach>

            </div>

            <div div="row">
                <ul class="pagination pagination-lg justify-content-end">
                    <li class="page-item disabled">
                        <a class="page-link active rounded-0 mr-3 shadow-sm border-top-0 border-left-0" href="#" tabindex="-1">1</a>
                    </li>
                    <li class="page-item">
                        <a class="page-link rounded-0 mr-3 shadow-sm border-top-0 border-left-0 text-dark" href="#">2</a>
                    </li>
                    <li class="page-item">
                        <a class="page-link rounded-0 shadow-sm border-top-0 border-left-0 text-dark" href="#">3</a>
                    </li>
                </ul>
            </div>
        </div>
        <!-- End Product -->



    </div>
</div>
<style>
    body{background-color: #AAD4D9;}
</style>
        <script>
            window.onload = countt();
            function countt() {
        // $('.textcd').each(function (){
                <c:forEach var="i" items="${prods}">
            <%--var idCount${i.product_id} = $('.textcd').attr('id');--%>
                var idCount${i.product_id} = $('#cd-${i.product_id}').attr('id');

                var hold${i.product_id} = idCount${i.product_id}.split("-");
           // var  idCount = $('.cardpd .list-unstyled li').attr("id");
           <%-- console.log(hold${i.product_id}[1]);--%>
            var countDownDate${i.product_id} = new Date("${i.start_date}");
            //Luôn 20 giây đi trước tgian hiện tại đẻ test gì đó
            // countDownDate.setSeconds(countDownDate.getSeconds() + 20);

            // Update the count down every 1 second
            var x = setInterval(function() {
                // Get today's date and time
                var now = new Date().getTime();

                // Khoảng cách từ ngày đău ra - tgian hiện tại
                var distance = countDownDate${i.product_id}.getTime() - now;

                // đổi số thành ngày giờ
                var days = Math.floor(distance / (1000 * 60 * 60 * 24));
                var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
                var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
                var seconds = Math.floor((distance % (1000 * 60)) / 1000);

                // Output thời gian
                document.getElementById("cd-"+hold${i.product_id}[1]).innerHTML = days + "d " + hours + "h "
                    + minutes + "m " + seconds + "s ";

                // Hết thời gian thì làm gì
                if (distance < 0) {
                    clearInterval(x);
                    document.getElementById("cd-"+hold${i.product_id}[1]).innerHTML = "EXPIRED";
                    // $('#btnBidModal').addClass('disabled');
                    // $('#btnBidModal').addClass('btn-secondary');
                }
            }, 1000);
                </c:forEach>
            // });

            };

        // function conuntx(id){
        //     var countDownDate = new Date();
        //     //Luôn 20 giây đi trước tgian hiện tại đẻ test gì đó
        //     countDownDate.setSeconds(countDownDate.getSeconds() + 20);
        //
        //     // Update the count down every 1 second
        //     var x = setInterval(function() {
        //         // Get today's date and time
        //         var now = new Date().getTime();
        //
        //         // Khoảng cách từ ngày đău ra - tgian hiện tại
        //         var distance = countDownDate.getTime() - now;
        //
        //         // đổi số thành ngày giờ
        //         var days = Math.floor(distance / (1000 * 60 * 60 * 24));
        //         var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
        //         var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
        //         var seconds = Math.floor((distance % (1000 * 60)) / 1000);
        //
        //         // Output thời gian
        //         document.getElementById("countdown-"+id).innerHTML = days + "d " + hours + "h "
        //             + minutes + "m " + seconds + "s ";
        //
        //         // Hết thời gian thì làm gì
        //         if (distance < 0) {
        //             clearInterval(x);
        //             document.getElementById("cd-"+id).innerHTML = "EXPIRED";
        //             // $('#btnBidModal').addClass('disabled');
        //             // $('#btnBidModal').addClass('btn-secondary');
        //         }
        //     }, 1000);
        // }

        </script>

</jsp:attribute>
</mt:template>
