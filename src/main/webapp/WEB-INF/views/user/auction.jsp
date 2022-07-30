
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="mt" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<mt:template>
    <jsp:attribute name="content">
            <script src="${pageContext.request.contextPath}/resources/webjar/sockjs.min.js"></script>
            <script src="${pageContext.request.contextPath}/resources/webjar/stomp.min.js"></script>
<div class="container py-5">
    <div class="row">
        <div class="col-lg-5 mt-1 d-flex">
            <a class="text-decoration-none text-black" href="${pageContext.request.contextPath}/user/center" id="backBtn" onmouseover="clear()">
                <i  class="fa-solid fa-angles-left fs-3 me-3"></i>
            </a>
            <h4 id="backText">Back to Center</h4>
        </div>
    </div>
    <div class="row">

        <div class="col-lg-5 mt-5">
            <div class="card mb-3 rounded-5 border-0">
                <div id="caroItemIMG" class="carousel slide" data-bs-ride="carousel">
                    <div class="carousel-inner">


                        <c:set var = "imgg" value ="${imgxs}"/>
                        <c:if test = "${empty imgg}">
                            <img class="card-img img-fluid rounded-5" src="https://avatars.dicebear.com/api/pixel-art/null-${prod.product_id}.svg?b=%2375507b" alt="Card image cap">
                                </c:if>

                        <c:if test = "${imgg != null}">

                                 <c:forEach var = "i" items= "${imgxs}" varStatus="fElement">

                        <div class="carousel-item ${fElement.first ? 'active' : ''}">
                            <img class="card-img img-fluid rounded-5" src="${pageContext.request.contextPath}/uploads/images/${i.img}" alt="Card image cap" id="product-detail">
                        </div>
                        </c:forEach>
                                </c:if>



                    </div>

                    <button class="carousel-control-prev" type="button" data-bs-target="#caroItemIMG" data-bs-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Previous</span>
                    </button>
                    <button class="carousel-control-next" type="button" data-bs-target="#caroItemIMG" data-bs-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Next</span>
                    </button>

                </div>
            </div>
            <div class="row">
                <div id="col col-md-12 col-auto  ">
                    <div class="card borderani " id="cardListBorder">
                        <div class="card-header ">
                            <button class="btn ">Load</button>
                        </div>
                        <div class="card-body table-responsive p-0" style="height: 300px">
                            <table class="table table-striped" id="listBid">
                                <thead style="
                          position: sticky;
                          top: 0;
                          /*background-color: rgba(255,255,255,02);*/
                        ">
                                <tr>
                                    <th scope="col"><small>User</small></th>
                                    <th scope="col"><small>Money</small></th>
                                </tr>
                                </thead>
                                <tbody>

                                <c:forEach var="u" items="${bids}">

                                <tr>
                                    <th scope="row">${u.fullname}</th>
                                    <td>${u.bidding_money}</td>
                                </tr>
                                </c:forEach>



                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- col end -->

        <div class="col-lg-7 mt-5" style="max-height: 526px;">
            <div class="card">
                <div class="card-body">
                    <h1 class="h2">${prod.product_name}</h1>
                    <p class="h3 py-2">${prod.price_minium}</p>

                    <ul class="list-inline">
                        <li class="list-inline-item">
                            <h6>Start Date:</h6>
                        </li>
                        <li class="list-inline-item">
                            <p class="text-muted" id="productSdate"><strong>${prod.start_date}</strong></p>
                        </li>
                    </ul>
                    <ul class="list-inline">
                        <li class="list-inline-item">
                            <h6>End Date</h6>
                        </li>
                        <li class="list-inline-item">
                            <p class="text-muted" id="productEdate"><strong>${prod.end_date}</strong></p>
                        </li>
                    </ul>

                    <ul class="list-inline">
                        <li class="list-inline-item">
                            <h6>Step Price:</h6>
                        </li>
                        <li class="list-inline-item">
                            <p class="text-muted" id="productStep"><strong>${prod.price_step}</strong></p>

                        </li>
                    </ul>



                    <div class="row">
                        <div class="col-auto">
                            <ul class="list-inline pb-3">
                                <li class="list-inline-item"><h6>Time left: </h6></li><li class="list-inline-item"><span class="btn btn-success btn-size" id="timeleft"></span></li>
                            </ul>
                        </div>

                    </div>
                    <div class="row pb-3">
                        <div class="col d-grid justify-content-center">

                            <div class="input-group mb-3 ipBid">
                                <input aria-label="Go get it!" onkeypress="return isNumberKeyx(event);" aria-describedby="button-addon2" placeholder="Go get it!"
                                       id="moneyIP" class="form-control border border-success"
                                       type="number" step="${prod.price_step}" min="${not empty max.maxx ? max.maxx : prod.price_step}">

<%--                                <button type="submit" class="btn btn-success btn-lg" id="btnBidModal" data-bs-toggle="modal" data-bs-target="#notaBotModal" onclick="makeBotcode()">Buy</button>--%>
                                <button type="submit" class="btn btn-success btn-lg" id="btnBidModal" >Buy</button>

                            </div>

                        </div>

                    </div>


                </div>
            </div>
        </div>
    </div>
