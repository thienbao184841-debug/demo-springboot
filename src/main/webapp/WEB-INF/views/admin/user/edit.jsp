<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Edit User</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <h2>Edit User</h2>
    
    <form action="${pageContext.request.contextPath}/admin/user/save" method="post" enctype="multipart/form-data">
        <input type="hidden" name="id" value="${user.id}">
        
        <div class="row">
            <div class="col-md-6 mb-3">
                <label class="form-label">Email</label>
                <input type="email" class="form-control" name="email" value="${user.email}" required>
            </div>
            <div class="col-md-6 mb-3">
                <label class="form-label">Username</label>
                <input type="text" class="form-control" name="userName" value="${user.userName}" required>
            </div>
        </div>
        
        <div class="row">
            <div class="col-md-6 mb-3">
                <label class="form-label">Full Name</label>
                <input type="text" class="form-control" name="fullName" value="${user.fullName}" required>
            </div>
            <div class="col-md-6 mb-3">
                <label class="form-label">Password</label>
                <input type="text" class="form-control" name="passWord" value="${user.passWord}" required>
            </div>
        </div>
        
        <div class="row">
            <div class="col-md-6 mb-3">
                <label class="form-label">Role ID</label>
                <input type="number" class="form-control" name="roleid" value="${user.roleid}" required>
            </div>
            <div class="col-md-6 mb-3">
                <label class="form-label">Phone</label>
                <input type="text" class="form-control" name="phone" value="${user.phone}">
            </div>
        </div>

        <div class="mb-3">
            <label class="form-label">Current Avatar</label>
            <c:if test="${not empty user.avatar}">
                <div class="mb-2">
                    <img src="${pageContext.request.contextPath}/uploads/user/${user.avatar}" alt="avatar" width="100">
                </div>
            </c:if>
            <label class="form-label">Upload New Avatar (leave blank to keep current)</label>
            <input type="file" class="form-control" name="avatarFile">
        </div>
        
        <button type="submit" class="btn btn-success">Update</button>
        <a href="${pageContext.request.contextPath}/admin/user/list" class="btn btn-secondary">Cancel</a>
    </form>
</div>
</body>
</html>
