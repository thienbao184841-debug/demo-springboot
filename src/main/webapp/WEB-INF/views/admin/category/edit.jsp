<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Category</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <h2>Edit Category</h2>
    
    <form action="${pageContext.request.contextPath}/admin/category/save" method="post" enctype="multipart/form-data">
        <input type="hidden" name="cateId" value="${category.cateId}">
        
        <div class="mb-3">
            <label class="form-label">Category Name</label>
            <input type="text" class="form-control" name="cateName" value="${category.cateName}" required>
        </div>
        
        <div class="mb-3">
            <label class="form-label">Current Icon</label>
            <c:if test="${not empty category.icons}">
                <div class="mb-2">
                    <img src="${pageContext.request.contextPath}/uploads/category/${category.icons}" alt="icon" width="100">
                </div>
            </c:if>
            <label class="form-label">Upload New Icon (leave blank to keep current)</label>
            <input type="file" class="form-control" name="iconFile">
        </div>
        
        <button type="submit" class="btn btn-success">Update</button>
        <a href="${pageContext.request.contextPath}/admin/category/list" class="btn btn-secondary">Cancel</a>
    </form>
</div>
</body>
</html>
