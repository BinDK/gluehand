<%@ tag isELIgnored="false" pageEncoding="ISO-8859-1" language="java" %>
<%@ attribute name="content" fragment="true" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Gluehand No.1 Online Auction Platform </title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="apple-touch-icon" href="${pageContext.request.contextPath}/resources/assets/img/apple-icon.png">
    <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/assets/img/favicon.ico">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/templatemo.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/custom.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/fontawesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugins/toastr/toastr.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugins/jquery-ui/jquery-ui.css">

    <!-- Start Script -->
    <%--<script src="${pageContext.request.contextPath}/resources/assets/js/jquery-1.11.0.min.js"></script>--%>
    <%--<script src="${pageContext.request.contextPath}/resources/assets/js/jquery-migrate-1.2.1.min.js"></script>--%>
    <script src="${pageContext.request.contextPath}/resources/plugins/jquery/jquery.min.js"></script>

    <script src="${pageContext.request.contextPath}/resources/assets/js/bootstrap.bundle.min.js"></script>
    <%--<script src="${pageContext.request.contextPath}/resources/assets/js/templatemo.js"></script>--%>
    <%--<script src="${pageContext.request.contextPath}/resources/assets/js/custom.js"></script>--%>
    <script src="${pageContext.request.contextPath}/resources/plugins/toastr/toastr.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/plugins/jquery-ui/jquery-ui.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/plugins/jquery/jquery.countdown.min.js"></script>

    <!-- End Script -->
</head>


<body style="background-color: #00BCD4;">
<!-- Start Top Nav -->
<nav class="navbar navbar-expand-lg shadow-lg bg-body" style="background-color: #dff9fb !important;">
    <div class="container">
        <a href="${pageContext.request.contextPath}/index" style="color: #6ab04c;" class="navbar-brand text-success logo h1 ">Gluehand</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown"
                aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
            <% if (session.getAttribute("acc") == null) { %>
        <div id="navbarNavDropdown" class="collapse navbar-collapse">
            <ul class="navbar-nav mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="#">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/auction">Auction Center</a>
                </li>
                <li>
                    <a class="nav-link text-bold" href="#" data-bs-toggle="modal" data-bs-target="#sisuModal">Join Us</a>
                </li>
            </ul>

            <% } else {%>
            <c:set var="acc" value="${sessionScope.acc}"></c:set>
            <div id="navbarNavDropdown" class="collapse navbar-collapse justify-content-end">
                <ul class="navbar-nav mb-2 mb-lg-0 ">
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button"
                           data-bs-toggle="dropdown" aria-expanded="false">
                            <img alt="p" class="img-fluid img-thumbnail rounded-0 " src="https://avatars.dicebear.com/api/pixel-art/${acc.userName}.svg?b=%2375507b&size=64">
                        </a>
                        <ul aria-labelledby="navbarDarkDropdownMenuLink"
                            class="dropdown-menu dropdown-menu-start dropdown-menu-dark">
                            <li><a class="dropdown-item" href="#"  data-bs-toggle="modal"
                                   data-bs-target="#accModal">Your Profile</a>
                            </li>
                            <li><a class="dropdown-item" href="#" onclick="preventDefault()" data-bs-toggle="modal"
                                   data-bs-target="#accBalanceModal">Account Balance</a></li>
                            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/user/manage">Product Management</a></li>
                            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/logout" >Logout</a></li>
                        </ul>
                    </li>
                </ul>
                <% } %>

            </div>
        </div>
</nav>
<!-- Close Top Nav -->


