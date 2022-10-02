<%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 01/10/2022
  Time: 4:08 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1> Thông tin chi tiết</h1>

<a href="/product"> Quay lại trang list</a>

<table>
    <tr>
        <td>Name:</td>
        <td>${product.getName()}</td>
    </tr>
    <tr>
        <td>Price:</td>
        <td>${product.getPrice()}</td>
    </tr>
    <tr>
        <td>Amount:</td>
        <td>${product.getAmount()}</td>
    </tr>
    <tr>
        <td>Production:</td>
        <td>${product.getProduction()}</td>
    </tr>
</table>
</body>
</html>
