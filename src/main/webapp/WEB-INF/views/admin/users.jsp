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
<%--    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/bootstrap.min.css">--%>

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
                                        <c:forEach var="i" varStatus="loop" items="${users}">

                                        <tr>
                                            <td>${i.user_id}</td>
                                            <td>${i.fullname}</td>
                                            <td>${i.user_name}</td>
                                            <td>${i.money}</td>
                                            <td>
                                                <button class="btn btn-success btndetail" id="detail-${i.user_id}"
                                                        data-toggle="modal" data-target="#uBalance">Detail
                                                </button>

                                                <button class="btn btn-danger btnban" id="ban-${i.user_id}">Ban user</button>
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

        <div
                id="uBalance" tabindex="-1" style="display: none"
                class="modal fade" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header border-bottom border-success">
                        <p class="h3 mb-0" id="accBalance">Account Balance</p>
                    </div>

                    <div class="modal-body">
                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-floating mb-3">
                                    <input
                                            class="
                      form-control
                      bg-white
                      border-bottom
                      border-top-0
                      border-left-0
                      border-right-0
                      border-danger
                    "
                                            value="12"
                                            id="uTTopup"
                                            disabled=""
                                            type="text"
                                            placeholder="Total Top up"
                                    />
                                    <label for="uTTopup">Total Top up</label>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <div class="form-floating mb-3">
                                    <input
                                            class="
                      form-control
                      bg-white
                      border-bottom
                      border-top-0
                      border-start-0
                      border-end-0
                      border-danger
                    "
                                            value="12"
                                            id="uTSpent"
                                            disabled=""
                                            type="text"
                                            placeholder="Spent"
                                    />
                                    <label for="uTSpent">Spent</label>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-floating mb-3">
                                    <input
                                            class="
                      form-control
                      bg-white
                      border-bottom
                      border-top-0
                      border-start-0
                      border-end-0
                      border-danger
                    "
                                            value="12"
                                            id="uTBalance"
                                            disabled=""
                                            type="text"
                                            placeholder="Fullname"
                                    />
                                    <label for="uTBalance">Balance</label>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col col-md-12 col-auto ">
                                <div class="card">
                                    <div class="card-body table-responsive p-0" style="height: 300px">
                                        <table class="table table-striped">
                                            <thead style="position: sticky;top: 0;background-color: white;">
                                            <tr>
                                                <th scope="col">#</th>
                                                <th scope="col"><small>Created</small></th>
                                                <th scope="col"><small>Total</small></th>
                                                <th scope="col"><small>Purpose</small></th>
                                                <th scope="col"><small>Note</small></th>
                                            </tr>
                                            </thead>
                                            <tbody id="histories">
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>





        <script>
            window.onload = function () {
                $('.userL').addClass("active");
                $('.userL').attr("href", "#");
            };

            $('.btndetail').click(function(){
                var holdid = $(this).attr("id");
                var idx = holdid.split("-")
                console.log(idx[1]);
                $.fn.testget(idx[1]);

            });
            $.fn.testget = function id(param){
                $.get( "${pageContext.request.contextPath}/adminapi/wallettransaction?id="+param, function( data ) {

                    var html = "";
                    var index = 0;
                        data["histories"].forEach(x => {
                            html+= `
                             <tr>
                                <th scope="row">`+(++index)+`</th>
                                <td>`+x.created +`</td>
                                <td>`+x.total+`</td>
                                <td>`+x.status_name+`</td>
                                <td>@Jim Hulper</td>
                             </tr>
                            `;
                        })
                        $('#histories').html(html);
                    $('#uTTopup').val(data.total_top_up);
                    $('#uTSpent').val(data.spent);
                    $('#uTBalance').val(data.balance);

                });
            };

            $.fn.getUser = function idxc(param) {

                $.ajax({
                    type: "GET",
                    url: "${pageContext.request.contextPath}/adminapi/usertransaction",
                    data: {id: param},
                    cache: true,
                    timeOut: 1000,
                    success: function (result) {
                        // setTimeout(function(){
                        //     //window.location.href = "< ?//= site_url("admin/subscription/change/") ?>//" + param;
                        // }, 3000);
                        toastr.success(param, 'Successfuly get user detail: ', {
                            timeOut: 2900,
                            progressBar: true,
                            progressAnimation: 'increasing'
                        });
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
