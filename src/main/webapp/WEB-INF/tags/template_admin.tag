<%@ tag isELIgnored="false" pageEncoding="ISO-8859-1" language="java" %>
<%@ attribute name="content" fragment="true" %>
<!DOCTYPE html>
<html style="height: auto" lang="en"><head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>AdminLTE 3 | General Form Elements</title>

    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&amp;display=fallback">



    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/fontawesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugins/toastr/toastr.min.css">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugins/jquery-ui/jquery-ui.css">
    <link rel="stylesheet" href="https://adminlte.io/themes/v3/dist/css/adminlte.min.css?v=3.2.0">

    <script src="https://adminlte.io/themes/v3/plugins/jquery/jquery.min.js"></script>

    <script src="https://adminlte.io/themes/v3/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/plugins/toastr/toastr.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/plugins/jquery-ui/jquery-ui.min.js"></script>


</head>

<body class="sidebar-mini" style="height: auto">
<div class="wrapper">
    <script>
        $(document).ready(function () {

        });

    </script>
    <nav class="main-header navbar navbar-expand navbar-white navbar-light">
        <ul class="navbar-nav">
            <li class="nav-item">
                <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
            </li>
            <li class="nav-item d-none d-sm-inline-block">
                <a href="${pageContext.request.contextPath}/admin" class="nav-link">Home</a>
            </li>
        </ul>

    </nav>
    <aside class="main-sidebar sidebar-dark-primary elevation-4">
        <a href="../../index3.html" class="brand-link">
            <img src="https://adminlte.io/themes/v3/dist/img/AdminLTELogo.png" alt="AdminLTE Logo" class="brand-image img-circle elevation-3" style="opacity: 0.8">
            <span class="brand-text font-weight-light">Admin</span>
        </a>

        <div class="sidebar">
            <div class="user-panel mt-3 pb-3 mb-3 d-flex">
                <div class="image">
                    <img src="https://avatars.dicebear.com/api/pixel-art/popeyes.svg?b=%2375507b&size=64" class="img-circle elevation-2" alt="User Image">
                </div>
                <div class="info">
                    <a href="#" class="d-block">Adminítrator Page</a>
                </div>
            </div>

            <div class="form-inline">

            </div>
            <nav class="mt-2">
                <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
                    <li class="nav-item">
                        <a href="${pageContext.request.contextPath}/admin" class="nav-link homeL">
                            <i class="nav-icon fas fa-edit"></i>
                            <p>
                                Approve Product
                            </p>
                        </a>
                    </li>

                    <li class="nav-item">
                        <a href="${pageContext.request.contextPath}/admin/users" class="nav-link userL">
                            <i class="nav-icon fas fa-users"></i>
                            <p>
                                User Mange
                            </p>
                        </a>
                    </li>
                </ul>
            </nav>
        </div>
    </aside>



    <div class="content-wrapper" style="min-height: 1302.4px;">
        <jsp:invoke fragment="content"></jsp:invoke>
    </div>


</div>

</body>

</html>




