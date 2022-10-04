<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>User Management Application</title>
</head>
<body>
<center>
    <h1>User Management</h1>
    <h2>
        <a href="/users?action=create">Add New User</a>
        <link rel="stylesheet" href="../../bootstrap520/css/bootstrap.min.css">
        <link rel="stylesheet" href="../../datatables/css/dataTables.bootstrap5.min.css">
    </h2>

    <form action="/users">
        <input type="text" name="name">
        <input type="submit" name="action" value="findByName">
    </form>
</center>
<div align="center">
    <table id="tableStudent" class="table table-striped table-bordered" style="width:100%">
        <%--        <caption><h2>List of Users</h2></caption>--%>
        <thead>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Country</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="user" items="${listUser}">
            <tr>
                <td><c:out value="${user.id}"/></td>
                <td><c:out value="${user.name}"/></td>
                <td><c:out value="${user.email}"/></td>
                <td><c:out value="${user.country}"/></td>
                <td>
                    <a href="/users?action=edit&id=${user.id}">Edit</a>
                    <a href="/users?action=delete&id=${user.id}">Delete</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
<script src="../../jquery/jquery-3.5.1.min.js"></script>
<script src="../../datatables/js/jquery.dataTables.min.js"></script>
<script src="../../datatables/js/dataTables.bootstrap5.min.js"></script>
<script>
    $(document).ready(function (){
        $("#tableStudent").dataTable({
            "dom": "lrtrip",
            "lengthChange": false,
            "pageLength":2
        })
        }
    )
</script>
</body>
</html>