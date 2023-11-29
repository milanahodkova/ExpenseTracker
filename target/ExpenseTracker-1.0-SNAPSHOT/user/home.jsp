<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<html>
<head>
    <title>Title</title>
    <%@include file="/component/all_css.jsp" %>
    <style>
        .carousel-item {
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .carousel-item img {
            max-width: 100%;
            max-height: 100%;
            object-fit: contain;
        }
    </style>
</head>
<body>
<c:if test="${empty loginUser}">
    <c:redirect url="../login.jsp"></c:redirect>
</c:if>
<%@include file="/component/navbar.jsp" %>
<div id="carouselExampleFade" class="carousel slide carousel-fade" data-bs-ride="carousel">
    <div class="carousel-inner">
        <div class="carousel-item active">
            <img src="../img/expense1.png" alt="...">
        </div>
        <div class="carousel-item">
            <img src="../img/expense2.jpg" alt="...">
        </div>
        <div class="carousel-item">
            <img src="../img/expense3.png" alt="...">
        </div>
    </div>
    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleFade" data-bs-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Previous</span>
    </button>
    <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleFade" data-bs-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Next</span>
    </button>
</div>
</body>
</html>
