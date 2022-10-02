<%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 29/09/2022
  Time: 8:39 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>$show list of customers$</title>
</head>
<body>
<h1>Hiển thị danh sách khách hàng</h1>
<table border="1">
  <tr>
    <th>Name</th>
    <th>birthday</th>
    <th>address</th>
    <th>img</th>
  </tr>

    <c:forEach var="customer" items="${customerList}" varStatus="status">
        <tr>
            <td>${customer.getName()}</td>
            <td>${customer.getBirthday()}</td>
            <td>${customer.getAddress()}</td>
            <td>${customer.getImg()}</td>
        </tr>
    </c:forEach>


</table>
</body>
</html>
