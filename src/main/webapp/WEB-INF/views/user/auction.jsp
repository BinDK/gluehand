
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="mt" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<mt:template>
    <jsp:attribute name="content">
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
                <div id="col col-md-12 col-auto ">
                    <div class="card rounded-3">
                        <div class="card-body table-responsive p-0" style="height: 300px">
                            <table class="table table-striped">
                                <thead style="
                          position: sticky;
                          top: 0;
                          background-color: white;
                        ">
                                <tr>
                                    <th scope="col">#</th>
                                    <th scope="col"><small>Type</small></th>
                                    <th scope="col"><small>Created</small> on</th>
                                    <th scope="col"><small>Status</small></th>
                                    <th scope="col"><small>Total</small></th>
                                    <th scope="col"><small>Note</small></th>
                                </tr>
                                </thead>
                                <tbody>


                                <tr>
                                    <th scope="row">1</th>
                                    <td>Mark</td>
                                    <td>Otto</td>
                                    <td>@mdo</td>
                                    <td>@Jim Hulper</td>
                                    <td>@Dwight</td>
                                </tr>



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
                    <h1 class="h2">Active Wear</h1>
                    <p class="h3 py-2">$25.00</p>

                    <ul class="list-inline">
                        <li class="list-inline-item">
                            <h6>Start Date:</h6>
                        </li>
                        <li class="list-inline-item">
                            <p class="text-muted" id="productSdate"><strong>Easy Wear</strong></p>
                        </li>
                    </ul>
                    <ul class="list-inline">
                        <li class="list-inline-item">
                            <h6>Start Date</h6>
                        </li>
                        <li class="list-inline-item">
                            <p class="text-muted" id="productEdate"><strong>End Date</strong></p>
                        </li>
                    </ul>

                    <h6>Description:</h6>
                    <p>Description....</p>

                    <ul class="list-inline">
                        <li class="list-inline-item">
                            <h6>Step:</h6>
                        </li>
                        <li class="list-inline-item">
                            <p class="text-muted" id="productStep"><strong>Step Price: </strong></p>

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

                            <div class="input-group mb-3">
                                <input aria-label="Recipient's username" onkeypress="return isNumberKeyx(event);" aria-describedby="button-addon2" placeholder="Go get it!" class="form-control border border-success" type="number" step="50" min="50.00">

                                <button type="submit" class="btn btn-success btn-lg" id="btnBidModal" data-bs-toggle="modal" data-bs-target="#notaBotModal" onclick="makeBotcode()">Buy</button>
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

</style>
<script>


    $('#btnBid').on('click',function (){
        var numb = $("#botCode").html();
        var numbb = $("#ipBotcode").val();

        if(numb === numbb){
            makeBotcode();
            $("#ipBotcode").val("");
            $("#notaBotModal").removeClass("show");
            $("#notaBotModal").css("display","none");
            toastr.info("Wait! Something new coming!", {
                timeOut: 2000,
                progressBar: true,
                progressAnimation: 'increasing'
            });
            $.fn.blockBid();
        } else{
            toastr.warning("Wrong! You a bot!", {
                timeOut: 2000,
                progressBar: true,
                progressAnimation: 'increasing'
            });

            makeBotcode();
            $("#ipBotcode").val("");
        }
    });
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

    var startTime = new Date("${start_date}");
    var eTime = new Date("${end_date}");

    if( eTime.getTime() < new Date().getTime() ){
        $('#cd-${i.product_id}').html("No more bidding");
    }
    else if( startTime.getTime() < new Date().getTime() ){

        $('.prodlink${i.product_id}').attr("href", "${pageContext.request.contextPath}/user/auction?id=${i.product_id}");
        var endTime${i.product_id} = new Date("${i.end_date}");
        $('#cd-${i.product_id}').countdown(endTime${i.product_id}, function (event) {
            var $this = $(this).html(event.strftime(''
                + '%D days %H:%M:%S'));
        })
            .on('finish.countdown', function (event) {
                // your code goes here
                $('.prodlink${i.product_id}').attr("href", "");
                $('#cd-${i.product_id}').html("No more bidding");
                <%--$.fn.productLive(${i.product_id},"${i.product_name}");--%>
            })
    }
    else {

        $('#cd-${i.product_id}').countdown(startTime, function (event) {
            var $this = $(this).html(event.strftime(''
                + '%D days %H:%M:%S'));
        }).on('finish.countdown', function (event) {

            $('#cd-${i.product_id}').html("Timer Finis" +
                "hed");

            <%--$.fn.productLive(${i.product_id},"${i.product_name}");--%>


            setTimeout(function (){
                $('.prodlink${i.product_id}').attr("href", "${pageContext.request.contextPath}/user/auction?id=${i.product_id}");
                var endTime${i.product_id} = new Date("${i.end_date}");
                $('#cd-${i.product_id}').countdown(endTime${i.product_id}, function (event) {
                    var $this = $(this).html(event.strftime(''
                        + '%D days %H:%M:%S'));
                })
                    .on('finish.countdown', function (event) {
                        // your code goes here
                        $('.prodlink${i.product_id}').attr("href", "");
                        $('#cd-${i.product_id}').html("No more bidding");
                        <%--$.fn.productLive(${i.product_id},"${i.product_name}");--%>
                    })},3000);
        });
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