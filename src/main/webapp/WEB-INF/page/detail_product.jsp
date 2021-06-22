<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<div class="product">
    <img class="product__image" src="${ pageContext.request.contextPath }/${product.image}" alt="${product.name}">
    <div class="product__info">
        <div>
            <p class="info__name">${product.name.toUpperCase()}</p>
            <p class="info__price">
                <fmt:formatNumber value="${product.price}"
                                  maxFractionDigits="0" currencyCode="VND" type="currency" />
            </p>
            <a class="info__btn"
               href="${pageContext.request.contextPath}/order?product_id=${product.id}"
               target="_blank">Mua Ngay</a>
            <div class="info__desc">
                <h4>${product.description}</h4>
                <p class="desc__text"></p>
            </div>
        </div>
    </div>
</div>