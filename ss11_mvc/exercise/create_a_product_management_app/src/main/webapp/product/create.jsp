<%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 30/09/2022
  Time: 2:26 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Thêm khách hàng</title>
</head>
<body>
<h1> Trang thêm mới</h1>

<a href="/product">Quay lại trang list</a>

<p><c:if test="${mess!=null}">
    <span>${mess}</span>
</c:if></p>
<form action="/product?action=create" method="post">
    <pre> Name <input type="text"  name="name"></pre>
    <pre> Price <input type="text"  name="price"></pre>
    <pre> Amount <input type="text"  name="amount"></pre>
    <pre> Production <input type="text"  name="production"></pre>

    <pre><button>Save</button></pre>
</form>
</body>
</html>
