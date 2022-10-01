<%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 01/10/2022
  Time: 9:13 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Trang edit</h1>

<a href="/product">Quay lai trang list</a>

<p><c:if test="${massage!=null}">
    <span>${massage}</span>
</c:if></p>

<form method="post">
    <fiedset>
        <legend>
            <tr>
                <td>Name:</td>
                <td><input type="text" name="name" id="name" value="${product.getName()}"></td>
            </tr>
            <td>
                 <td>Price:</td>
                <td><input type="text" name="price" id="price" value="${product.getPrice()}"></td>
            </tr>
            <tr>
                <td>Amount:</td>
                <td><input type="text" name="amount" id="amount" value="${product.getAmount()}"></td>
            </tr>
            <tr>
                <td>Production</td>
                <td><input type="text" name="production" id="production" value="${product.getProduction()}"></td>
            </tr>
            <tr>
                <td><input type="submit" value="Edit product"></td>
            </tr>
        </legend>
    </fiedset>
</form>


</body>
</html>
