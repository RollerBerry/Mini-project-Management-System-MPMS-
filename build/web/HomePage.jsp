<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <style>
            .notlogin {
                min-height: 100vh;
                background-image: url("https://www.baypmtech.com/wp-content/uploads/2014/01/847x480-14-IBM-023_illustration_analytics_3.png");
            }

            .container {
                min-height: 100vh;
            }
            .overlay {
                position: absolute;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background-color: rgba(0, 0, 0, 0.5); /* Adjust the alpha value for transparency */
            }
        </style>
    </head>
    <body>
        <c:if test="${sessionScope.user == null}">
            <div class="container-fluid notlogin">
                <div class="overlay d-flex justify-content-center align-items-center" style="flex-direction: column;">
                    <div class="">
                        <p style="color: white; font-size: 50px">LOGIN TO USE</p><br>
                    </div>
                    <div class="">
                        <a type="button" class="btn btn-success" href="login">Login</a>    
                        <a type="button" class="btn btn-warning" href="Register">Register</a>    
                    </div>
                </div>
            </div>
        </c:if>
        <c:if test="${sessionScope.user != null}">
            <%@include file="header.jsp" %>
            <div class="container" style="margin-top: 100px;">
                <div class="row g-1">
                    
                </div>
            </div>
        </c:if>
    </body>
</html>