</div>
        <div id="notaBotModal" tabindex="-1" aria-labelledby="notaBotModal" style="display: none;" class="modal fade" aria-hidden="true">
            <div class="modal-dialog ">
                <div class="modal-content align-items-center rounded-4">
                    <div class="modal-header">
                        <div class="modal-title">
                            <span>Not a bot code: <span class="fw-bold" id="botCode"></span></span>
                        </div>

                    </div>
                    <div class="modal-body">
                        <div style="display: flex;" id="botConfirm" class="form-floating input-group mb-3">
                            <input id="ipBotcode" aria-describedby="btnBid" onkeypress="return isNumberKey(event)" placeholder="Are you a bott" type="text"
                                   class="form-control shadow bg-body rounded rounded-start text-wrap fs-5 border-0">
                            <button type="button" id="btnBid" class="btn btn-outline-secondary shadow btn-sm border border-white border-start-0 bg-white rounded-end" data-bs-dismiss="modal">
                                <i class="fa-solid fa-robot text-black fs-4"></i>
                            </button>

                            <label for="botConfirm">Are you a bot</label>
                        </div>
                    </div>

                </div>
            </div>
        </div>
<style>
    body{background-color: #AAD4D9;}
    #btnBid:hover{
        background-color: #f7f7f7 !important;
    }
    .borderani {
        position: relative;
        border-radius: 5px;
    }
    .borderani:after {
        content: '';
        position: absolute;
        top: calc(-1 * 5px);
        left: calc(-1 * 5px);
        height: calc(100% + 5px * 2);
        width: calc(100% + 5px * 2);
        background: linear-gradient(60deg, #f79533, #f37055, #ef4e7b, #a166ab, #5073b8, #1098ad, #07b39b, #6fba82);
        border-radius: calc(2 * 5px);
        z-index: -1;
        -webkit-animation: animatedgradient 3s ease alternate infinite;
        animation: animatedgradient 3s ease alternate infinite;
        background-size: 300% 300%;
    }


    @-webkit-keyframes animatedgradient {
        0% {
            background-position: 0% 50%;
        }
        50% {
            background-position: 100% 50%;
        }
        100% {
            background-position: 0% 50%;
        }
    }


    @keyframes animatedgradient {
        0% {
            background-position: 0% 50%;
        }
        50% {
            background-position: 100% 50%;
        }
        100% {
            background-position: 0% 50%;
        }
    }
</style>
<script>
    var startTime = new Date("${prod.start_date}");
    var eTime = new Date("${prod.end_date}");

    if( eTime.getTime() < new Date().getTime() ){
        $('#timeleft').html("No more bidding");
        $('#cardListBorder').removeClass("borderani");
        $('.ipBid').empty();
    }
    else if( startTime.getTime() < new Date().getTime() ){

        <%--$('.prodlink${prod.product_id}').attr("href", "${pageContext.request.contextPath}/user/auction?id=${i.product_id}");--%>

        var endTime${prod.product_id} = new Date("${prod.end_date}");
        $('#timeleft').countdown(endTime${prod.product_id}, function (event) {
            var $this = $(this).html(event.strftime('End in '
                + '%D days %H:%M:%S'));
        })
            .on('finish.countdown', function (event) {
                $('.ipBid').empty();
                $('#timeleft').html("No more bidding");
                $('#cardListBorder').removeClass("borderani");

                <%--$.fn.productLive(${i.product_id},"${i.product_name}");--%>
            })
    }
    else {

        $('#timeleft').countdown(startTime, function (event) {
            var $this = $(this).html(event.strftime('Start at '
                + '%D days %H:%M:%S'));
        }).on('finish.countdown', function (event) {

            $('#cardListBorder').addClass("borderani");


            <%--$.fn.productLive(${i.product_id},"${i.product_name}");--%>


            $('.prodlink${prod.product_id}').attr("href", "${pageContext.request.contextPath}/user/auction?id=${i.product_id}");

            var endTime${prod.product_id} = new Date("${prod.end_date}");
            $('#timeleft').countdown(endTime${prod.product_id}, function (event) {
                var $this = $(this).html(event.strftime('End in '
                    + '%D days %H:%M:%S'));
            })
                .on('finish.countdown', function (event) {
                    // your code goes here
                    $('.ipBid').empty();
                    $('#timeleft').html("No more bidding");
                    $('#cardListBorder').removeClass("borderani");

                    <%--$.fn.productLive(${i.product_id},"${i.product_name}");--%>
                });
        });
    }


    function loadd(){
            $.get("${pageContext.request.contextPath}/api/getlist",
                {
                    prodID:${prod.product_id},
                },function (data){
                toastr.success("Websocket work","",{
                    timeOut: 3000,
                    progressBar: true,
                    progressAnimation: 'increasing'
                });
                    var cont = "";
                    var x = data['bidhistory'];
                    for (var i = 0; i < x.length; i++) {

                        cont += '<tr>';
                        cont += '<th scope="row">' + x[i].fullname+ '</th>';
                        cont += '<td>' + x[i].bidding_money + '</td>';
                        cont += '</tr>';
                    }
                    $('#listBid tbody').html(cont);
                    $('#moneyIP').val(data.max.maxx).attr("min",data.max.maxx);

                });

    }

$.fn.bidd = function bidx(){
    $.get("${pageContext.request.contextPath}/api/bid",
        {
            prodID:${prod.product_id},
            userID: ${not empty acc.id ? acc.id : 0},
            money:$('#moneyIP').val()
        },function (data){
            var cont = "";
            var x = data['bidhistory'];
            for (var i = 0; i < x.length; i++) {

                cont += '<tr>';
                cont += '<th scope="row">' + x[i].fullname+ '</th>';
                cont += '<td>' + x[i].bidding_money + '</td>';
                cont += '</tr>';
            }
            $('#listBid tbody').html(cont);
            $('#moneyIP').val("");
            $('#moneyIP').val(data.max.maxx).attr("min",data.max.maxx);
            sendSignal();
            $('#btnBidModal').addClass("disabled");
            setTimeout(function (){
                $('#btnBidModal').removeClass("disabled");
            },5000)
        });

};

    $('#btnBidModal').on('click',function () {
        $.fn.bidd();
    });
    // $('#btnBid').on('click',function (){
    //     var numb = $("#botCode").html();
    //     var numbb = $("#ipBotcode").val();
    //
    //     if(numb === numbb){
    //         makeBotcode();
    //         $("#ipBotcode").val("");
    //         $("#notaBotModal").removeClass("show");
    //         $("#notaBotModal").css("display","none");
    //         toastr.info("Wait! Something new coming!", {
    //             timeOut: 2000,
    //             progressBar: true,
    //             progressAnimation: 'increasing'
    //         });
    //         $.fn.blockBid();
    //     } else{
    //         toastr.warning("Wrong! You a bot!", {
    //             timeOut: 2000,
    //             progressBar: true,
    //             progressAnimation: 'increasing'
    //         });
    //
    //         makeBotcode();
    //         $("#ipBotcode").val("");
    //     }
    // });
    $('#ipBotcode').keypress(function (e) {
        if($('#ipBotcode').val().length == 4 ){
            return false;
        }
    });
    $.fn.blockBid = function (){
        var $thisx = $("#btnBidModal");
        $thisx.removeClass('btn-success');
        $thisx.addClass('disabled');
        $thisx.addClass('btn-secondary');

            setTimeout(() => {
                $thisx.removeClass('disabled');
                $thisx.removeClass('btn-secondary');
                $thisx.addClass('btn-success');

        }, 6000);
    }
    function isNumberKeyx(evt){
        var charCode = (evt.which) ? evt.which : evt.keyCode
        // if (charCode > 31 && (charCode < 37 && charCode > 41))
        if (charCode == 37 || charCode == 38 || charCode == 39 || charCode == 40){return true;}
        else if ((charCode >= 48 && charCode <= 57) || (charCode >= 96 && charCode <= 105)){return false;}
        else return false;
    }
    var stompClient = null;

    window.onload = connectx()
    function connectx() {
        var socket = new SockJS('/wspath');
        stompClient = Stomp.over(socket);
        stompClient.connect({}, function (frame) {
            setConnected(true);
            console.log('Connected: ' + frame);
            stompClient.subscribe('/auction/bidding', function (greeting) {
                loadd();
            });
        });
    }
    function sendSignal() {
        stompClient.send("/app/wsbid", {}, JSON.stringify({'name': "1"}));
    }

    function setConnected(connected) {
        $("#connect").prop("disabled", connected);
        $("#disconnect").prop("disabled", !connected);
        if (connected) {
            $("#conversation").show();
        }
        else {
            $("#conversation").hide();
        }
        $("#greetings").html("");
    }
    // var countDownDate = new Date();
    // //Luôn 20 giây đi trước tgian hiện tại đẻ test gì đó
    // countDownDate.setSeconds(countDownDate.getSeconds() + 20);
    //
    // // Update the count down every 1 second
    // var x = setInterval(function() {
    //     // Get today's date and time
    //     var now = new Date().getTime();
    //
    //     // Khoảng cách từ ngày đău ra - tgian hiện tại
    //     var distance = countDownDate.getTime() - now;
    //
    //     // đổi số thành ngày giờ
    //     var days = Math.floor(distance / (1000 * 60 * 60 * 24));
    //     var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
    //     var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
    //     var seconds = Math.floor((distance % (1000 * 60)) / 1000);
    //
    //     // Output thời gian
    //     document.getElementById("timeleft").innerHTML = days + "d " + hours + "h "
    //         + minutes + "m " + seconds + "s ";
    //
    //     // Hết thời gian thì làm gì
    //     if (distance < 0) {
    //         clearInterval(x);
    //         document.getElementById("timeleft").innerHTML = "EXPIRED";
    //         // $('#btnBidModal').addClass('disabled');
    //         // $('#btnBidModal').addClass('btn-secondary');
    //     }
    // }, 1000);
</script>
</jsp:attribute>
</mt:template>
<mt:footer>

</mt:footer>