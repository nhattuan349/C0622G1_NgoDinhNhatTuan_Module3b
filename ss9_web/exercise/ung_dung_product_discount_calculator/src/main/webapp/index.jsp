<%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 26/09/2022
  Time: 3:35 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>$Title$</title>
    <link rel="stylesheet" href="bootstrap-5.1.3/css/bootstrap.css">
  </head>
  <body>

<form action="/PDCServlet" method="post">
  <span>Product Description: </span><input type="text"  name="productDescription">
  <span>List Price: </span><input type="text"  name="listPrice">
  <span>Discount Percent: </span><input type="text"  name="discountPercent">
  <div><input type="submit" value="Result"> </div>
</form>

  <script src="webapp/bootstrap-5.1.3/js/bootstrap.js"></script>
  </body>
</html>
