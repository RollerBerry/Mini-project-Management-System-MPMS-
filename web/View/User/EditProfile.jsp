<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.User" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Edit Profile</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
        <div class="container mt-5">
            <h2>Edit User Profile</h2>
            <form action="editProfileServlet" method="post">
                <input type="hidden" name="id" value="${user.userId}"/> <!-- Giữ ID người dùng -->

                <div class="mb-3">
                    <label for="fullName" class="form-label">Full Name</label>
                    <input type="text" class="form-control" id="fullName" name="fullName" value="${user.fullName}" required>
                </div>

                <div class="mb-3">
                    <label for="userName" class="form-label">Username</label>
                    <input type="text" class="form-control" id="userName" name="userName" value="${user.userName}" required>
                </div>

                <div class="mb-3">
                    <label for="email" class="form-label">Email</label>
                    <input type="email" class="form-control" id="email" name="email" value="${user.email}" required>
                </div>


                <div class="mb-3">
                    <label for="role" class="form-label">Role</label>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="role" id="roleStaff" value="16" ${user.roleId == 16 ? 'checked' : ''} required>
                        <label class="form-check-label" for="roleStaff">Staff</label>
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="role" id="roleTeamLeader" value="17" ${user.roleId == 17 ? 'checked' : ''} required>
                        <label class="form-check-label" for="roleTeamLeader">Team Leader</label>
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="role" id="roleProjectLeader" value="18" ${user.roleId == 18 ? 'checked' : ''} required>
                        <label class="form-check-label" for="roleProjectLeader">Project Leader</label>
                    </div>
                </div>

                <div class="mb-3">
                    <label for="department" class="form-label">Department</label>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="department" id="deptDevelopment" value="19" ${user.dep_id == 19 ? 'checked' : ''} required>
                        <label class="form-check-label" for="deptDevelopment">Development</label>
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="department" id="deptMarketing" value="20" ${user.dep_id == 20 ? 'checked' : ''} required>
                        <label class="form-check-label" for="deptMarketing">Marketing</label>
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="department" id="deptFinance" value="21" ${user.dep_id == 21 ? 'checked' : ''} required>
                        <label class="form-check-label" for="deptFinance">Finance</label>
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="department" id="deptHR" value="22" ${user.dep_id == 22 ? 'checked' : ''} required>
                        <label class="form-check-label" for="deptHR">HR</label>
                    </div>
                </div>

                <div class="mb-3">
                    <label for="status" class="form-label">Status</label>
                    <div class="form-check form-switch">
                        <input class="form-check-input" type="checkbox" id="statusSwitch" name="status" 
                               value="1" ${user.status ? 'checked' : ''} />
                        <label class="form-check-label" for="statusSwitch" id="statusLabel">
                            ${user.status ? 'Active' : 'Inactive'}
                        </label>
                    </div>
                </div>






                <div class="d-flex justify-content-between mt-4">
                    <button type="submit" class="btn btn-primary">Update User</button>
                    <a href="ListUser" class="btn btn-secondary">Back to List User</a>
                </div>
            </form>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>

        <script>
            const statusSwitch = document.getElementById('statusSwitch');
            const statusLabel = document.getElementById('statusLabel');

            statusSwitch.addEventListener('change', function () {
                if (this.checked) {
                    statusLabel.textContent = 'Active';
                } else {
                    statusLabel.textContent = 'Inactive';
                }
            });
        </script>
    </body>
</html>
