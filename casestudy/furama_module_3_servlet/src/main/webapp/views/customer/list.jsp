<%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 05/10/2022
  Time: 10:10 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="../../bootstrap520/css/bootstrap.css">
    <link rel="stylesheet" href="../../datatables/css/dataTables.bootstrap5.min.css">
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
        <div class="col-5 header text-center fs-1">Customer</div>
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
                                                               href="/customer">Customer</a></span>
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

    <div class="row">
        <button type="button" class="btn btn bg-success">
            <a class="text-decoration-underline text-white" href="customer?action=create">Add</a>
        </button>
    </div>
    <div class="row">
        <table id="tableStudent" class="table table-striped table-bordered" style="width:100%">
            <%--        <caption><h2>List of Users</h2></caption>--%>
            <thead>
            <tr>
                <th>STT</th>
                <th>customerTypeId</th>
                <th>name</th>
                <th>dateOfbirth</th>
                <th>gender</th>
                <th>idCard</th>
                <th>phoneNumber</th>
                <th>email</th>
                <th>address</th>
                <th>edit</th>
                <th>delete</th>

            </tr>
            </thead>
            <tbody>
            <c:forEach var="customer" items="${listCustomer}" varStatus="status">
                <tr>
                    <td><c:out value="${status.count}"/></td>
                    <td>
                        <c:forEach var="customerTye" items="${listCustomerType}">
                            <c:if test="${customer.customerTypeId == customerTye.id}">
                                <span id="${status.count}">${customerTye.name}</span>
                            </c:if>
                        </c:forEach>
                    </td>
                    <td><c:out value="${customer.name}"/></td>
                    <td><c:out value="${customer.dateOfbirth}"/></td>
                    <td>
                        <c:if test = "${customer.gender==1}">
                            <span value ="1" >Nam</span>
                        </c:if>
                        <c:if test = "${customer.gender==0}">
                        <span value ="0" >Nữ</span>
                        </c:if>
                    </td>
                    <td><c:out value="${customer.idCard}"/></td>
                    <td><c:out value="${customer.phoneNumber}"/></td>
                    <td><c:out value="${customer.email}"/></td>
                    <td><c:out value="${customer.address}"/></td>
                    <td>
                        <a href="/customer?action=edit&id=${customer.id}">Edit</a>
                    </td>
                    <td>
                        <a href="/customer?action=delete&id=${customer.id}">Delete</a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>

<script src="../../jquery/jquery-3.5.1.min.js"></script>
<script src="../../datatables/js/jquery.dataTables.min.js"></script>
<script src="../../datatables/js/dataTables.bootstrap5.min.js"></script>
<script src="../../bootstrap-5.1.3/js/bootstrap.js"></script>
<script>
    $(document).ready(function () {
            $("#tableStudent").dataTable({
                "dom": "lrtrip",
                "lengthChange": false,
                "pageLength": 5
            })
        }
    )
</script>
</body>
</html>
