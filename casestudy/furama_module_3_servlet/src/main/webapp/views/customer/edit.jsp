<%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 06/10/2022
  Time: 9:42 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="../../bootstrap-5.1.3/css/bootstrap.css">
</head>
<body>
<div class="container-fluid">
    <div class="row">
        <div class="col-3 header">
            <span>
                <a class="navbar-brand" href="#">
                    <img src="/images/logo_furama.png" alt="" width="122" height="116">
                </a>
            </span>
        </div>
        <div class="col-5 header text-center fs-1">Customer Edit</div>
        <div class="col-4 header position-relative"><span class="position-absolute top-50 start-50 translate-middle">Ngô Đình Nhật Tuấn</span>
        </div>
    </div>

    <div class="row">
        <nav class="navbar navbar-expand-lg navbar-light bg-light   ">
            <div class="col-4"></div>
            <div class="col-5">
                <div class="container-fluid d-flex justify-content-center ">
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle float-end" href="#" role="button"
                                   data-bs-toggle="dropdown" aria-expanded="false">
                                    <span class="float-end "><a class="text-decoration-none"
                                                                href="/home">Home</a></span>
                                </a>
                                <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                    <li><a class="dropdown-item" href="#">Action</a></li>
                                    <li><a class="dropdown-item" href="#">Another action</a></li>
                                    <li>
                                        <hr class="dropdown-divider">
                                    </li>
                                    <li><a class="dropdown-item" href="#">Something else here</a></li>
                                </ul>
                            </li>

                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle float-end" href="#" role="button"
                                   data-bs-toggle="dropdown" aria-expanded="false">
                                    <span class="float-end"><a class="text-decoration-none"
                                                               href="/views/employee/list.jsp">Employee</a></span>
                                </a>
                                <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                    <li><a class="dropdown-item" href="#">Action</a></li>
                                    <li><a class="dropdown-item" href="#">Another action</a></li>
                                    <li>
                                        <hr class="dropdown-divider">
                                    </li>
                                    <li><a class="dropdown-item" href="#">Something else here</a></li>
                                </ul>
                            </li>

                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle float-end" href="#" role="button"
                                   data-bs-toggle="dropdown" aria-expanded="false">
                                    <span class="float-end"><a class="text-decoration-none"
                                                               href="/views/customer/list.jsp">Customer</a></span>
                                </a>
                                <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                    <li><a class="dropdown-item" href="#">Action</a></li>
                                    <li><a class="dropdown-item" href="#">Another action</a></li>
                                    <li>
                                        <hr class="dropdown-divider">
                                    </li>
                                    <li><a class="dropdown-item" href="#">Something else here</a></li>
                                </ul>
                            </li>

                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle float-end" href="#" role="button"
                                   data-bs-toggle="dropdown" aria-expanded="false">
                                    <span class="float-end"><a class="text-decoration-none"
                                                               href="/views/service/list.jsp">Service</a></span>
                                </a>
                                <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                    <li><a class="dropdown-item" href="#">Action</a></li>
                                    <li><a class="dropdown-item" href="#">Another action</a></li>
                                    <li>
                                        <hr class="dropdown-divider">
                                    </li>
                                    <li><a class="dropdown-item" href="#">Something else here</a></li>
                                </ul>
                            </li>

                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle float-end" href="#" role="button"
                                   data-bs-toggle="dropdown" aria-expanded="false">
                                    <span class="float-end"><a class="text-decoration-none"
                                                               href="/views/contract/list.jsp">Contract</a></span>
                                </a>
                                <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                    <li><a class="dropdown-item" href="#">Action</a></li>
                                    <li><a class="dropdown-item" href="#">Another action</a></li>
                                    <li>
                                        <hr class="dropdown-divider">
                                    </li>
                                    <li><a class="dropdown-item" href="#">Something else here</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="col-3">
                <form class="d-flex">
                    <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                    <button class="btn btn-outline-success" type="submit">Search</button>
                </form>

            </div>

        </nav>
    </div>
    <div style="margin: 0px auto;text-align: center">
        <h2><a href="/customer"><button class="btn btn-outline-light" style="background: url(/images/slide_h9.jpg)">List Customer</button></a></h2>
    </div>
    <div class="row" style="width: 100%;margin: 0px auto;background: url(/images/slide_h7.jpg)">
      <div class="row" style="width: 500px;margin-top:200px;margin-left:400px;background: white">
        <form method="post">
            <%--            <fieldset disabled>--%>
            <legend>Edit Customer</legend>
            <div>
                <c:if test="${customer != null}">
                    <input type="hidden" name="id" value="<c:out value='${customer.id}' />"/>
                </c:if>
            </div>
            <div class="mb-3">
                <label class="form-label">Customer Type Id</label>
                <input type="text" class="form-control" placeholder="Disabled input"
                       name="customerTypeId" size="45"
                       value="<c:out value='${customer.customerTypeId}'/>"/>
            </div>
            <div class="mb-3">
                <label class="form-label">Name</label>
                <input type="text" class="form-control" placeholder="Disabled input"
                       name="name" size="45"
                       value="<c:out value='${customer.name}'/>"/>
            </div>
            <div class="mb-3">
                <label class="form-label">Date of birth</label>
                <input type="text" class="form-control" placeholder="Disabled input"
                       name="dateOfbirth" size="45"
                       value="<c:out value='${customer.dateOfbirth}'/>"/>
            </div>
            <div class="mb-3">
                <label class="form-label">Gender</label>
                <input type="text" class="form-control" placeholder="Disabled input"
                       name="gender" size="45"
                       value="<c:out value='${customer.gender}'/>"/>
            </div>
            <div class="mb-3">
                <label class="form-label">Id Card</label>
                <input type="text" class="form-control" placeholder="Disabled input"
                       name="idCard" size="45"
                       value="<c:out value='${customer.idCard}'/>"/>
            </div>
            <div class="mb-3">
                <label class="form-label">Phone Number</label>
                <input type="text" class="form-control" placeholder="Disabled input"
                       name="phoneNumber" size="45"
                       value="<c:out value='${customer.phoneNumber}'/>"/>
            </div>
            <div class="mb-3">
                <label class="form-label">email</label>
                <input type="text" class="form-control" placeholder="Disabled input"
                       name="email" size="45"
                       value="<c:out value='${customer.email}'/>"/>
            </div>
            <div class="mb-3">
                <label class="form-label">address</label>
                <input type="text" class="form-control" placeholder="Disabled input"
                       name="address" size="45"
                       value="<c:out value='${customer.address}'/>"/>
            </div>
            <button type="submit" class="btn btn-primary" type="submit">Save</button>
        </form>
      </div>

    </div>

</div>


<script src="../../bootstrap-5.1.3/js/bootstrap.js"></script>
</body>
</html>