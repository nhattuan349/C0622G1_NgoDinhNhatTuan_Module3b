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
    <title>Ứng dụng quản lý khách hàng</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
<h1> Ứng dụng quản lý khách hàng</h1>
<ul>
    <li><a href="/product?action=create">Thêm mới</a></li>
</ul>

<form action="/product">
    <input class="text-input-dialog" type="text" name="name">
    <input class="btn button bg-primary" type="submit" name="action" value="findByName">
</form>

<table class="table table-dark">
    <tr>
        <th>STT</th>
        <th>Name</th>
        <th>Price</th>
        <th>Amount</th>
        <th>Production</th>
        <th>Edit</th>
        <th>Delete</th>
        <th>See details</th>

    </tr>

    <c:forEach var="product" items="${products}" varStatus="status">
        <tr>
            <td>${status.count}</td>
            <td>${product.getName()}</td>
            <td>${product.getPrice()}</td>
            <td>${product.getAmount()}</td>
            <td>${product.getProduction()}</td>
            <td><a href="/product?action=edit&id=${product.getId()}">Sửa</a></td>
<%--            <td><button class="btn btn-primary"><a href="/product?action&id=${product.getId()}">Edit</a></button></td>--%>
            <td><a class="btn btn-danger" href="/product?action=delete&id=${product.getId()}">Delete</a></td>
            <td><a class="btn btn-danger" href="/product?action=findById&id=${product.getId()}">See details</a></td>
        </tr>
    </c:forEach>
</table>

</body>
</html>
