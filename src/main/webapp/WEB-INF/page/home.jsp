<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${ pageContext.request.contextPath }"/>
<div class="products">
    <div class="products__menu">
        <h2 class="menu__heading">MENU</h2>
        <ul class="menu__list">
            <c:forEach var="category" items="${categories}">
                <li class="list__category">
                    <a class="category__text" href="#${category.id}">${category.name}</a>
                </li>
            </c:forEach>
        </ul>
    </div>
    <div class="products__list">
        <c:forEach var="category" items="${categories}">
            <div>
                <h2 id="${category.id}" class="list__heading">${category.name}</h2>
                <div class="list__body">
                    <c:choose>
                        <c:when test="${category.products.size() > 0 }">
                            <c:forEach var="product" items="${category.products}">
                                <div class="list__product">
                                    <p class="product__sale">${product.sale}%</p>
                                    <a class="product__img" href="${contextPath}/shop/product/${product.id}">
                                        <img src="${contextPath}/${ product.image }" alt="${product.name}">
                                    </a>
                                    <div class="products__info">
                                        <p class="product-info__name">${product.name}</p>
                                        <p class="product-info__price">
                                            <fmt:formatNumber var="money" value="${product.price}"
                                                              type="currency" currencyCode="VND"
                                                              maxFractionDigits="0" />
                                                ${money}
                                        </p>
                                        <div class="container-btn">
                                            <a class="product-info__btn product-info__btn--primary" href="${contextPath}/order?product_id=${product.id}" target="_blank">Mua Ngay</a>
                                            <a class="product-info__btn " href="${contextPath}/product/${product.id}">Xem chi tiết</a>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <h3 style="color: var(--brown-color-primary); margin-left: 30px; font-size: 1.5rem">
                                Không có sản phẩm!
                            </h3>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </c:forEach>
    </div>
</div>