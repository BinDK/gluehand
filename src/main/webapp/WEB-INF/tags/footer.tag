<%@ tag isELIgnored="false" pageEncoding="ISO-8859-1" language="java" %>
<%@ attribute name="footer" fragment="true" %>


<!-- Start Footer -->
<footer class="bg-dark" id="tempaltemo_footer">
    <div class="container">
        <div class="row">

            <div class="col-md-4 pt-5">
                <h2 class="h2 text-success border-bottom pb-3 border-light logo">Gluehand</h2>
                <ul class="list-unstyled text-light footer-link-list">
                    <li>
                        <i class="fas fa-map-marker-alt fa-fw"></i>
                        35/6 D5, P. 25, Binh Thanh District, HCM City
                    </li>
                    <li>
                        <i class="fa fa-phone fa-fw"></i>
                        <a class="text-decoration-none" onclick="alert('You`re not alone')">800-273-8255</a>
                    </li>
                    <li>
                        <i class="fa fa-envelope fa-fw"></i>
                        <a class="text-decoration-none" href="mailto:info@company.com">myglue@hand.com</a>
                    </li>
                </ul>
            </div>

            <div class="col-md-4 pt-5">
                <h2 class="h2 text-light border-bottom pb-3 border-light">Rule</h2>
                <ul class="list-unstyled text-light footer-link-list">
                    <li><a class="text-decoration-none" onclick="event.preventDefault()" role="button">No Scam</a></li>
                    <li><a class="text-decoration-none" onclick="event.preventDefault()" role="button">Look at first
                        rule</a></li>
                    <li><a class="text-decoration-none" onclick="event.preventDefault()" role="button">Responsible Play!</a></li>

                </ul>
            </div>

            <div class="col-md-4 pt-5">
                <h2 class="h2 text-light border-bottom pb-3 border-light">Further Info</h2>
                <ul class="list-unstyled text-light footer-link-list">
                    <li><a class="text-decoration-none" href="${pageContext.request.contextPath}/index">Home</a></li>
                    <li><a class="text-decoration-none" href="${pageContext.request.contextPath}/index">About Us</a></li>
                </ul>
            </div>

        </div>

        <div class="row text-light mb-4">
            <div class="col-12 mb-3">
                <div class="w-100 my-3 border-top border-light"></div>
            </div>
            <div class="col-auto me-auto">
                <ul class="list-inline text-left footer-icons">
                    <li class="list-inline-item border border-light rounded-circle text-center">
                        <a class="text-light text-decoration-none mxh mxhFB" data-bs-toggle="modal"
                           data-bs-target="#simu"><i class="fab fa-facebook-f fa-lg fa-fw"></i></a>
                    </li>
                    <li class="list-inline-item border border-light rounded-circle text-center">
                        <a class="text-light text-decoration-none mxh mxhIG" data-bs-toggle="modal"
                           data-bs-target="#simu"><i class="fab fa-instagram fa-lg fa-fw"></i></a>
                    </li>
                    <li class="list-inline-item border border-light rounded-circle text-center">
                        <a class="text-light text-decoration-none mxh mxhTW" data-bs-toggle="modal"
                           data-bs-target="#simu"><i class="fab fa-twitter fa-lg fa-fw"></i></a>
                    </li>
                </ul>
            </div>
            <div class="col-auto">
                <label class="sr-only" for="subscribeEmail">Email address</label>
                <div class="input-group mb-2">
                    <input type="text" class="form-control bg-dark border-light" id="subscribeEmail"
                           placeholder="Email address">
                    <div class="input-group-text btn-success text-light">Subscribe</div>
                </div>
            </div>
        </div>
    </div>


    <div class="w-100 bg-black py-3">
        <div class="container">
            <div class="row pt-2">
                <div class="col-12">
                    <p class="text-left text-light">
                        Copyright &copy; 2022 Glue Team
                        | Designed by <u>GLue Army</u>
                    </p>
                </div>
            </div>
        </div>
    </div>

</footer>

<div class="modal fade" id="simu" tabindex="-1" aria-labelledby="simu" style="display: none;" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title h4" id="exampleModalXlLabel">Our Soicial Media Spirit Person</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <img src="${pageContext.request.contextPath}/resources/assets/img/dancing-simu.webp" class="img-fluid">
            </div>
        </div>
    </div>
</div>

</footer>
<!-- End Footer -->