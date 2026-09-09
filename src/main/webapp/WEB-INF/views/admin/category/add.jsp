<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add Category</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <h2>Add New Category</h2>
    
    <form action="${pageContext.request.contextPath}/admin/category/save" method="post" enctype="multipart/form-data">
        <div class="mb-3">
            <label class="form-label">Category Name</label>
            <input type="text" class="form-control" name="cateName" required>
        </div>
        <div class="mb-3">
            <label class="form-label">Icon Image</label>
            <input type="file" class="form-control" name="iconFile">
        </div>
        <button type="submit" class="btn btn-success">Save</button>
        <a href="${pageContext.request.contextPath}/admin/category/list" class="btn btn-secondary">Cancel</a>
    </form>
</div>
</body>
</html>
