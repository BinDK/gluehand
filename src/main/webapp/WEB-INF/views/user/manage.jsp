
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

                            <div class="row">
                                <div class="col-sm-8">
                                    <div class="form-floating mb-3">
                                        <input class="form-control shadow bg-body rounded" id="prodName" type="text" placeholder="Product Name">
                                        <label for="prodName">Product Name</label>
                                    </div>
                                </div>
                                <div class="col-sm-4 input-group-lg">
                                    <select class="form-control catelist">
                                        <c:forEach  items="${cates}" var="cate">
                                        <option value="${cate.id}">${cate.name}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                            <div class="form-floating mb-3">
                                <input onkeypress="return isNumberKey(event)"
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
                        </tr>
                        </thead>
                        <tbody>



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
                        </tr>
                        </thead>
                        <tbody>


                        </tbody>
                    </table>
                </div>
            </div>
                </div>

            </div>
        </div>

        <div id="failProd" class="col-md-3 popeye fade">
            <div class="card">
                <div class="card-header text-center">Your product list been auction but nobody won</div>
                <div class="card-body table-responsive p-0" style="height: 300px">
                    <table class="table table-striped" id="tableFail">
                        <thead style="
                          position: sticky;
                          top: 0;
                          background-color: white;
                        ">
                        <tr>
                            <th scope="col">#</th>
                            <th ><small>Product Name</small></th>
                        </tr>
                        </thead>
                        <tbody>


                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <div id="paidProd" class="col-md-9 popeye fade">
            <div class="card">
                <div class="card-header text-center">Your winning Product List</div>
                <div class="card-body table-responsive p-0" style="height: 300px">
                    <table class="table table-striped" id="tablePaid">
                        <thead style="
                          position: sticky;
                          top: 0;
                          background-color: white;
                        ">
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col"><small>Product Name</small></th>
                            <th scope="col"><small>Your win at price</small></th>
                            <th scope="col"><small>Action</small></th>
                        </tr>
                        </thead>
                        <tbody>


                        </tbody>
                    </table>
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
// function cancelProd(id){
//     $.ajax()
// }
window.onload = function () {
    $("#ui-datepicker-div").addClass("bg-success bg-opacity-25");
    $("#sDate").val(new Date().toLocaleDateString("en-CA"));
    $("#eDate").val(new Date().toLocaleDateString("en-CA"));
}
$.fn.loadlist = function idxx(param) {
    $.get(
        "${pageContext.request.contextPath}/api/prodListseller",
        {statuss: param,uidd:${acc.id}},          // data
        function(data) {               // success
            console.log(data);
            var cont = "";
            for (var i = 0; i < data.length; i++) {
                var s = new Date(data[i].start_date);
                var e = new Date(data[i].end_date);

                cont += '<tr>';
                cont += '<th scope="row">' + data[i].product_id + '</th>';
                cont += '<td>' + data[i].product_name + '</td>';
                cont += '<td>' + s.toLocaleString("en-US") + ' / ' + e.toLocaleString("en-US") + '</td>';
                cont += '<td>' + data[i].price_minium + ' / ' + data[i].price_step + '</td>';
                cont += '</tr>';
            }
            if (param == 0){
                $('#tableWaiting tbody').html(cont);
        }else if(param == 1) {
                $('#tableApproved tbody').html(cont);

            }
        },
        'json'                         // dataType
    ).fail(function() {
        console.log( "error" );
    });



}

$('input').bind('keyup change paste propertychange', function() {
    var key = $(this).val();

    if (key.indexOf('script') > -1 || key.indexOf('>') > -1) {
        toastr.error("Wait! No xss bruh!", {
            timeOut: 2000,
            progressBar: true,
            progressAnimation: 'increasing'
        });
        $(this).val('');
    }
});




