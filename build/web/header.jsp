<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="https://kit.fontawesome.com/1d2bfd0d3f.js" crossorigin="anonymous"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Helvetica&display=swap">
        <link href="css/header.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="container-fluid sticky-top py-2 px-4 header" style="background-color: darkgrey;">
            <a class="link-underline-dark" href="home"><h4>Home</h4></a> 
            <div class="dropdown d-inline position-absolute top-50 end-0 translate-middle-y px-4">                
                <a class="link-underline-dark" href="#" role="button" id="dropdownMenuLink" data-bs-toggle="dropdown" aria-expanded="false" style="color: black">
                    <i class="fa-regular fa-circle-user fa-xl" style="color: #000000;"></i>${sessionScope.user.fullName}
                </a>
                <ul class="dropdown-menu" style="">                    
                        <c:if test="${sessionScope.user != null && sessionScope.user.roleId == 15}">
                        <li><a class="dropdown-item" href="editProfile">Profile</a></li>                       
                        <li><a class="dropdown-item" href="ListUser">Manage User</a></li>                                                                
                        <li><a class="dropdown-item" href="requirement-list">Requirement List</a></li>                                                                
                        <li><a class="dropdown-item" href="Logout">Logout</a></li>                                              
                        </c:if>
                        
                        <c:if test="${sessionScope.user != null && sessionScope.user.roleId == 18}">
                        <li><a class="dropdown-item" href="editProfile">Profile</a></li> 
                        <li><a class="dropdown-item" href="requirement-list">Requirement List</a></li>                                                                
                        <li><a class="dropdown-item" href="Logout">Logout</a></li>                       
                        </c:if>
                        
                        
                </ul>
            </div>
        </div>
    </body>
</html>
