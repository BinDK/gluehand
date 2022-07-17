<%--
  Created by IntelliJ IDEA.
  User: pixie
  Date: 7/13/22
  Time: 5:50 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"  isELIgnored="false" %>
<%@taglib prefix="mt" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<mt:template_admin>
    <jsp:attribute name="content">

            <section class="content-header">

            </section>

            <section class="content">
                <div class="container-fluid">

                    <div class="row">
                        <div class="col-12">
                            <div class="card">

                                <div class="card-body table-responsive p-0" style="height: 300px;">
                                    <table class="table table-head-fixed text-nowrap">
                                        <thead>
                                        <tr>
                                            <th>ID</th>
                                            <th>Fullname</th>
                                            <th>Username</th>
                                            <th>Wallet Balance</th>
                                            <th>Action</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach var="i" begin="1" end="6">

                                        <tr>
                                            <td>${i}</td>
                                            <td>Alexander Pierce</td>
                                            <td>11-7-2014</td>
                                            <td>Start Date</td>
                                            <td>
                                                <button class="btn btn-success btnapp" id="app-${i}" >Approve</button>
                                                <button class="btn btn-danger btndisapp" id="disapp-${i}">Disappove</button>
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
window.onload = function() {
    $('.userL').addClass("active");
    $('.userL').attr("href","#");
};
    // $(".fa-solid").click(function (){
    //    $(this).css("animation","rotation 4s");
    // });
    $('.btnapp').click(function(){
        var holdid = $(this).attr("id");
        var idx = holdid.split("-")
        console.log(idx[1]);
        $.fn.ajaxApprove(idx[1]);

    });
    $.fn.ajaxApprove = function idxc(param) {

        $.ajax({
            type: "GET",
            url: "${pageContext.request.contextPath}/adminapi/cancelprod",
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
