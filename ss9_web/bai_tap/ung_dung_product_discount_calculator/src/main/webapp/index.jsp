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
<%--<div class="container" style="width: 350px; height: 600px">--%>
<%--  <h1> Nhập hóa đơn</h1>--%>
<%--  <form action="/PDCServlet" method="post">--%>
<%--    <div class="mb-3">--%>
<%--      <label for="exampleInputEmail1" class="form-label">Product Description: </label>--%>
<%--      <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name="productDescription">--%>
<%--    </div>--%>
<%--    <div class="mb-3">--%>
<%--      <label  class="form-label">List Price:</label>--%>
<%--      <input type="password" class="form-control"  name="listPrice">--%>
<%--    </div>--%>
<%--    <div class="mb-3">--%>
<%--      <label class="form-label">Discount Percent: </label>--%>
<%--      <input type="password" class="form-control"  name="listPrice">--%>
<%--    </div>--%>
<%--    <button type="submit" class="btn btn-primary">Submit</button>--%>
<%--  </form>--%>
<%--</div>--%>
<form action="/PDCServlet" method="post">
  <span>Product Description: </span><input type="text"  name="productDescription">
  <span>List Price: </span><input type="text"  name="listPrice">
  <span>Discount Percent: </span><input type="text"  name="discountPercent">
  <div><input type="submit" value="Result"> </div>
</form>

  <script src="webapp/bootstrap-5.1.3/js/bootstrap.js"></script>
  </body>
</html>