<!-- Navbar Modal -->
<div id="sisuModal" tabindex="-1" aria-labelledby="sisuModal"
     style="display: none;" class="modal fade" aria-hidden="true">
    <div class="modal-dialog" >
        <div class="modal-content">
            <div class="modal-header">
                <button
                        type="button"
                        class="btn btn-outline-success active"
                        id="siBtn"
                >
                    Sign In
                </button>
                <button type="button" class="btn btn-outline-danger" id="suBtn">
                    Register
                </button>
            </div>
            <div class="modal-body">
                <form id="f1" action="#">
                    <div class="form-floating mb-3">
                        <input class="form-control shadow bg-body rounded" id="siUname" type="text" placeholder="Username">
                        <label for="siUname">Username</label>

                    </div>
                    <div class="form-floating mb-3">
                        <input class="form-control shadow bg-body rounded" id="siPass" type="password" placeholder="Password">
                        <label for="siPass">Password</label>
                    </div>

                    <button onclick="event.preventDefault();" class="btn btn-primary " id="si">Let GO!</button>
                </form>
                <form id="f2" style="display: none">
                    <div class="form-floating mb-3">
                        <input class="form-control shadow bg-body rounded" id="suUname" type="text" placeholder="Username">
                        <label for="suUname">Username</label>

                    </div>
                    <div class="form-floating mb-3">
                        <input
                                class="form-control shadow bg-body rounded"
                                id="suPass" type="password" placeholder="Password"
                                data-bs-toggle="tooltip" data-bs-placement="right"
                                data-bs-custom-class="custom-tooltip"
                                title="Password should have uppercase & lowercase, number and special charater."
                        >
                        <label for="suPass">Password</label>
                    </div>
                    <div class="form-floating mb-3">
                        <input class="form-control shadow bg-body rounded" id="suCPass" type="password" placeholder="Confirm Password">
                        <label for="suCPass">Confirm Password</label>
                    </div>

                    <button class="btn btn-secondary disabled" id="su" onclick="event.preventDefault();" >Sign up!</button>
                </form>
            </div>
        </div>
    </div>
</div>
<!-- End Navbar Modal -->

<!-- ACCMODAL -->
<div
        id="accModal"
        tabindex="-1"
        aria-labelledby="accModal"
        style="display: none"
        class="modal fade"
        aria-hidden="true"
>
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header border-bottom border-success">
                <p class="h3 mb-0" id="accNameTitle">${acc.fullname ? acc.fullname : 'No name yet'}</p>
            </div>

            <div class="modal-body">
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-floating mb-3">
                            <input
                                    class="form-control shadow bg-body rounded"
                                    id="accFname"
                                    type="text"
                                    placeholder="Fullname"
                                    value="${acc.fullname}"
                            />
                            <label for="accFname">Fullname</label>
                        </div>
                        <div class="form-floating mb-3">
                            <input
                                    class="form-control shadow rounded"
                                    id="accUname"
                                    type="text"
                                    placeholder="Username"
                                    disabled
                                    value="${acc.userName}"
                            />
                            <label for="accUname">Username</label>
                        </div>
                        <div class="form-floating mb-3">
                            <input
                                    class="form-control shadow bg-body ountline-success rounded"
                                    id="accEmail"
                                    type="email"
                                    placeholder="Email"
                                    value="${acc.email}"

                            />
                            <label for="accEmail">Email</label>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="form-floating mb-3">
                            <input
                                    class="form-control shadow bg-body ountline-success rounded"
                                    id="accPhone"
                                    onkeypress="return isNumberKey(event)"
                                    type="text"
                                    placeholder="Phone Number"
                                    value="${acc.phone}"
                            />
                            <label for="accPhone">Phone Number</label>
                        </div>
                        <div class="form-floating mb-3">
                            <input
                                    class="form-control shadow bg-body rounded"
                                    id="accPass"
                                    type="password"
                                    placeholder="Password"
                            />
                            <label for="accPass">Password</label>
                        </div>
                        <div
                                class="form-floating input-group mb-3 fade"
                                style="display: none"
                                id="accCPassx"
                        >
                            <input
                                    class="form-control shadow bg-body rounded text-wrap fs-5"
                                    id="accCPass"
                                    type="password"
                                    placeholder="Confirm Password"
                                    aria-describedby="btnChangePass"
                            />
                            <button
                                    class="btn btn-outline-secondary btn-sm"
                                    type="button"
                                    id="btnChangePass"
                            >
                                Change Password
                            </button>

                            <label for="accCPass">Confirm Password</label>
                        </div>
                    </div>
                </div>
                <button id="btnacUpdate" class="btn btn-primary">
                    Update Profile
                </button>
            </div>
        </div>
    </div>
