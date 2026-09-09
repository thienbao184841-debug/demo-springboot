<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add User</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <h2>Add New User</h2>
    
    <form action="${pageContext.request.contextPath}/admin/user/save" method="post" enctype="multipart/form-data">
        <div class="row">
            <div class="col-md-6 mb-3">
                <label class="form-label">Email</label>
                <input type="email" class="form-control" name="email" required>
            </div>
            <div class="col-md-6 mb-3">
                <label class="form-label">Username</label>
                <input type="text" class="form-control" name="userName" required>
            </div>
        </div>
        
        <div class="row">
            <div class="col-md-6 mb-3">
                <label class="form-label">Full Name</label>
                <input type="text" class="form-control" name="fullName" required>
            </div>
            <div class="col-md-6 mb-3">
                <label class="form-label">Password</label>
                <input type="password" class="form-control" name="passWord" required>
            </div>
        </div>
        
        <div class="row">
            <div class="col-md-6 mb-3">
                <label class="form-label">Role ID (e.g. 1 for Admin)</label>
                <input type="number" class="form-control" name="roleid" value="1" required>
            </div>
            <div class="col-md-6 mb-3">
                <label class="form-label">Phone</label>
                <input type="text" class="form-control" name="phone">
            </div>
        </div>

        <div class="mb-3">
            <label class="form-label">Avatar Image</label>
            <input type="file" class="form-control" name="avatarFile">
        </div>
        
        <button type="submit" class="btn btn-success">Save</button>
        <a href="${pageContext.request.contextPath}/admin/user/list" class="btn btn-secondary">Cancel</a>
    </form>
</div>
</body>
</html>
