<%--
  Created by IntelliJ IDEA.
  User: me
  Date: 6/18/21
  Time: 8:01 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng nhập</title>

    <link rel="icon" href="${pageContext.request.contextPath}/images/icon_page.png">

    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Baloo+2:wght@700&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/notify.css">
</head>
<body>
<jsp:include page="common/notify.jsp"/>
<div class="login">
    <div class="login__form">
        <form:form action="${pageContext.request.contextPath}/login" method="POST" modelAttribute="userLoginForm">
            <div>
                <img style="display: block; margin: auto;" src="${pageContext.request.contextPath}/images/logo2.png">
            </div>
            <div class="form__input">
                <form:input path="username" placeholder="Nhập tài khoản"/>
                <form:errors path="username"/>
            </div>
            <div class="form__input">
                <form:password path="password" placeholder="Nhập mật khẩu"/>
                <form:errors path="password"/>
            </div>
            <div style="width: 100%; text-align: right;font-family: 'Baloo 2', cursive;">
                <a href="" style="color: #d8b979">Quên mật khẩu?</a>
            </div>
            <div style="text-align: center;">
                <button>Đăng nhập</button>
            </div>
            <div  style="text-align: center;">
                    <span style="font-family: Arial">
                        Bạn có tài khoản chưa? <a href="${pageContext.request.contextPath}/register" style="color: #d8b979; font-family: 'Baloo 2', cursive;">Đăng ký</a>
                     </span>
            </div>
            <div style="text-align: center;">
                <a href="${pageContext.request.contextPath}/home" style="color: #007bff; font-family: Arial">Quay lại màn hình chính</a>
            </div>
        </form:form>
    </div>
</div>
<script src="${pageContext.request.contextPath}/js/notify.js"></script>
</body>
</html>