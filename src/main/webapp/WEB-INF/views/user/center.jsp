
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
                            <option onclick="window.location.replace('${pageContext.request.contextPath}/user/center')">All Product</option>
                            <c:forEach items="${cates}" var="cate">
                                <option onclick="window.location.replace('${pageContext.request.contextPath}/user/center?cateid=${cate.id}')">${cate.name} </option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
            </div>
            <div class="row">
                <c:forEach var = "i" items= "${prods}">


                <div class="col-md-4">

                    <div class="card mb-4 product-wap rounded-0 ">

                            <a class="nav-link prodlink${i.product_id}" href="#">
                        <div class="card rounded-0 cardmain${i.product_id}">
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
                        </div>
                            </a>
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



    /*.ribbon {*/
    /*    position: absolute;*/
    /*    right: -5px;*/
    /*    top: -5px;*/
    /*    z-index: 1;*/
    /*    overflow: hidden;*/
    /*    width: 93px;*/
    /*    height: 93px;*/
    /*    text-align: right;*/
    /*}*/
    /*.ribbon span {*/
    /*    font-size: 0.8rem;*/
    /*    color: #fff;*/
    /*    text-transform: uppercase;*/
    /*    text-align: center;*/
    /*    font-weight: bold;*/
    /*    line-height: 32px;*/
    /*    transform: rotate(45deg);*/
    /*    width: 125px;*/
    /*    display: block;*/
    /*    background: #79a70a;*/
    /*    background: linear-gradient(#9bc90d 0%, #79a70a 100%);*/
    /*    box-shadow: 0 3px 10px -5px rgba(0, 0, 0, 1);*/
    /*    position: absolute;*/
    /*    top: 17px; // change this, if no border*/
    /*right: -29px; // change this, if no border*/
    /*}*/

    /*.ribbon span::before {*/
    /*    content: '';*/
    /*    position: absolute;*/
    /*    left: 0px; top: 100%;*/
    /*    z-index: -1;*/
    /*    border-left: 3px solid #79A70A;*/
    /*    border-right: 3px solid transparent;*/
    /*    border-bottom: 3px solid transparent;*/
    /*    border-top: 3px solid #79A70A;*/
    /*}*/
    /*.ribbon span::after {*/
    /*    content: '';*/
    /*    position: absolute;*/
    /*    right: 0%; top: 100%;*/
    /*    z-index: -1;*/
    /*    border-right: 3px solid #79A70A;*/
    /*    border-left: 3px solid transparent;*/
    /*    border-bottom: 3px solid transparent;*/
    /*    border-top: 3px solid #79A70A;*/
    /*}*/

    /*.red span {*/
    /*    background: linear-gradient(#f70505 0%, #8f0808 100%);*/
    /*}*/
    /*.red span::before {*/
    /*    border-left-color: #8f0808;*/
    /*    border-top-color: #8f0808;*/
    /*}*/
    /*.red span::after {*/
    /*    border-right-color: #8f0808;*/
    /*    border-top-color: #8f0808;*/
    /*}*/
    /*.borderani {*/
    /*    border:10px solid black;*/
    /*    !*background: #ffd73e33;*!*/
    /*    border-image: url("data:image/svg+xml;charset=utf-8,%3Csvg width='100' height='100' viewBox='0 0 100 100' fill='none' xmlns='http://www.w3.org/2000/svg'%3E %3Cstyle%3Epath%7Banimation:stroke 5s infinite linear%3B%7D%40keyframes stroke%7Bto%7Bstroke-dashoffset:776%3B%7D%7D%3C/style%3E%3ClinearGradient id='g' x1='0%25' y1='0%25' x2='0%25' y2='100%25'%3E%3Cstop offset='0%25' stop-color='%232d3561' /%3E%3Cstop offset='25%25' stop-color='%23c05c7e' /%3E%3Cstop offset='50%25' stop-color='%23f3826f' /%3E%3Cstop offset='100%25' stop-color='%23ffb961' /%3E%3C/linearGradient%3E %3Cpath d='M1.5 1.5 l97 0l0 97l-97 0 l0 -97' stroke-linecap='square' stroke='url(%23g)' stroke-width='3' stroke-dasharray='388'/%3E %3C/svg%3E") 1;*/
    /*}*/
    .borderani {
        position: relative;
    }
    .borderani::before, .borderani::after {
        content: '';
        box-sizing: border-box;
        position: absolute;
        border: 8px solid transparent;
        width: 0;
        height: 0;
    }
    .borderani::before {
        top: 0;
        left: 0;

        border-top-color: rgba(47,161,118,0.5);
        border-right-color: rgba(47,161,118,0.5);
        animation: border 2s infinite;
    }
    .borderani::after {
        bottom: 0;
        right: 0;
        animation: border 2s 1s infinite, borderColor 2s 1s infinite;
    }

    @keyframes border {
        0% {
            width: 0;
            height: 0;
        }
        25% {
            width: 100%;
            height: 0;
        }
        50% {
            width: 100%;
            height: 100%;
        }
        100% {
            width: 100%;
            height: 100%;
        }
    }
    @keyframes borderColor {
        0% {
            border-bottom-color: rgba(72,208,133,1) ;
            border-left-color: rgba(72,208,133,1) ;
        }
        50% {
            border-bottom-color: rgba(0,212,255,1);
            border-left-color: rgba(0,212,255,1);
        }
        51% {
            border-bottom-color: transparent;
            border-left-color: transparent;
        }
        100% {
            border-bottom-color: transparent;
            border-left-color: transparent;
        }
    }
