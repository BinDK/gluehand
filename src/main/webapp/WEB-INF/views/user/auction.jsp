
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="mt" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<mt:template>
    <jsp:attribute name="content">
<div class="container py-5">
    <div class="row">
        <div class="col-lg-5 mt-1 d-flex">
            <a class="text-decoration-none text-black" href="${pageContext.request.contextPath}/center" id="backBtn" onmouseover="clear()">
                <i  class="fa-solid fa-angles-left fs-3 me-3"></i>
            </a>
            <h4 id="backText">Back to Center</h4>
        </div>
    </div>
    <div class="row">

        <div class="col-lg-5 mt-5">
            <div class="card mb-3 rounded-5 border-0">
                <img class="card-img img-fluid rounded-5" src="https://avatars.dicebear.com/api/pixel-art/product_single_10.svg?b=%2375507b" alt="Card image cap" id="product-detail">
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


                                <tr>
                                    <th scope="row">2</th>
                                    <td>Mark</td>
                                    <td>Otto</td>
                                    <td>@mdo</td>
                                    <td>@Jim Hulper</td>
                                    <td>@Dwight</td>
                                </tr>


                                <tr>
                                    <th scope="row">3</th>
                                    <td>Mark</td>
                                    <td>Otto</td>
                                    <td>@mdo</td>
                                    <td>@Jim Hulper</td>
                                    <td>@Dwight</td>
                                </tr>


                                <tr>
                                    <th scope="row">4</th>
                                    <td>Mark</td>
                                    <td>Otto</td>
                                    <td>@mdo</td>
                                    <td>@Jim Hulper</td>
                                    <td>@Dwight</td>
                                </tr>


                                <tr>
                                    <th scope="row">5</th>
                                    <td>Mark</td>
                                    <td>Otto</td>
                                    <td>@mdo</td>
                                    <td>@Jim Hulper</td>
                                    <td>@Dwight</td>
                                </tr>


                                <tr>
                                    <th scope="row">6</th>
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



                    <!--
                                                    <div class="row">
                                                        <div class="col-auto">
                                                            <ul class="list-inline pb-3">
                                                                <li class="list-inline-item">Size :
                                                                    <input type="hidden" name="product-size" id="product-size" value="S">
                                                                </li>
                                                                <li class="list-inline-item"><span class="btn btn-success btn-size">S</span></li>
                                                                <li class="list-inline-item"><span class="btn btn-success btn-size">M</span></li>
                                                                <li class="list-inline-item"><span class="btn btn-success btn-size">L</span></li>
                                                                <li class="list-inline-item"><span class="btn btn-success btn-size">XL</span></li>
                                                            </ul>
                                                        </div>
                                                        <div class="col-auto">
                                                            <ul class="list-inline pb-3">
                                                                <li class="list-inline-item text-right">
                                                                    Quantity
                                                                    <input type="hidden" name="product-quanity" id="product-quanity" value="1">
                                                                </li>
                                                                <li class="list-inline-item"><span class="btn btn-success" id="btn-minus">-</span></li>
                                                                <li class="list-inline-item"><span class="badge bg-secondary" id="var-value">1</span></li>
                                                                <li class="list-inline-item"><span class="btn btn-success" id="btn-plus">+</span></li>
                                                            </ul>
                                                        </div>
                                                    </div> -->
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

</script>
</jsp:attribute>
</mt:template>
