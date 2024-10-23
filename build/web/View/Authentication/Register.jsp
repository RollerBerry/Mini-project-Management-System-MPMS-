<%-- 
    Document   : Register
    Created on : Oct 22, 2024, 7:42:34 AM
    Author     : Predator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Register</title>
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
        <div class="container mt-5">
            <div class="row justify-content-center">
                <div class="col-md-6">
                    <h2 class="text-center mb-4">Đăng ký</h2>

                    <c:if test="${not empty error}">
                        <div class="alert alert-danger" role="alert">
                            ${error}
                        </div>
                    </c:if>

                    <form action="Register" method="POST" onsubmit="return validateForm()">
                        <div class="mb-3">
                            <label for="fullname" class="form-label">Full Name</label>
                            <input type="text" class="form-control" id="fullname" name="fullname" required>
                        </div>
                        <div class="mb-3">
                            <label for="userName" class="form-label">Tên đăng nhập</label>
                            <input type="text" class="form-control" id="userName" name="userName" required>
                        </div>
                        <div class="mb-3">
                            <label for="email" class="form-label">Email</label>
                            <input type="email" class="form-control" id="email" name="email" required>
                        </div>

                        <div class="mb-3">
                            <label for="password" class="form-label">Mật khẩu</label>
                            <input type="password" class="form-control" id="password" name="password" required>
                        </div>

                        <div class="mb-3">
                            <label for="confirmPassword" class="form-label">Nhập lại mật khẩu</label>
                            <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" required>
                        </div>

                        <div id="passwordError" class="text-danger mb-3"></div> <!-- Thêm chỗ để hiển thị lỗi -->

                        <div class="d-grid gap-2">
                            <button type="submit" class="btn btn-primary btn-block">Đăng ký</button>
                        </div>
                    </form>

                    <div class="mt-3 text-center">
                        <p>Đã có tài khoản? <a href="login">Đăng nhập</a></p>
                    </div>
                </div>
            </div>
        </div>

        <!-- Bootstrap JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>

        <!-- JavaScript để kiểm tra mật khẩu và xác nhận mật khẩu -->
        <script>
            function validateForm() {
                var password = document.getElementById("password").value;
                var confirmPassword = document.getElementById("confirmPassword").value;
                var errorDiv = document.getElementById("passwordError");

                if (password !== confirmPassword) {
                    errorDiv.innerHTML = "Mật khẩu và xác nhận mật khẩu không khớp.";
                    return false;
                }

                errorDiv.innerHTML = "";  // Xóa thông báo lỗi nếu mật khẩu khớp
                return true;
            }
        </script>
    </body>
</html>
