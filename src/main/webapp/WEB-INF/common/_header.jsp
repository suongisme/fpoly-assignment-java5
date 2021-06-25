<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="header">
    <div class="header__status-bar">
        <a class="status-bar__logo" href="${ context }/home">
            <img class="logo__img" src="${ context }/images/logo.png" alt="logo">
        </a>
        <ul class="status-bar__menu">
            <li class="menu__nav">
                <a class="nav__text" href="${ context }/home"> TRANG CHỦ </a>
            </li>
            <li class="menu__nav">
                <a target="_blank" class="nav__text" href="${pageContext.request.contextPath}/order">MUA HÀNG</a>
            </li>
            <li class="menu__nav">
                <a class="nav__text" href="#">SẢN PHẨM</a>
            </li>
            <li class="menu__nav">
                <a class="nav__text" href="#">TIN TỨC</a>
            </li>
            <li class="menu__nav">
                <a class="nav__text" href="#">CỬA HÀNG</a>
            </li>
            <li class="menu__nav">
                <a class="nav__text" href="#">TUYỂN DỤNG</a>
            </li>
            <li class="menu__nav">
                <a class="nav__text" href="${pageContext.request.contextPath}/history">LỊCH SỬ MUA HÀNG</a>
            </li>
        </ul>

        <c:if test="${sessionScope.login ne null}">
            <a style="align-self: center" href="${pageContext.request.contextPath}/logout">
                <i style="font-size: 2rem; color: white" class="fas fa-sign-out-alt"></i>
            </a>
        </c:if>

        <c:if test="${sessionScope.login eq null}">
            <a style="align-self: center; transform: rotateZ(180deg)" href="${pageContext.request.contextPath}/login">
                <i style="font-size: 2rem; color: white" class="fas fa-sign-out-alt"></i>
            </a>
        </c:if>
    </div>
    <h2 class="header__text-intro">TOCOTOCO MENU</h2>
</div>