</style>
        <script>

            window.onload = countt();
                function countt() {
                    <c:forEach var="i" items="${prods}">


                    var startTime${i.product_id} = new Date("${i.start_date}");
                    var eTime${i.product_id} = new Date("${i.end_date}");

                    if( eTime${i.product_id}.getTime() < new Date().getTime() ){
                        console.log(eTime${i.product_id}.getTime());
                        $('#cd-${i.product_id}').html("No more bidding");
                    }

                    else if( startTime${i.product_id}.getTime() < new Date().getTime() ){

                        $('.prodlink${i.product_id}').attr("href", "${pageContext.request.contextPath}/user/auction?id=${i.product_id}");
                        var endTime${i.product_id} = new Date("${i.end_date}");
                        $('#cd-${i.product_id}').countdown(endTime${i.product_id}, function (event) {
                            var $this = $(this).html(event.strftime('Ending in '
                                + '%D days %H:%M:%S'));
                            $('.cardmain${i.product_id}').addClass('borderani');
                        })
                            .on('finish.countdown', function (event) {
                                // on finish bidding, what you want to do
                                $('.prodlink${i.product_id}').attr("href", "");
                                $('.cardmain${i.product_id}').removeClass('borderani');
                                $('#cd-${i.product_id}').html("No more bidding");
                                <%--$.fn.productLive(${i.product_id},"${i.product_name}");--%>
                            })
                    }
                    else {

                    $('#cd-${i.product_id}').countdown(startTime${i.product_id}, function (event) {
                        var $this = $(this).html(event.strftime('Start in '
                            + '%D days %H:%M:%S'));
                    }).on('finish.countdown', function (event) {

                            $('#cd-${i.product_id}').html("Timer Finis" +
                                "hed");
                        $('.cardmain${i.product_id}').addClass('borderani');

                            <%--$.fn.productLive(${i.product_id},"${i.product_name}");--%>


                            $('.prodlink${i.product_id}').attr("href", "${pageContext.request.contextPath}/user/auction?id=${i.product_id}");
                              var endTime${i.product_id} = new Date("${i.end_date}");
                            $('#cd-${i.product_id}').countdown(endTime${i.product_id}, function (event) {
                                var $this = $(this).html(event.strftime('Ending in '
                                    + '%D days %H:%M:%S'));
                            })
                                .on('finish.countdown', function (event) {
                                    // your code goes here
                                    $('.prodlink${i.product_id}').attr("href", "");
                                    $('.cardmain${i.product_id}').removeClass('borderani');
                                    $('#cd-${i.product_id}').html("No more bidding");
                                    <%--$.fn.productLive(${i.product_id},"${i.product_name}");--%>
                                });
                        });
                    }
                    </c:forEach>
                };



            $.fn.productLive = function xxc(param,prodname) {

                $.ajax({
                    type: "GET",
                    url: "${pageContext.request.contextPath}/api/changeprod",
                    data: {action:3,id: param},
                    cache: true,
                    success: function (result) {
                        // setTimeout(function(){
                        //     //window.location.href = "< ?//= site_url("admin/subscription/change/") ?>//" + param;
                        // }, 3000);
                            toastr.success(param, 'Product name: '+prodname+', go LIVE ', {
                                timeOut: 5000,
                                progressBar: true,
                                progressAnimation: 'increasing'
                            });
                    }, error: function () {
                        toastr.error('STOP', '', {
                            timeOut: 3000,
                            progressBar: true,
                            progressAnimation: 'increasing'
                        });
                    }
                });
            }
            <%--    function countt() {--%>
        <%--// $('.textcd').each(function (){--%>
        <%--        <c:forEach var="i" items="${prods}">--%>
        <%--    &lt;%&ndash;var idCount${i.product_id} = $('.textcd').attr('id');&ndash;%&gt;--%>
        <%--        var idCount${i.product_id} = $('#cd-${i.product_id}').attr('id');--%>

        <%--        var hold${i.product_id} = idCount${i.product_id}.split("-");--%>
        <%--   // var  idCount = $('.cardpd .list-unstyled li').attr("id");--%>
        <%--   &lt;%&ndash; console.log(hold${i.product_id}[1]);&ndash;%&gt;--%>
        <%--    var countDownDate${i.product_id} = new Date("${i.start_date}");--%>
        <%--    //Luôn 20 giây đi trước tgian hiện tại đẻ test gì đó--%>
        <%--    // countDownDate.setSeconds(countDownDate.getSeconds() + 20);--%>

        <%--    // Update the count down every 1 second--%>
        <%--    var x = setInterval(function() {--%>
        <%--        // Get today's date and time--%>
        <%--        var now = new Date().getTime();--%>

        <%--        // Khoảng cách từ ngày đău ra - tgian hiện tại--%>
        <%--        var distance = countDownDate${i.product_id}.getTime() - now;--%>

        <%--        // đổi số thành ngày giờ--%>
        <%--        var days = Math.floor(distance / (1000 * 60 * 60 * 24));--%>
        <%--        var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));--%>
        <%--        var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));--%>
        <%--        var seconds = Math.floor((distance % (1000 * 60)) / 1000);--%>

        <%--        // Output thời gian--%>
        <%--        document.getElementById("cd-"+hold${i.product_id}[1]).innerHTML = days + "d " + hours + "h "--%>
        <%--            + minutes + "m " + seconds + "s ";--%>

        <%--        // Hết thời gian thì làm gì--%>
        <%--        if (distance < 0) {--%>
        <%--            clearInterval(x);--%>
        <%--            document.getElementById("cd-"+hold${i.product_id}[1]).innerHTML = "EXPIRED";--%>
        <%--            // $('#btnBidModal').addClass('disabled');--%>
        <%--            // $('#btnBidModal').addClass('btn-secondary');--%>
        <%--        }--%>
        <%--    }, 1000);--%>
        <%--        </c:forEach>--%>
        <%--    // });--%>

        <%--    };--%>



        </script>

</jsp:attribute>
</mt:template>