</div>
<!-- End ACCMODAL -->


<!-- ACC Balance Modal -->

<div
        id="accBalanceModal"
        tabindex="-1"
        aria-labelledby="accBalanceModal"
        style="display: none"
        class="modal fade"
        aria-hidden="true"
>
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
                                    class="form-control bg-white border-bottom
                                        border-top-0 border-start-0 border-end-0 border-danger"
                                    value="12" id="wTTopup"
                                    disabled type="text" placeholder="Total Top up"/>
                            <label for="wTTopup">Total Top up</label>
                        </div>
                    </div>

                    <div class="col-md-4">
                        <div class="form-floating mb-3">
                            <input
                                    class=" form-control bg-white border-bottom
                                    border-top-0 border-start-0 border-end-0 border-danger"
                                    value="12" id="wTSpent" disabled
                                    type="text" placeholder="Spent"
                            />
                            <label for="wTSpent">Spent</label>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-floating mb-3">
                            <input
                                    class="form-control bg-white border-bottom border-top-0
                                     border-start-0 border-end-0 border-danger "
                                    value="12" id="wTBalance"
                                    disabled type="text" placeholder="Fullname"
                            />
                            <label for="wTBalance">Balance</label>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col col-md-12 col-auto ">
                        <div class="card">
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
                                    <c:forEach var = "i" begin = "1" end = "6">

                                    <tr>
                                        <th scope="row">${i}</th>
                                        <td>Mark</td>
                                        <td>Otto</td>
                                        <td>@mdo</td>
                                        <td>@Jim Hulper</td>
                                        <td>@Dwight</td>
                                    </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row mt-3">
                    <c:forEach var="i" begin="1" end="3">

                    <div class="col-md-3">
                        <div class="card text-center border-success mb-3" style="max-width: 18rem">
                            <div class="card-header">Top up Tier</div>
                            <div class="card-body text-success">
                                <h5 class="card-title">${i}00$</h5>
                            </div>
                        </div>
                    </div>
                    </c:forEach>


                    <div class="col-md-3">
                        <div class="card text-center border-success mb-0" style="max-width: 18rem">
                            <div class="card-header">Top up Tier</div>
                            <div class="card-body text-success">
                                <div class="input-group mb-0 mt-0">
                                    <input type="text" class="form-control" placeholder="Custom" aria-label="Custom" aria-describedby="customTbtn">
                                    <button class="btn btn-sm btn-outline-info text-dark" type="button" id="customTbtn"
                                            style="--bs-btn-padding-y: 0;
                --bs-btn-padding-x: 0.5rem;
                --bs-btn-font-size: 1.5rem;"
                                    ><i class="fa-solid fa-bullseye"></i></button>
                                </div>

                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
</div>
<!-- End ACC Balance Modal -->

<style>
    @keyframes slidebg {
        to {
            background-position: 20vw;
        }
    }
    #btnChangePass {
        background-color: #343a40;
        border-radius: 4px;
        color: #fff;
        cursor: pointer;
        /* padding: 8px 16px; */
    }
    #btnChangePass:hover {
        background-image: linear-gradient(
                90deg,
                #6ab04c 0%,
                #30336b 49%,
                #130f40 80%,
                #badc58 100%
        );
        animation: slidebg 5s linear infinite;
    }
</style>

