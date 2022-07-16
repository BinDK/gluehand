
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

    <div class="row ms-1">
        <div class="col-md-3">
            <div class="card text-center border-success mb-3" style="max-width: 18rem">

                <div class="card-body text-success fw-bold btn bmnx" id="addBtn">
                    Add Product
                </div>
            </div>
        </div>
        <div class="col-md-6">
            <div class="card text-center border-success mb-3" >

                <div class="card-body text-success fw-bold btn bmnx" id="waitingBtn">Waiting / Approve product</div>
            </div>
        </div>
<%--        <div class="col-md-3">--%>
<%--            <div class="card text-center border-success mb-3" style="max-width: 18rem">--%>

<%--                <div class="card-body text-success fw-bold btn bmnx" id="approvedBtn">Approved Product</div>--%>
<%--            </div>--%>
<%--        </div>--%>
        <div class="col-md-3">
            <div class="card text-center border-success mb-3" style="max-width: 18rem">

                <div class="card-body text-success fw-bold btn bmnx" id="paidBtn">Paid Product</div>
            </div>
        </div>
    </div>

    <div class="row">
        <div id="addProd" class="col-md-12 popeye fade show">
            <div class="card">
<%--                <form method="post" enctype="multipart/form-data" id="formO">--%>

                <div class="card-body">
                    <h1 class="h2 text-center">Adding More Product</h1>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-floating mb-3">
                                <input
                                        class="form-control shadow bg-body rounded" id="prodName" type="text" placeholder="Product Name"/>
                                <label for="prodName">Product Name</label>
                            </div>
                            <div class="form-floating mb-3">
                                <input
                                        class="form-control shadow rounded" id="prodPrice" type="text" placeholder="Price" maxlength="11"/>
                                <label for="prodPrice">Price</label>
                            </div>
                            <div class="form-floating mb-3">
                                <input class="form-control shadow bg-body ountline-success rounded"
                                        id="prodStep" type="number" onkeypress="return isNumberKey(event)"
                                        min="50" step="50" value="50" max="10000" maxlength="4" placeholder="Price Step"/>
                                <label for="prodStep">Price Step</label>
                            </div>
                        </div>

                        <div class="col-md-6">

                            <div class="row">

                                <div class="col-md-6">
                                    <div class="form-floating mb-3">
                                        <input class="form-control shadow bg-body ountline-success rounded " id="sDate"
                                               type="text" placeholder="Start Date"/>
                                        <label for="sDate">Start Date</label>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-floating ">
                                                <input class="form-control shadow bg-body ountline-success rounded" onkeypress="return isNumberKeyx(event)" maxlength="2" min="0" value="0" max="24" id="sHour" type="number" placeholder="Start Hours"/>
                                                <label for="sHour">Start Hour</label>
                                            </div>
                                        </div>


                                        <div class="col-md-6">
                                            <div class="form-floating ">
                                                <input class="form-control shadow bg-body ountline-success rounded" onkeypress="return isNumberKeyx(event)" maxlength="2" min="0" value="0" max="60" id="sMin" type="number" placeholder="Star Minute"/>
                                                <label for="sMin">Start Minute</label>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>

                            <div class="row">

                                <div class="col-md-6">
                                    <div class="form-floating mb-3">
                                        <input class="form-control shadow bg-body ountline-success rounded " id="eDate"
                                               type="text" placeholder="End Date"/>
                                        <label for="eDate">End Date</label>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-floating ">
                                                <input class="form-control shadow bg-body ountline-success rounded" onkeypress="return isNumberKeyx(event)" maxlength="2" min="0" value="0" max="24" id="eHour" type="number" placeholder="Start Hours"/>
                                                <label for="eHour">End  Hour</label>
                                            </div>
                                        </div>


                                        <div class="col-md-6">
                                            <div class="form-floating ">
                                                <input class="form-control shadow bg-body ountline-success rounded" onkeypress="return isNumberKeyx(event)" maxlength="2" min="0" value="0" max="60" id="eMin" type="number" placeholder="Star Minute"/>
                                                <label for="eMin">End Minute</label>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>

                            <div class="form-floating mb-3 shadow rounded">
                                <input class="form-control " name="files" style=" opacity: 0;" id="prodImg" type="file" placeholder="Product Image" multiple="multiple"/>
                                <label for="prodImg">Product Images</label>
                            </div>


                        </div>

                    </div>

                    <div class="row ms-1 rowxs">

                        <div class="col-md-12">
                        </div>
                    </div>

                </div>

                <div class="card-footer text-center">
                    <button id="addProdBtn" class="btn btn-primary rounded-0">Add this and bid!!</button>
                </div>
