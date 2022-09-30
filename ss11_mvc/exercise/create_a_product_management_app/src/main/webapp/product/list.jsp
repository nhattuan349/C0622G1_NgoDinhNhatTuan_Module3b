<%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 30/09/2022
  Time: 2:16 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
<h1> Ứng dụng quản lý khách hàng</h1>
<ul>
    <li><a href="/product?action=create">Thêm mới</a></li>
</ul>

<table class="table table-dark">
    <tr>
        <th>STT</th>
        <th>Name</th>
        <th>Price</th>
        <th>Amount</th>
        <th>Production</th>
        <th>Edit</th>
        <th>Delete</th>
    </tr>

    <c:forEach var="product" items="${products}" varStatus="status">
        <tr>
            <td>${status.count}</td>
            <td>${product.getName()}</td>
            <td>${product.getPrice()}</td>
            <td>${product.getAmount()}</td>
            <td>${product.getProduction()}</td>
            <td><button class="btn btn-primary">Edit</button></td>
            <td><button class="btn btn-danger">Delete</button></td>
        </tr>
    </c:forEach>
</table>

</body>
</html>