<script>
    var patter1 = "^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z]).{8,20}$";
    var patter2 = "^([\\w]*[\\w\\.]*(?!\\.)@gmail.com)";

    function isNumberKey(evt){
        var charCode = (evt.which) ? evt.which : evt.keyCode
        if (charCode > 31 && (charCode < 48 || charCode > 57))
            return false;
        return true;
    }
    function makeBotcode(){
        var valx = Math.floor(1000 + Math.random() * 9000);
        document.getElementById("botCode").innerHTML = valx;
        $("#ipBotcode").val("");

    }
    $(document).ready(function () {
        var $input = $('#sisuModal :input,#accModal :input');
        $input.bind('keyup change paste propertychange', function() {
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

        $('#accPass').keyup(function () {
            var passCF = $('#accCPass').val();
            var pass = $('#accPass').val();
            var test = new RegExp(patter1);

            if (pass.length > 4) {
                $('#accCPassx').css('display', 'flex');
                $('#accCPassx').addClass('show');
                $('#btnChangePass').addClass('disabled');
                if (passCF == pass && (test.test(pass) && test.test(passCF))) {

                    $('#btnChangePass').removeClass('disabled').addClass('bg-success');

                    $('#accPass')
                        .addClass('border-success')
                        .removeClass('border-danger');
                    $('#accCPass')
                        .addClass('border-success')
                        .removeClass('border-danger');

                } else {
                    $('#accPass').addClass('border-danger');
                    $('#accCPass').addClass('border-danger');
                    $('#btnChangePass').removeClass('bg-success').addClass('disabled');
                }
            } else {
                $('#accCPass').val('');
                $('#accCPassx').css('display', 'none');
                $('#accCPassx').removeClass('show');
            }
        });
        $('#accCPass').keyup(function () {
            var passCF = $('#accCPass').val();
            var pass = $('#accPass').val();
            var test = new RegExp(patter1);

            if (pass.length > 4) {
                $('#accCPassx').css('display', 'flex');
                $('#accCPassx').addClass('show');
                $('#btnChangePass').addClass('disabled');
                if (passCF == pass) {
                    if(test.test(pass) && test.test(passCF)) {

                        $('#btnChangePass').removeClass('disabled').addClass('bg-success');

                        $('#accPass')
                            .addClass('border-success')
                            .removeClass('border-danger');
                        $('#accCPass')
                            .addClass('border-success')
                            .removeClass('border-danger');
                    }
                } else {
                    $('#accPass').addClass('border-danger');
                    $('#accCPass').addClass('border-danger');
                    $('#btnChangePass').removeClass('bg-success').addClass('disabled');
                }
            }
        });
        $('#btnacUpdate').click(function () {
            var $accF =$('#accFname');
            var $accE =$('#accEmail');
            var $accP =$('#accPhone');


            $.ajax({
                medthod: "PUT",
                url: "${pageContext.request.contextPath}/api/updateacc",
                data: {
                    accF : $accF.val(),
                    accE : $accE.val(),
                    accP : $accP.val()
                },
                done: function(res){
                    console.log(res ? "true" : "false");
                }
            });

        });

        $('#btnChangePass').click(function () {
            var $cpass = $('#accCPass');
            $.ajax({
                method: "PUT",
                url: "${pageContext.request.contextPath}/api/changepass",
                data: {
                    pass : $cpass.val()},
                done: function(data){
                    $('#accCPass, #accPass').val('');
                    console.log(data);
                }
            });

        });

        $('#suBtn').click(function () {
            $('#siBtn').removeClass('active');
            $('#suBtn').addClass('active');
            $("#f1").css("display", "none");
            $("#f2").css("display", "block");

        });

        $('#siBtn').click(function () {
            $('#suBtn').removeClass('active');
            $('#siBtn').addClass('active');
            $("#f2").css("display", "none");
            $("#f1").css("display", "block");

        });

        $("#suUname").keyup(function (){
            $.get('${pageContext.request.contextPath}/api/matchuname?uname='+$(this).val(), function( data ) {
                // alert( data );
                $("#suUname").addClass("border border-2 border-success");
                if(data == 1){
                    $("#suUname").addClass("border border-2 border-danger");

                    $("label[for='suUname']").text("Someone using this").addClass("fw-bolder text-danger");
                }else{
                    $("#suUname").removeClass("border-danger");
                    $("#suUname").addClass("border-success");
                    $("label[for='suUname']").text("Username").removeClass("fw-bolder text-danger");


                }
            });


        });
        $('#suPass').keyup(function () {
            var pass = $('#suPass').val();
            var test1 = new RegExp(patter1);
            if(test1.test(pass)){
                // $(".tooltip-inner").text("Password Strong");
                $(this).removeClass("border border-2 border-danger");
              $(this).addClass("border border-2 border-success");

            }
            else if(pass == ""){
                $(this).removeClass("border border-2 border-danger");
                $(this).addClass("border border-2 border-success");

            }
            else {
                // $(".tooltip-inner").text("Password should have uppercase & lowercase, number and special charater.");
                $(this).removeClass("border border-2 border-success");
                $(this).addClass("border border-2 border-danger");

                console.log(0);
            }
        });
        $('#suCPass').keyup(function () {
            var passCF = $('#suPass').val();
            var pass = $('#suCPass').val();
            var test1 = new RegExp(patter1);

             if (passCF == pass ) {
                 if(test1.test(pass) && test1.test(passCF)) {
                     $('#su').removeClass('disabled').addClass('bg-success');

                     $('#suPass')
                         .addClass('border-success')
                         .removeClass('border-danger');
                     $('#suCPass')
                         .addClass('border-success')
                         .removeClass('border-danger');
                     // if()
                 }
                } else {
                    $('#suPass').addClass('border-danger');
                    $('#suCPass').addClass('border border-2 border-danger');
                    $('#su').removeClass('bg-success').addClass(' disabled');
                }

        });

        $('#si').click(function () {
            var uname = $('#siUname').val();
            var pass = $('#siPass').val();

            $.get('${pageContext.request.contextPath}/api/signin?uname='+uname+'&pass='+pass).done(function(data){
                if(data.id == null){
                    toastr.error("Wrong username/ password!", {
                        timeOut: 2000,
                        progressBar: true,
                        progressAnimation: 'increasing'
                    });
                    $('#siUname').addClass("border-danger");
                    $('#siPass').val("").addClass("border-danger");
                } else{
                    toastr.success("Found You!", {
                        timeOut: 2000,
                        progressBar: true,
                        progressAnimation: 'increasing'
                    });
                    sessionStorage.setItem("accid",data.id);
                    $('#siUname').removeClass("border-danger").addClass("border-success");
                    $('#siPass').removeClass("border-danger").addClass("border-success")
                    setTimeout(window.location.replace("${pageContext.request.contextPath}/user/home?id="+data.id),7000);
                }
            });

                // console.log(data);
                // console.log(data.userName);
            //     sessionStorage.setItem("accid",data.id);
            // });
        });
        $('#su').click(function () {
            var uname = $('#suUname').val();
            var pass = $('#suPass').val();
            var passCF = $('#suCPass').val();

            var test1 = new RegExp(patter1);

            if (test1.test(pass) == test1.test(passCF) ) {
                $.get('${pageContext.request.contextPath}/api/matchuname?uname='+uname, function( data ) {
                if(data == 1){
                    toastr.error("Username has been taken!!", {
                        timeOut: 2000,
                        progressBar: true,
                        progressAnimation: 'increasing'
                    });
                }else{
                    $.post('${pageContext.request.contextPath}/api/createuser?uname='+uname+'&pass='+passCF, function( data ) {
                        toastr.success("You are all set, let vid", {
                            timeOut: 3000,
                            progressBar: true,
                            progressAnimation: 'increasing'
                        });

                        // var holdx = data;
                        // console.log(holdx);
                        window.location.replace("${pageContext.request.contextPath}/user/home?id="+data);

                        // sessionStorage.setItem("accx",JSON.stringify(holdx));
                        // setTimeout(location.reload(),4000);


                    });
                    }

                });
            }
        });

    });


</script>

<jsp:invoke fragment="content"></jsp:invoke>


</body>

</html>