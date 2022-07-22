<%--
  Created by IntelliJ IDEA.
  User: pixie
  Date: 7/13/22
  Time: 5:50 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="mt" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<mt:template_admin>
    <jsp:attribute name="content">

            <section class="content-header">
                    <%--                <div class="container-fluid">--%>
                    <%--                    <div class="row mb-2">--%>
                    <%--                        <div class="col-sm-6">--%>
                    <%--                            <h1>Waiting for approve Product</h1>--%>
                    <%--                        </div>--%>
                    <%--                        <div class="col-sm-6">--%>
                    <%--                            <ol class="breadcrumb float-sm-right">--%>
                    <%--                                <li class="breadcrumb-item active">Home</li>--%>
                    <%--                            </ol>--%>
                    <%--                        </div>--%>
                    <%--                    </div>--%>
                    <%--                </div>--%>
            </section>

            <section class="content">
                <div class="container-fluid">


                    <div class="row">
                        <div class="col-12">
                            <div class="card">
                                <div class="card-header">

                                    <h3 class="card-title">
                                        <button class="btn btn-light rounded-pill" id="btnLoad">Reload</button>
                                            <%--                                        <i class="fa-solid fa-arrow-rotate-right btn btn-light rounded-pill" id="btnLoad"></i>--%>
                                    </h3>
                                        <%--                                    <div class="card-tools">--%>
                                        <%--                                        <div class="input-group input-group-sm" style="width: 150px;">--%>
                                        <%--                                            <input type="text" name="table_search" class="form-control float-right" placeholder="Search">--%>
                                        <%--                                            <div class="input-group-append">--%>
                                        <%--                                                <button type="submit" class="btn btn-default">--%>
                                        <%--                                                    <i class="fas fa-search"></i>--%>
                                        <%--                                                </button>--%>
                                        <%--                                            </div>--%>
                                        <%--                                        </div>--%>
                                        <%--                                    </div>--%>
                                </div>

                                <div class="card-body table-responsive p-0" style="height: 300px;">
                                    <table class="table table-head-fixed text-nowrap">
                                        <thead>
                                        <tr>
                                            <th>ID</th>
                                            <th>Product Name</th>
                                            <th>Seller Name</th>
                                            <th>Category</th>
                                            <th>Start Date</th>
                                            <th>End Date</th>
                                            <th>Price</th>
                                            <th>Action</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach var="i" items="${products}" varStatus="loop">

                                        <tr>
                                            <td>${loop.index +1}</td>
                                            <td>${i.product_name}</td>
                                            <td>${i.fullname}</td>
                                            <td><span class="tag tag-warning">${i.category}</span></td>
                                            <td>${i.start_date}</td>
                                            <td>${i.end_date}</td>
                                            <td>${i.price_minium}</td>
                                            <td>
                                                <button class="btn btn-success btnapp" id="app-${i.product_id}">
                                                    Approve
                                                </button>
                                                <button class="btn btn-danger btndisapp" id="disapp-${i.product_id}">
                                                    Disappove
                                                </button>
                                            </td>
                                        </tr>
                                        </c:forEach>

                                        </tbody>
                                    </table>
                                </div>

                            </div>

                        </div>
                    </div>


                </div>
            </section>

<script>
    window.onload = function () {
        $('.homeL').addClass("active");
        $('.homeL').attr("href", "#");
    };
    // $(".fa-solid").click(function (){
    //    $(this).css("animation","rotation 4s");
    // });
    $('.btnapp').click(function () {
        var holdid = $(this).attr("id");
        var idx = holdid.split("-")
        console.log(idx[1]);
        $.fn.ajaxApprove(idx[1]);

    });
    $.fn.ajaxApprove = function idxc(param) {

        $.ajax({
            type: "GET",
            url: "${pageContext.request.contextPath}/adminapi/action?action=APPROVED",
            data: {id: param},
            cache: true,
            timeOut: 1000,
            success: function (result) {
                // setTimeout(function(){
                //     //window.location.href = "< ?//= site_url("admin/subscription/change/") ?>//" + param;
                // }, 3000);
                if (result.hasError == false) {
                    toastr.success(param, 'Successfuly Approve Product ID: ', {
                        timeOut: 2900,
                        progressBar: true,
                        progressAnimation: 'increasing'
                    });
                } else {
                    toastr.error('STOP', result.message, {
                        timeOut: 3000,
                        progressBar: true,
                        progressAnimation: 'increasing'
                    });
                }
            },
            error: function () {
                toastr.error('STOP', '', {
                    timeOut: 3000,
                    progressBar: true,
                    progressAnimation: 'increasing'
                });
            }
        });
    }


    $('.btndisapp').click(function () {
        var holdid = $(this).attr("id");
        var idx = holdid.split("-")
        console.log(idx[1]);
        $.fn.ajaxDisApprove(idx[1]);

    });
    $.fn.ajaxDisApprove = function idxc(param) {

        $.ajax({
            type: "GET",
            url: "${pageContext.request.contextPath}/adminapi/action?action=DISAPPROVED",
            data: {id: param},
            cache: true,
            timeOut: 1000,
            success: function (result) {
                // setTimeout(function(){
                //     //window.location.href = "< ?//= site_url("admin/subscription/change/") ?>//" + param;
                // }, 3000);
                if (result.hasError == false) {
                    toastr.success(param, 'Successfuly Cancel Product ID: ', {
                        timeOut: 2900,
                        progressBar: true,
                        progressAnimation: 'increasing'
                    });
                } else {
                    toastr.error('STOP', result.message, {
                        timeOut: 3000,
                        progressBar: true,
                        progressAnimation: 'increasing'
                    });
                }
            },
            error: function () {
                toastr.error('STOP', '', {
                    timeOut: 3000,
                    progressBar: true,
                    progressAnimation: 'increasing'
                });
            }
        });
    }


</script>

<style>

    .rotatex {
        animation: rotation 4s;
    }

    @keyframes rotation {
        from {
            transform: rotate(0deg);
        }
        to {
            transform: rotate(359deg);
        }
    }

</style>

    </jsp:attribute>
</mt:template_admin>
