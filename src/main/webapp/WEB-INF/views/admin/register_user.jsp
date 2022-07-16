<%--
  Created by IntelliJ IDEA.
  User: pixie
  Date: 7/13/22
  Time: 5:50 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"  isELIgnored="false" %>
<%@taglib prefix="mt" tagdir="/WEB-INF/tags" %>


<mt:template_admin>
    <jsp:attribute name="content">
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1>Form quản lý thông tin cá nhân</h1>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="#">Trang chủ</a></li>
                            <li class="breadcrumb-item active">Quản lý thông tin</li>
                        </ol>
                    </div>
                </div>
            </div>
        </section>

<%--        noi dung--%>
        <section class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-6">
                        <form>
                            <div class="card-body">
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Username</label>
                                    <input type="text" class="form-control" id="exampleInputUsername" placeholder="Enter username">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Password</label>
                                    <input type="password" class="form-control" id="exampleInputPassword" placeholder="Enter password">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Email</label>
                                    <input type="email" class="form-control" id="exampleInputEmail" placeholder="Enter email">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Address</label>
                                    <input type="text" class="form-control" id="exampleInputAddress" placeholder="Enter address">
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="col-md-6">
                        <form>
                            <div class="card-body">
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Company</label>
                                    <input type="text" class="form-control" id="exampleInputCompany" placeholder="Enter company">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Telephone</label>
                                    <input type="tel" class="form-control" id="exampleInputEmail1" placeholder="Enter telephone">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Country</label>
                                    <input type="text" class="form-control" id="exampleInputCountry" placeholder="Enter country">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Nationality</label>
                                    <input type="text" class="form-control" id="exampleInputNationality" placeholder="Enter nationality">
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="card-footer">
                        <button type="submit" class="btn btn-primary">Submit</button>
                    </div>
                </div>
            </div>
        </section>
    </jsp:attribute>
</mt:template_admin>

<mt:footer>
    <jsp:attribute name="footer"></jsp:attribute>
</mt:footer>
