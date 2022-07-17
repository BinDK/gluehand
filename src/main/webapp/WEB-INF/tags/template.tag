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
            <% if (session.getAttribute("acc") != null) { %>
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
            <div id="navbarNavDropdown" class="collapse navbar-collapse justify-content-end">
                <ul class="navbar-nav mb-2 mb-lg-0 ">
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button"
                           data-bs-toggle="dropdown" aria-expanded="false">
                            <img class="img-fluid img-thumbnail rounded-0 " src="https://avatars.dicebear.com/api/pixel-art/avatar.svg?b=%2375507b&size=64">
                        </a>
                        <ul aria-labelledby="navbarDarkDropdownMenuLink"
                            class="dropdown-menu dropdown-menu-start dropdown-menu-dark">
                            <li><a class="dropdown-item" href="#" onclick="preventDefault()" data-bs-toggle="modal"
                                   data-bs-target="#accModal">Your Profile</a>
                            </li>
                            <li><a class="dropdown-item" href="#" onclick="preventDefault()" data-bs-toggle="modal"
                                   data-bs-target="#accBalanceModal">Account Balance</a></li>
                            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/user/manage">Product Management</a></li>
                            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/user/manage" >Logout</a></li>
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

                    <button onclick="event.preventDefault();" class="btn btn-primary ">Let GO!</button>
                </form>
                <form id="f2" style="display: none">
                    <div class="form-floating mb-3">
                        <input class="form-control shadow bg-body rounded" id="suUname" type="text" placeholder="Username">
                        <label for="siUname">Username</label>

                    </div>
                    <div class="form-floating mb-3">
                        <input class="form-control shadow bg-body rounded" id="suPass" type="password" placeholder="Password">
                        <label for="siPass">Password</label>
                    </div>
                    <div class="form-floating mb-3">
                        <input class="form-control shadow bg-body rounded" id="suCPass" type="password" placeholder="Confirm Password">
                        <label for="suCPass">Confirm Password</label>
                    </div>

                    <button onclick="event.preventDefault();" class="btn btn-primary ">Sign up!</button>
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
                <p class="h3 mb-0" id="accNameTitle">Account Name</p>
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
                            />
                            <label for="accUname">Fullname</label>
                        </div>
                        <div class="form-floating mb-3">
                            <input
                                    class="form-control shadow rounded"
                                    id="accUname"
                                    type="text"
                                    placeholder="Username"
                                    disabled
                            />
                            <label for="accUname">Username</label>
                        </div>
                        <div class="form-floating mb-3">
                            <input
                                    class="form-control shadow bg-body ountline-success rounded"
                                    id="accBday"
                                    type="date"
                                    placeholder="Birthday"
                            />
                            <label for="accBday">Birthday</label>
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
                                    aria-describedby="button-addon2"
                            />
                            <button
                                    class="btn btn-outline-secondary btn-sm"
                                    type="button"
                                    id="button-addon2"
                            >
                                Change Password
                            </button>

                            <label for="accCPass">Confirm Password</label>
                        </div>
                    </div>
                </div>
                <button onclick="event.preventDefault();" class="btn btn-primary">
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
    #button-addon2 {
        background-color: #343a40;
        border-radius: 4px;
        color: #fff;
        cursor: pointer;
        /* padding: 8px 16px; */
    }
    #button-addon2:hover {
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

            $('#accPass').keyup(function () {
            var passCF = $('#accCPass').val();
            var pass = $('#accPass').val();
            if (pass.length > 4) {
                $('#accCPassx').css('display', 'flex');
                $('#accCPassx').addClass('show');
                $('#button-addon2').addClass('disabled');
                if (passCF == pass) {
                    $('#button-addon2').removeClass('disabled').addClass('bg-success');

                    $('#accPass')
                        .addClass('border-success')
                        .removeClass('border-danger');
                    $('#accCPass')
                        .addClass('border-success')
                        .removeClass('border-danger');
                } else {
                    $('#accPass').addClass('border-danger');
                    $('#accCPass').addClass('border-danger');
                    $('#button-addon2').removeClass('bg-success').addClass('disabled');
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
            if (pass.length > 4) {
                $('#accCPassx').css('display', 'flex');
                $('#accCPassx').addClass('show');
                $('#button-addon2').addClass('disabled');
                if (passCF == pass) {
                    $('#button-addon2').removeClass('disabled').addClass('bg-success');

                    $('#accPass')
                        .addClass('border-success')
                        .removeClass('border-danger');
                    $('#accCPass')
                        .addClass('border-success')
                        .removeClass('border-danger');
                } else {
                    $('#accPass').addClass('border-danger');
                    $('#accCPass').addClass('border-danger');
                    $('#button-addon2').removeClass('bg-success').addClass('disabled');
                }
            }
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


    });

</script>

<jsp:invoke fragment="content"></jsp:invoke>


</body>

</html>