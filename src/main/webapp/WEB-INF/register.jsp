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

    <link rel="icon" href="/images/icon_page.png">

    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Baloo+2:wght@700&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css">
</head>
<body>

<div class="login">
    <div class="login__form">
        <form:form action="${pageContext.request.contextPath}/register" method="POST" modelAttribute="user">
            <div>
                <img style="display: block; margin: auto;" src="${pageContext.request.contextPath}/images/logo2.png">
            </div>
            <div>
                <div class="form__input">
                    <form:input path="username" type="text"     name="username" placeholder="Nhập tài khoản" />
                    <form:errors path="username"/>
                </div>

                <div class="form__input">
                    <form:input path="password" type="password" name="password" placeholder="Nhập mật khẩu"/>
                    <form:errors path="password"/>
                </div>

                <div class="form__input">
                    <form:input path="email" type="text"     name="email"    placeholder="Nhập email"/>
                    <form:errors path="email"/>
                </div>

                <div class="form__input">
                    <form:input path="address" type="text"     name="address"  placeholder="Nhập địa chỉ"/>
                    <form:errors path="address"/>
                </div>

                <div class="form__input">
                    <form:input path="mobile" type="text"     name="mobile"   placeholder="Nhập số điện thoại"/>
                    <form:errors path="mobile"/>
                </div>
            </div>
            <div style="text-align: center;">
                <button>Đăng Ký</button>
            </div>
            <div  style="text-align: center;">
                    <span style="font-family: Arial">
                        Bạn có tài khoản chưa? <a href="${pageContext.request.contextPath}/login" style="color: #d8b979; font-family: 'Baloo 2', cursive;">Đăng nhập</a>
                     </span>
            </div>
            <div style="text-align: center;">
                <a href="" style="color: #007bff; font-family: Arial">Quay lại màn hình chính</a>
            </div>
        </form:form>
    </div>
</div>

</body>
</html>