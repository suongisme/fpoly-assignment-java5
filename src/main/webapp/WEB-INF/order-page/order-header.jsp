<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<a target="_blank" href="${pageContext.request.contextPath}/home">
    <img style="width: 75%" alt="Logo" src="${ pageContext.request.contextPath }/images/logo2.png">
</a>
<div class="header__search">
    <img class="search__icon" src="${ pageContext.request.contextPath }/images/search.png" alt="search-icon">
    <input class="search__text" type="text" placeholder="Tìm kiếm sản phẩm">
</div>
<c:if test="${sessionScope.login eq null}">
    <a class="header__btn" href="${pageContext.request.contextPath}/login">Đăng Nhập</a>
</c:if>
<c:if test="${sessionScope.login ne null}">
    <a class="header__btn" href="${pageContext.request.contextPath}/logout">${sessionScope.login.username}</a>
</c:if>