function purchase(param) {

    $.ajax({
        type: "GET",
        url: "${pageContext.request.contextPath}/api/purchase1",
        data: {product_id:param},
        cache: true,
        success: function (data) {

            // if(data.successx !=""){
            //     toastr.error(data.successx, {
            //         timeOut: 3000,
            //         progressBar: true,
            //         progressAnimation: 'increasing'
            //     });
            // }
            console.log(data);
            if(data.errorx == null || data.errorx == ""){
                toastr.success(data.successx, {
                    timeOut: 3000,
                    progressBar: true,
                    progressAnimation: 'increasing'
                });

                var cont = "";
                var x = data['products'];
                console.log(x);
                for (var i = 0; i < x.length; i++) {
                    cont += '<tr> <th scope="row">'+x[i].product_id+'</th> ';
                    cont += '<td>'+x[i].product_name+'</td> ';
                    cont +='<td>'+x[i].max_bid+'</td> ';
                    if (x[i].product_status_id == 5)
                    cont += '<td> <button class="btn btn-secondary disabled">Purchased</button> </td> ';
                    else{
                        cont += '<td> <button onclick="purchase('+x[i].product_id+')" class="btn btn-success btnxm" id="btnx-'+x[i].product_id+'">Purchase</button> </td> ';
                    }
                        cont +='</tr>';
                }
                $('#tablePaid tbody').html(cont);

            } else {
                toastr.error(data.errorx, {
                    timeOut: 3000,
                    progressBar: true,
                    progressAnimation: 'increasing'
                });

            }
        }
    });


}

