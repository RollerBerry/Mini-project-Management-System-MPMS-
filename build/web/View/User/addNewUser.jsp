<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Add New User</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
        <div class="container mt-5">
            <h2>Add New User</h2>
            <form action="adduser" method="post">
                <div class="mb-3">
                    <label for="fullName" class="form-label">Full Name</label>
                    <input type="text" class="form-control" id="fullName" name="fullName" required>
                </div>
                <div class="mb-3">
                    <label for="userName" class="form-label">Username</label>
                    <input type="text" class="form-control" id="userName" name="userName" required>
                </div>
                <div class="mb-3">
                    <label for="email" class="form-label">Email</label>
                    <input type="email" class="form-control" id="email" name="email" required>
                </div>
                <div class="mb-3">
                    <label for="password" class="form-label">Password</label>
                    <input type="password" class="form-control" id="password" name="password" required>
                </div>
                <div class="mb-3">
                    <label for="role" class="form-label">Role ID</label>
                    <input type="text" class="form-control" id="role" name="role">
                </div>
                <div class="mb-3">
                    <label for="dept_id" class="form-label">Department</label><br>

                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="department" id="deptDevelopment" value="1" required>
                        <label class="form-check-label" for="deptDevelopment">
                            Development
                        </label>
                    </div>

                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="department" id="deptMarketing" value="2" required>
                        <label class="form-check-label" for="deptMarketing">
                            Marketing
                        </label>
                    </div>
                </div>
                <div class="mb-3">
                    
                    <div class="form-group" id="status" name="status" required>
                        <label for="status">Status</label>
                        <div>
                            <input type="radio" id="active" name="status" value="1" required>
                            <label for="active">Active</label>
                        </div>
                        <div>
                            <input type="radio" id="inactive" name="status" value="0">
                            <label for="inactive">Inactive</label>
                        </div>
                    </div>

                </div>
                <button type="submit" class="btn btn-primary">Add User</button>
                <a href="home">Back to Home</a>
            </form>
        </div>
    </body>
</html>