<%--                </form>--%>
            </div>
        </div>

        <div id="waitingProd" class="col-md-12 popeye fade">
            <div class="row">
                <div class="col-md-6">
                 <div class="card">
                <div class="card-header text-center">Waiting List</div>
                <div class="card-body table-responsive p-0" style="height: 300px">
                    <table class="table table-striped" id="tableWaiting">
                        <thead style="
                          position: sticky;
                          top: 0;
                          background-color: white;
                        ">
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col"><small>Product Name</small></th>
                            <th scope="col"><small>Auction start / end</small></th>
                            <th scope="col"><small>Price / Price Step</small></th>

                            <th scope="col"><small>Action</small></th>
                        </tr>
                        </thead>
                        <tbody>

                        <c:forEach var="i" begin="1" end="3">
                        <tr>
                            <th scope="row">${i}</th>
                            <td>Mark</td>
                            <td>Otto</td>
                            <td>@mdo</td>
                            <td>
                                <button class="btn btn-danger btnxm" id="btnx-${i}">Cancel</button></td>
                        </tr>
                        </c:forEach>


                        </tbody>
                    </table>
                </div>
            </div>
                </div>

                <div class="col-md-6">
                 <div class="card">
                <div class="card-header text-center">Approved List</div>
                <div class="card-body table-responsive p-0" style="height: 300px">
                    <table class="table table-striped" id="tableApproved">
                        <thead style="
                          position: sticky;
                          top: 0;
                          background-color: white;
                        ">
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col"><small>Product Name</small></th>
                            <th scope="col"><small>Auction start / end</small></th>
                            <th scope="col"><small>Price / Price Step</small></th>

                            <th scope="col"><small>Action</small></th>
                        </tr>
                        </thead>
                        <tbody>

                        <c:forEach var="i" begin="1" end="3">
                        <tr>
                            <th scope="row">${i}</th>
                            <td>Mark</td>
                            <td>Otto</td>
                            <td>@mdo</td>
                            <td>
                                <button class="btn btn-danger btnxm" id="btnx-${i}">Cancel</button></td>
                        </tr>
                        </c:forEach>


                        </tbody>
                    </table>
                </div>
            </div>
                </div>

            </div>
        </div>
        <div id="approvedProd" class="col-md-12 popeye fade">
            <div class="card">
                <div class="card-body">
                    <h1 class="h2">Active Wear 3</h1></div>
            </div>
        </div>
        <div id="paidProd" class="col-md-12 popeye fade">
            <div class="card">
                <div class="card-body">
                    <h1 class="h2">Active Wear 4</h1></div>
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
// function cancelProd(id){
//     $.ajax()
// }


