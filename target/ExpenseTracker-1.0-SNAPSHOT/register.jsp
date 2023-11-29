<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<html>
<head>
    <title>Title</title>
    <%@include file="component/all_css.jsp" %>
    <style>
        .card-sh {
            box-shadow: 0 0 6px 0 rgba(0, 0, 0, 0.3);
        }
    </style>
</head>
<body class="bg-light">
<%@include file="component/navbar.jsp" %>

<div class="container p-5" >
    <div class="row">
        <div class="col-md-6 offset-md-3" >
            <div class="card card-sh">
                <div class="card-header">
                    <p class="text-center fs-3 fw-bold">Register page</p>
                </div>
                <c:if test="${not empty msg}">
                    <p class="text-center text-success fs-4">${msg}</p>
                    <c:remove var="msg" />
                </c:if>
                <form action="userRegister" method="post">
                    <div class="mb-3 mt-4">
                        <label class="text-dark">Enter Full Name</label>
                        <input type="text" name="fullName" class="form-control">
                    </div>
                    <div class="mb-3">
                        <label class="text-dark">Email</label>
                        <input type="email" name="email" class="form-control">
                    </div>
                    <div class="mb-3">
                        <label class="text-dark">Password</label>
                        <input type="password" name="password" class="form-control">
                    </div>
                    <div class="mb-3">
                        <label class="text-dark">About</label>
                        <input type="text" name="about" class="form-control">
                    </div>
                    <button class="btn btn-success col-md-12">Register</button>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>