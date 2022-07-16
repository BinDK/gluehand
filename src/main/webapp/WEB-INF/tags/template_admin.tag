<%@ tag isELIgnored="false" pageEncoding="ISO-8859-1" language="java" %>
<%@ attribute name="content" fragment="true" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html style="height: auto" lang="en"><head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>AdminLTE 3 | General Form Elements</title>

    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&amp;display=fallback">

    <link rel="stylesheet" href="https://adminlte.io/themes/v3/plugins/fontawesome-free/css/all.min.css">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/fontawesome.min.css">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugins/toastr/toastr.min.css">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugins/jquery-ui/jquery-ui.css">
    <link rel="stylesheet" href="https://adminlte.io/themes/v3/dist/css/adminlte.min.css?v=3.2.0">

    <script nonce="b1e4ef2f-fda9-4c3c-bad2-0166b0865e55">
      (function (w, d) {
        !(function (a, e, t, r) {
          (a.zarazData = a.zarazData || {}),
            (a.zarazData.executed = []),
            (a.zaraz = {
              deferred: [],
            }),
            (a.zaraz.q = []),
            (a.zaraz._f = function (e) {
              return function () {
                var t = Array.prototype.slice.call(arguments);
                a.zaraz.q.push({
                  m: e,
                  a: t,
                });
              };
            });
          for (const e of ["track", "set", "ecommerce", "debug"])
            a.zaraz[e] = a.zaraz._f(e);
          (a.zaraz.init = () => {
            var t = e.getElementsByTagName(r)[0],
              z = e.createElement(r),
              n = e.getElementsByTagName("title")[0];
            for (
              n && (a.zarazData.t = e.getElementsByTagName("title")[0].text),
                a.zarazData.x = Math.random(),
                a.zarazData.w = a.screen.width,
                a.zarazData.h = a.screen.height,
                a.zarazData.j = a.innerHeight,
                a.zarazData.e = a.innerWidth,
                a.zarazData.l = a.location.href,
                a.zarazData.r = e.referrer,
                a.zarazData.k = a.screen.colorDepth,
                a.zarazData.n = e.characterSet,
                a.zarazData.o = new Date().getTimezoneOffset(),
                a.zarazData.q = [];
              a.zaraz.q.length;

            ) {
              const e = a.zaraz.q.shift();
              a.zarazData.q.push(e);
            }
            z.defer = !0;
            for (const e of [localStorage, sessionStorage])
              Object.keys(e || {})
                .filter((a) => a.startsWith("_zaraz_"))
                .forEach((t) => {
                  try {
                    a.zarazData["z_" + t.slice(7)] = JSON.parse(e.getItem(t));
                  } catch {
                    a.zarazData["z_" + t.slice(7)] = e.getItem(t);
                  }
                });
            (z.referrerPolicy = "origin"),
              (z.src =
                "/cdn-cgi/zaraz/s.js?z=" +
                btoa(encodeURIComponent(JSON.stringify(a.zarazData)))),
              t.parentNode.insertBefore(z, t);
          }),
            ["complete", "interactive"].includes(e.readyState)
              ? zaraz.init()
              : a.addEventListener("DOMContentLoaded", zaraz.init);
        })(w, d, 0, "script");
      })(window, document);
    </script>
</head>