$('.btnxm').click(function(){
    var holdid = $(this).attr("id");
    var idx = holdid.split("-")
    console.log(idx[1]);
   $.fn.ajaxCancel(idx[1]);

});
$.fn.ajaxCancel = function idxc(param) {

        $.ajax({
            type: "GET",
            url: "${pageContext.request.contextPath}/api/cancelprod",
            data: {id : param},
            cache: true,
            timeOut: 1000,
            success: function (result) {
                // setTimeout(function(){
                //     //window.location.href = "< ?//= site_url("admin/subscription/change/") ?>//" + param;
                // }, 3000);
                toastr.success(param,'Successfuly Cancel Product ID: ' , {
                    timeOut: 2900,
                    progressBar: true,
                    progressAnimation: 'increasing'
                });
            },
            error:function(){
                toastr.error('STOP','', {
                    timeOut: 3000,
                    progressBar: true,
                    progressAnimation: 'increasing'
                });
            }
        });


}

    $("#addProdBtn").click(function (e){
        // $("#form0").submit(function (e){
            // e.preventDefault();
            var formData = new FormData();
       let prodName = $("#prodName").val();
       let prodPrice = $("#prodPrice").val();
        let prodStep = $("#prodStep").val();
        var filesx= document.getElementById('prodImg').files;

        let prodSHour = $("#sHour").val()? $("#sHour").val(): '0';
        let prodSMin = $("#sMin").val()? $("#sMin").val(): '0';
        let prodEHour = $("#eHour").val()? $("#eHour").val(): '0';
        let prodEMin = $("#eMin").val()? $("#eMin").val(): '0';

        let prodSDate = $("#sDate").val()+" " + prodSHour+":"+prodSMin;
        let prodEDate = $("#eDate").val()+" " + prodEHour+":"+prodEMin;
        if( (prodName == null || prodName == '') ||
            (prodPrice == null || prodPrice == '') ||
            (prodStep == null || prodStep == '') ||
             prodEDate == prodSDate){

            alert(1);
            return false;
        } else{

            alert(2);
        }

        alert(3);


        var filesx= document.getElementById('prodImg').files;
        <%--for( let ix = 0; ix < filesx.length;ix++){--%>
        <%--    formData.append('files',filesx[ix]);--%>
        <%--}--%>
        <%--$.ajax({--%>
        <%--    method: "POST",--%>
        <%--    // enctype: 'multipart/form-data',--%>
        <%--    url: "${pageContext.request.contextPath}/api/upload",--%>
        <%--    data: formData,--%>
        <%--    contentType: false,--%>
        <%--    cache: false,--%>
        <%--    processData: false,--%>
        <%--    // data: $("#loginForm").serialize(),--%>
        <%--    success: function (result) {--%>

        <%--        toastr.success('UploadED Product Photo', '', {--%>
        <%--            timeOut: 2900,--%>
        <%--            progressBar: true,--%>
        <%--            progressAnimation: 'increasing'--%>
        <%--        });--%>
        <%--            $('#prodImg').val("");--%>
        <%--        --%>
        <%--    },--%>
        <%--    error:function(){--%>
        <%--        toastr.error('Something went wrong', '', {--%>
        <%--            timeOut: 3000,--%>
        <%--            progressBar: true,--%>
        <%--            progressAnimation: 'increasing'--%>
        <%--        });--%>
        <%--    }--%>
        <%--});--%>
    });

    window.onload = function () {
        $("#ui-datepicker-div").addClass("bg-success bg-opacity-25");
        $("#sDate").val(new Date().toLocaleDateString("en-CA"));
        $("#eDate").val(new Date().toLocaleDateString("en-CA"));
    }
    $(function() {
        // Multiple images preview in browser
        var imagesPreview = function(input, placeToInsertImagePreview) {

            if (input.files) {
                var filesAmount = input.files.length;

                for (i = 0; i < filesAmount; i++) {
                    var reader = new FileReader();

                    reader.onload = function(event) {
                        $($.parseHTML('<img class="img-fluid imgxprod" width="50px" height="50px">')).attr('src', event.target.result).appendTo(placeToInsertImagePreview);
                    }

                    reader.readAsDataURL(input.files[i]);
                }
            }

        };

        $('#prodImg').on('change', function() {
            imagesPreview(this, '.rowxs .col-md-12');
        });
    });
    $('#sDate, #eDate').keydown(function (){
        return false;
    });
    $('#eDate').datepicker({
            dateFormat: 'yy-mm-dd',
            yearRange: '2022:+10',
            monthNamesShort: ["Tháng 1", "Tháng 2", "Tháng 3", "Tháng 4", "Tháng 5", "Tháng 6",
                "Tháng 7", "Tháng 8", "Tháng 9", "Tháng 10", "Tháng 11", "Tháng 12"
            ],
            changeMonth: true,changeYear: true,
            dayNamesMin: [ "CN", "Hai", "Ba", "Tư", "Năm", "Sáu", "Bảy" ], // For formatting

        });
    $('#sDate').datepicker({
                dateFormat: 'yy-mm-dd',
                yearRange: '2022:'+(new Date).getFullYear(),
                // yearRange: '2022:+10',
                monthNamesShort: ["Tháng 1", "Tháng 2", "Tháng 3", "Tháng 4", "Tháng 5", "Tháng 6",
            "Tháng 7", "Tháng 8", "Tháng 9", "Tháng 10", "Tháng 11", "Tháng 12"
        ],
        changeMonth: true,changeYear: true,
        dayNamesMin: [ "CN", "Hai", "Ba", "Tư", "Năm", "Sáu", "Bảy" ], // For formatting

    });
    // });
        $(".bmnx").click(function () {

        if (this.id == "addBtn") {
            $(".popeye").removeClass("show")
            $(".popeye").css("display", "none");

            $("#addProd").addClass("show");
            $("#addProd").css("display", "block");
        } else if (this.id == "waitingBtn") {
            $(".popeye").removeClass("show")
            $(".popeye").css("display", "none");

            $("#waitingProd").addClass("show");
            $("#waitingProd").css("display", "block");
        } else if (this.id == "approvedBtn") {
            $(".popeye").removeClass("show")
            $(".popeye").css("display", "none");

            $("#approvedProd").addClass("show");
            $("#approvedProd").css("display", "block");
        } else if (this.id == "paidBtn") {
            $(".popeye").removeClass("show")
            $(".popeye").css("display", "none");

            $("#paidProd").addClass("show");
            $("#paidProd").css("display", "block");
        }
    });
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
