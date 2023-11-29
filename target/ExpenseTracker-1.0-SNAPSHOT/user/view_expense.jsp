<%@ page import="dao.ExpenseDao" %>
<%@ page import="db.HibernateUtil" %>
<%@ page import="entity.User" %>
<%@ page import="entity.Expense" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: пользователь
  Date: 10.09.2023
  Time: 17:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<html>
<head>
    <title>Title</title>
  <%@include file="/component/all_css.jsp" %>
</head>
<body>
<c:if test="${empty loginUser}">
    <c:redirect url="../login.jsp"></c:redirect>
</c:if>
<%@include file="/component/navbar.jsp" %>
<div class="container p-5">
    <div class="row">
        <div class="col-md-8 offset-md-2">
            <div class="card">
                <div class="card-header text-center">
                    <p class="fs-3 fw-bold">All Expenses </p>
                    <c:if test="${not empty msg}">
                        <p class="text-center text-success fs-4">${msg}</p>
                        <c:remove var="msg" />
                    </c:if>
                </div>
                <div class="card-body">
                    <table class="table">
                        <thead>
                        <tr>
                            <th scope="col">Title</th>
                            <th scope="col">Description</th>
                            <th scope="col">Date</th>
                            <th scope="col">Time</th>
                            <th scope="col">Price</th>
                            <th scope="col">Action</th>
                        </tr>
                        </thead>
                        <tbody>
                        <%
                            User user = (User) session.getAttribute("loginUser");
                            ExpenseDao dao = new ExpenseDao(HibernateUtil.getSessionFactory());
                            List<Expense> list = dao.getAllExpenses(user);
                            for(Expense ex: list){
                        %>
                        <tr>
                            <th scope="row"><%=ex.getTitle()%></th>
                            <td><%=ex.getDescription()%></td>
                            <td><%=ex.getDate()%></td>
                            <td><%=ex.getTime()%></td>
                            <td><%=ex.getPrice()%></td>
                            <td><a href="edit_expense.jsp?id=<%=ex.getId()%>" class="btn btn-sm btn-primary me-1">Edit</a></td>
                            <td><a href="../deleteExpense?id=<%=ex.getId()%>" class="btn btn-sm btn-danger me-1">Delete</a></td>
                        </tr>
                        <%
                            }
                        %>

                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>