<body class="sidebar-mini" style="height: auto">
<div class="wrapper">
    <nav class="main-header navbar navbar-expand navbar-white navbar-light">
        <ul class="navbar-nav">
            <li class="nav-item">
                <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
            </li>
            <li class="nav-item d-none d-sm-inline-block">
                <a href="${pageContext.request.contextPath}/admin" class="nav-link">Home</a>
            </li>
        </ul>

        <ul class="navbar-nav ml-auto">
            <li class="nav-item">
                <a class="nav-link" data-widget="control-sidebar" data-slide="true" href="#" role="button">
                    <i class="fas fa-th-large"></i>
                </a>
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
                    <img src="https://adminlte.io/themes/v3/dist/img/user2-160x160.jpg" class="img-circle elevation-2" alt="User Image">
                </div>
                <div class="info">
                    <a href="#" class="d-block">Trang qu?n lý </a>
                </div>
            </div>

            <div class="form-inline">
                <div class="input-group" data-widget="sidebar-search">
                    <input class="form-control form-control-sidebar" type="search" placeholder="Search" aria-label="Search">
                    <div class="input-group-append">
                        <button class="btn btn-sidebar">
                            <i class="fas fa-search fa-fw"></i>
                        </button>
                    </div>
                </div>
                <div class="sidebar-search-results">
                    <div class="list-group">
                        <a href="#" class="list-group-item">
                            <div class="search-title">
                                <strong class="text-light"></strong>N<strong class="text-light"></strong>o<strong class="text-light"></strong>
                                <strong class="text-light"></strong>e<strong class="text-light"></strong>l<strong class="text-light"></strong>e<strong class="text-light"></strong>m<strong class="text-light"></strong>e<strong class="text-light"></strong>n<strong class="text-light"></strong>t<strong class="text-light"></strong>
                                <strong class="text-light"></strong>f<strong class="text-light"></strong>o<strong class="text-light"></strong>u<strong class="text-light"></strong>n<strong class="text-light"></strong>d<strong class="text-light"></strong>!<strong class="text-light"></strong>
                            </div>
                            <div class="search-path"></div>
                        </a>
                        <a href="#" class="list-group-item"><div class="search-title"><strong class="text-light"></strong>N<strong class="text-light"></strong>o<strong class="text-light"></strong> <strong class="text-light"></strong>e<strong class="text-light"></strong>l<strong class="text-light"></strong>e<strong class="text-light"></strong>m<strong class="text-light"></strong>e<strong class="text-light"></strong>n<strong class="text-light"></strong>t<strong class="text-light"></strong> <strong class="text-light"></strong>f<strong class="text-light"></strong>o<strong class="text-light"></strong>u<strong class="text-light"></strong>n<strong class="text-light"></strong>d<strong class="text-light"></strong>!<strong class="text-light"></strong></div><div class="search-path"></div></a></div>
                </div>
            </div>
            <nav class="mt-2">
                <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
                    <li class="nav-item">
                        <a href="#" class="nav-link active">
                            <i class="nav-icon fas fa-edit"></i>
                            <p>
                                Forms
                                <i class="fas fa-angle-left right"></i>
                            </p>
                        </a>
                        <ul class="nav nav-treeview">
                            <li class="nav-item">
                                <a href="../forms/general.html" class="nav-link active">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>General Elements</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="../forms/advanced.html" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Advanced Elements</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="../forms/editors.html" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Editors</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="../forms/validation.html" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Validation</p>
                                </a>
                            </li>
                        </ul>
                    </li>

                    <li class="nav-header">EXAMPLES</li>
                    <li class="nav-item">
                        <a href="../calendar.html" class="nav-link">
                            <i class="nav-icon far fa-calendar-alt"></i>
                            <p>
                                Calendar
                                <span class="badge badge-info right">2</span>
                            </p>
                        </a>
                    </li>
                </ul>
            </nav>
        </div>
    </aside>

<script src="https://adminlte.io/themes/v3/plugins/jquery/jquery.min.js"></script>

<script src="https://adminlte.io/themes/v3/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/plugins/toastr/toastr.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/plugins/jquery-ui/jquery-ui.min.js"></script>


<script>
    $(document).ready(function () {

    });

    </script>
<script src="moz-extension://b11f4490-9c78-4230-ae4e-2f1d0deaa849/js/app.js" type="text/javascript"></script>

    <div class="content-wrapper" style="min-height: 614px;">
        <jsp:invoke fragment="content"></jsp:invoke>
    </div>


</div>

</body>

</html>




