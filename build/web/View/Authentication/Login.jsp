
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <style>
            .container {
                min-height: 100vh;
            }
        </style>
    </head>
    <body>
        <div class="container d-flex justify-content-center align-items-center">
            <div class="card" style="width: 500px;">
                <div class="card-header">
                    Please Sign In
                </div>
                <div class="card-body">
                    <form method="POST" action="login">
                        <input class="form-control mb-3" type="text" placeholder="Username" id="userName" name="userName" required>
                        <input class="form-control mb-3" type="password" placeholder="password" id="password" name="password" required>
                        <button type="submit" class="btn btn-success" id="submitBtn">Login</button>                
                        <p id="mess" style="color: red;">${mess}</p>
                        <a href="Register">Click here to register</a>
                    </form>
                </div>
            </div>

        </div>
                        
    </body>
</html>
s