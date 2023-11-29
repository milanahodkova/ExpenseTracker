<%@ page import="org.hibernate.SessionFactory" %>
<%@ page import="db.HibernateUtil" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>ExpenseTracker</title>
    <%@include file="component/all_css.jsp" %>
    <style>
        .carousel-item {
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .carousel-item img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .carousel {
            overflow: hidden;
        }
        .carousel-text {
            position: absolute;
            top: 45%;
            left: 20%;
            transform: translateY(-50%);
            text-align: left;
            color: black;
            font-weight: bold;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);
        }
        .carousel-text h1 {
            font-size: 90px;
            font-weight: bold;
            margin-bottom: 31px;
        }
        .carousel-text p {
            font-size: 31px;
            color: #72747f;
        }
    </style>
</head>
<body>
<%@include file="component/navbar.jsp" %>

<div id="carouselExampleFade" class="carousel slide carousel-fade" data-bs-ride="carousel">
    <div class="carousel-inner">
        <div class="carousel-item active">
            <img src="img/expense4.png" alt="...">
            <div class="carousel-text">
                <h1>Expense Tracker</h1>
                <p>Use a smart expense tracker to help you effectively manage your finances.</p>
            </div>
        </div>
        <div class="carousel-item">
            <img src="img/expense5.jpg" alt="...">
            <div class="carousel-text">
                <h1>Expense Tracker</h1>
                <p>Use a smart expense tracker to help you effectively manage your finances.</p>
            </div>
        </div>
        <div class="carousel-item">
            <img src="img/expense6.jpg" alt="...">
            <div class="carousel-text">
                <h1>Expense Tracker</h1>
                <p>Use a smart expense tracker to help you effectively manage your finances.</p>
            </div>
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