<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.User" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Danh sách người dùng</title>
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
        <%@include file="../../header.jsp" %>
        <div class="container mt-5">
            <h2 class="text-center">Danh sách người dùng</h2>
            <!-- Thêm form tìm kiếm -->
            <form action="ListUser" method="POST" class="mb-3">
                <div class="row">
                    <div class="col-md-4">
                        <input type="text" name="departmentName" placeholder="Tìm theo tên phòng ban " class="form-control">
                    </div>
                    <div class="col-md-4">
                        <select name="sortOrder" class="form-control">
                            <option value="">-- Sắp xếp theo --</option>
                            <option value="asc">Số lượng dự án (Tăng dần)</option>
                            <option value="desc">Số lượng dự án (Giảm dần)</option>
                        </select>
                    </div>
                    <div class="col-md-4 d-flex align-items-end">
                        <button type="submit" class="btn btn-primary me-2">Tìm kiếm</button>
                        <a href="adduser" class="btn btn-success me-2">Thêm người dùng mới</a>
                    </div>
                </div>
            </form>
            <table class="table table-bordered">
                <thead class="thead-dark">
                    <tr>
                        <th>ID</th>
                        <th>Full Name</th>
                        <th>User Name</th>
                        <th>Department</th>
                        <th>Role</th>
                        <th>Status</th>
                        <th>Project Count</th>
                        <th>Action</th>
                        <th>Edit Profile</th>
                    </tr>
                </thead>
                <tbody>
                    <c:choose>
                        <c:when test="${not empty userList}">
                            <c:forEach var="u" items="${userList}">
                                <tr>
                                    <td>${u.userId}</td>
                                    <td>${u.fullName}</td>
                                    <td>${u.userName}</td>
                                    <td>${u.departmentName}</td>
                                    <td>${u.roleName}</td>
                                    <td>${u.status ? 'Active' : 'Inactive'}</td>
                                    <td>${u.projectCount}</td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${u.status}">
                                                <button class="btn btn-danger">Inactive</button>
                                            </c:when>
                                            <c:otherwise>
                                                <button class="btn btn-success">Active</button>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td>
                                        <a href="editProfileServlet?id=${u.userId}" class="btn btn-warning">Edit</a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <tr>
                                <td colspan="9" class="text-center">No user.</td>
                            </tr>
                        </c:otherwise>
                    </c:choose>
                </tbody>
            </table>
            <a href="home">Back to Home</a>
        </div>
    </body>
</html>
