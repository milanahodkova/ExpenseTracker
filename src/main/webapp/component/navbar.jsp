<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<%@include file="all_css.jsp" %>
<style>
    .container-fluid {
        height: 80px;
    }
    .navbar-brand {
        color: black !important;
        font-weight: 900;
        margin-left: 64px;
    }
    .navbar {
        background-color: white;
    }
    .nav-link.active {
        color: black !important;
        font-size: 23px;
    }
    .nav-link.active[href="register.jsp"],
    .nav-link.active[href="../logout"]
    {
        margin-right: 64px;
    }
    .nav-link.active[href="login.jsp"],
    .nav-link.active[href="#"]
    {
        margin-right: 32px;
    }

</style>

<nav class="navbar navbar-expand-lg navbar-dark">
    <div class="container-fluid">
        <a class="navbar-brand" href="${pageContext.request.contextPath}/index.jsp" style="font-size: 35px;"><i class="fa-regular fa-credit-card"></i>
            Expense Tracker</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">

                <c:if test="${not empty loginUser}">
                    <li class="nav-item">
                        <a class="nav-link active"
                           href="${pageContext.request.contextPath}/user/add_expense.jsp"><i class="fa-solid fa-plus"></i>
                            Add expense</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active"
                           href="${pageContext.request.contextPath}/user/view_expense.jsp"><i class="fa-solid fa-list"></i>
                            View expense</a>
                    </li>
                </c:if>

            </ul>
            <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                <c:if test="${not empty loginUser}">
                    <li class="nav-item">
                        <a class="nav-link active"
                           href="#"><i class="fa-solid fa-circle-user"></i>
                                ${loginUser.fullName}</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active"
                           href="${pageContext.request.contextPath}/logout"><i class="fa-solid fa-user-plus"></i> Logout</a>
                    </li>
                </c:if>

                <c:if test="${empty loginUser }">
                    <li class="nav-item">
                        <a class="nav-link active"
                           href="login.jsp"><i class="fa-solid fa-right-to-bracket"></i> Login</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active"
                           href="register.jsp"><i class="fa-solid fa-user-plus"></i> Register</a>
                    </li>
                </c:if>
            </ul>
        </div>
    </div>
</nav>
