<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Category List</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <h2>Category Management</h2>

    <form action="${pageContext.request.contextPath}/admin/category/list" method="get" class="mb-3">
        <div class="input-group">
            <input type="text" class="form-control" name="keyword" value="${keyword}" placeholder="Search categories...">
            <button class="btn btn-outline-secondary" type="submit">Search</button>
        </div>
    </form>

    <a href="${pageContext.request.contextPath}/admin/category/add" class="btn btn-primary mb-3">Add New Category</a>

    <table class="table table-bordered table-striped">
        <thead>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Icon</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="cate" items="${cateList}">
            <tr>
                <td>${cate.cateId}</td>
                <td>${cate.cateName}</td>
                <td>
                    <c:if test="${not empty cate.icons}">
                        <img src="${pageContext.request.contextPath}/uploads/category/${cate.icons}" alt="icon" width="50" height="50">
                    </c:if>
                </td>
                <td>
                    <a href="${pageContext.request.contextPath}/admin/category/edit?id=${cate.cateId}" class="btn btn-sm btn-warning">Edit</a>
                    <a href="${pageContext.request.contextPath}/admin/category/delete?id=${cate.cateId}" class="btn btn-sm btn-danger" onclick="return confirm('Are you sure?')">Delete</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>