//Load paid list
$.fn.loadPaidlist = function idxc() {

        $.ajax({
            type: "GET",
            url: "${pageContext.request.contextPath}/api/loadpaid",
            data: {userID:${acc.id}},
            cache: true,
            success: function (data) {
                // setTimeout(function(){
                //     //window.location.href = "< ?//= site_url("admin/subscription/change/") ?>//" + param;
                // }, 3000);
                toastr.success(${acc.id},'Successfuly Cancel Product ID: ' , {
                    timeOut: 2900,
                    progressBar: true,
                    progressAnimation: 'increasing'
                });
                console.log(data);
                var cont = "";
                    for (var i = 0; i < data.length; i++) {
                if(data[i].password == null) {
                    break;
                } else {

                        cont += '<tr> <th scope="row">' + data[i].product_id + '</th> ';
                        cont += '<td>' + data[i].product_name + '</td> ';
                        cont += '<td>' + data[i].max_bid + '</td> ';
                        if (data[i].product_status_id == 5)
                            cont += '<td> <button class="btn btn-secondary disabled">Purchased</button> </td> ';
                        else {
                            cont += '<td> <button onclick="purchase(' + data[i].product_id + ')" class="btn btn-success btnxm" id="btnx-' + data[i].product_id + '">Purchase</button> </td> ';
                        }
                        cont += '</tr>';
                    }
                    $('#tablePaid tbody').html(cont);
                }
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

$.fn.loadFaillist = function idxcxx() {

    $.ajax({
        type: "GET",
        url: "${pageContext.request.contextPath}/api/loadfail",
        data: {userID:${acc.id}},
        cache: true,
        success: function (data) {
            // setTimeout(function(){
            //     //window.location.href = "< ?//= site_url("admin/subscription/change/") ?>//" + param;
            // }, 3000);

            console.log(data);
            var cont = "";
            for (var i = 0; i < data.length; i++) {

                    cont += '<tr> <th scope="row">' + data[i].product_id + '</th> ';
                    cont += '<td>' + data[i].product_name + '</td> ';
                    cont += '</tr>';
            }
                $('#tableFail tbody').html(cont);
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



//Add product
$("#addProdBtn").click(function (e){
        // $("#form0").submit(function (e){
            // e.preventDefault();
            var formData = new FormData();
       let prodName = $("#prodName").val();
       let prodPrice = $("#prodPrice").val();
        let prodStep = $("#prodStep").val()? $("#prodStep").val(): '50';
        var filesx= document.getElementById('prodImg').files;


        let prodSHour = $("#sHour").val()? $("#sHour").val(): '0';
        let prodSMin = $("#sMin").val()? $("#sMin").val(): '0';
        let prodEHour = $("#eHour").val()? $("#eHour").val(): '0';
        let prodEMin = $("#eMin").val()? $("#eMin").val(): '0';

        let SDate = $("#sDate").val()+" " + prodSHour+":"+prodSMin+":00";
        let EDate = $("#eDate").val()+" " + prodEHour+":"+prodEMin+":00";
        if( (prodName == null || prodName == '') ||
            (prodPrice == null || prodPrice == '') ||
            (prodStep == null || prodStep == '')){
            $('#prodName, #prodPrice').addClass("border border-danger");
            toastr.warning("Missing some information for Product","",{
                timeOut: 2900,
                progressBar: true,
                progressAnimation: 'increasing'
            });
            return  false;
        }
        else if( Date.parse(EDate) <= Date.parse(SDate)){
            $('#prodName, #prodPrice').removeClass("border border-danger");
            // if(Date.parse())
            toastr.warning("End Date cannot sooner than / the same as Start Date ","",{
                timeOut: 2900,
                progressBar: true,
                progressAnimation: 'increasing'
            });
            return false;
        }else{
            var cataid = $('.catelist option').filter(':selected').val();

            $.ajax({
                method: "POST",
                dataType: "json",
                url: "${pageContext.request.contextPath}/api/addproduct",
                data: {
                    prodName : prodName,
                    prodPrice :prodPrice,
                    prodStep : prodStep,
                    prodsDate : SDate,
                    prodeDate : EDate,
                    prodCate : cataid,
                    userid : ${acc.id}

                },
                success: function(res){
                    console.log(res);
                    var filesx= document.getElementById('prodImg').files;
                    // if (filesx.length <= 0 || filesx == null){
                    //
                    //     return false;
                    // } else{

                    for( let ix = 0; ix < filesx.length;ix++){
                        formData.append('files',filesx[ix]);
                    }
                    $.ajax({
                        method: "POST",
                        enctype: 'multipart/form-data',
                        url: "${pageContext.request.contextPath}/api/upload?prodID="+res,
                        data: formData,
                        contentType: false,
                        cache: false,
                        processData: false,
                        // data: $("#loginForm").serialize(),
                        success: function (result) {

                            toastr.success('UploadED Product Photo', '', {
                                timeOut: 2900,
                                progressBar: true,
                                progressAnimation: 'increasing'
                            });
                                $('#prodName, #prodPrice').val("");
                                $('#sHour, #sMin, #eHour, #eMin').val("0");
                                $('#prodStep').val("50");
                                $('#prodImg').val('');
                            $('.rowxs .col-md-12').empty();

                        },
                        error:function(){
                            toastr.warning('Product do not have images', '', {
                                timeOut: 3000,
                                progressBar: true,
                                progressAnimation: 'increasing'
                            });
                            $('#prodImg').val('');

                        }
                    });
                    // }
                }
            });
        }



    });


$(function() {
        // Multiple images preview
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
//Date picker
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
            dayNamesMin: [ "CN", "Hai", "Ba", "Tư", "Năm", "Sáu", "Bảy" ],
            minDate: new Date()

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
        minDate: new Date()
    });
    // end date pidcker

//List product
$(".bmnx").click(function () {

        if (this.id == "addBtn") {
            $(".popeye").removeClass("show")
            $(".popeye").css("display", "none");

            $("#addProd").addClass("show");
            $("#addProd").css("display", "block");

        } else if (this.id == "waitingBtn") {
            $(".popeye").removeClass("show")
            $(".popeye").css("display", "none");
            $.fn.loadlist(0);
            $.fn.loadlist(1);
            $("#waitingProd").addClass("show");
            $("#waitingProd").css("display", "block");

        }  else if (this.id == "paidBtn") {

            $(".popeye").removeClass("show")
            $(".popeye").css("display", "none");

            $.fn.loadPaidlist();
            $.fn.loadFaillist();


            $("#paidProd").addClass("show");
            $("#paidProd").css("display", "block");
            $("#failProd").addClass("show");
            $("#failProd").css("display", "block");
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
