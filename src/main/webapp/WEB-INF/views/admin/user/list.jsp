<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>User List</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <h2>User Management</h2>

    <form action="${pageContext.request.contextPath}/admin/user/list" method="get" class="mb-3">
        <div class="input-group">
            <input type="text" class="form-control" name="keyword" value="${keyword}" placeholder="Search users...">
            <button class="btn btn-outline-secondary" type="submit">Search</button>
        </div>
    </form>

    <a href="${pageContext.request.contextPath}/admin/user/add" class="btn btn-primary mb-3">Add New User</a>

    <table class="table table-bordered table-striped">
        <thead>
        <tr>
            <th>ID</th>
            <th>Email</th>
            <th>Username</th>
            <th>Full Name</th>
            <th>Role ID</th>
            <th>Avatar</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="user" items="${userList}">
            <tr>
                <td>${user.id}</td>
                <td>${user.email}</td>
                <td>${user.userName}</td>
                <td>${user.fullName}</td>
                <td>${user.roleid}</td>
                <td>
                    <c:if test="${not empty user.avatar}">
                        <img src="${pageContext.request.contextPath}/uploads/user/${user.avatar}" alt="avatar" width="50" height="50">
                    </c:if>
                </td>
                <td>
                    <a href="${pageContext.request.contextPath}/admin/user/edit?id=${user.id}" class="btn btn-sm btn-warning">Edit</a>
                    <a href="${pageContext.request.contextPath}/admin/user/delete?id=${user.id}" class="btn btn-sm btn-danger" onclick="return confirm('Are you sure?')">Delete</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>
