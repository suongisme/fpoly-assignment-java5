<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<form action="${pageContext.request.contextPath}/cart" method="POST"
	class="order">
	<div class="order__background"></div>
	<div class="order__product-form">
		<input hidden="hidden" value="${product.id}" name="product">
		<div class="product-form-info">
			<img class="product-form-info__product-image"
				src="${ pageContext.request.contextPath }/${product.image}" alt="${product.name}">
			<div class="product-form-info__info">
				<p class="form-info__name">${product.name}</p>
				<p class="form-info__price">
					<fmt:formatNumber value="${product.price}" currencyCode="VND" type="currency" maxFractionDigits="0" />
				</p>
				<p class="form-info__desc">Chưa có thông tin.</p>
				<img class="form-info__like" alt="heart" src="${ pageContext.request.contextPath }/images/heart.png">
				<div class="form-info__action">
					<button type="button" id="increase" class="form-action__handle form-action__handle--blue form-action__handle--circle">+</button>
					<input id="quantity" class="form-action__quantity" type="text" value="1" name="quantity" readonly>
					<button type="button" id="decrease" class="form-action__handle form-action__handle--blue form-action__handle--circle">-</button>
					<button class="form-action__handle form-action__handle--long">MUA NGAY</button>
				</div>
			</div>
		</div>

		<div class="product-form-option">
			<div class="option__size">
				<h3 class="size__heading">Chọn size</h3>
				<div class="size__list-sizes">
					<c:forEach var="size" items="${ sizes }">
						<div class="size__select">
							<input id="size-${ size.id }" class="select__radio" type="radio" value="${ size.id }" name="name" checked />
							<label class="select__text" for="size-${ size.id }">${ size.name }</label>
						</div>
					</c:forEach>
					
				</div>
			</div>
			<div class="option__sugar">
				<h3 class="sugar__heading">Chọn đường</h3>
				<div class="sugar__list-sugars">
					<c:forEach var="sugar" items="${ sugars }">
						<div class="list__select">
							<input id="sugar-${ sugar.id }" class="select__radio" type="radio" value="${ sugar.id }" name="sugar" checked>
							<label class="select__text" for="sugar-${ sugar.id }">${ sugar.sugarPercent }% đường</label>
						</div>
					</c:forEach>
				</div>
			</div>
			<div class="option__ice">
				<h3 class="ice__headding">Chọn đá</h3>
				<div class="ice__list-ices">
					<c:forEach var="ice" items="${ ices }">
						<div class="list__select">
							<input id="ice-${ ice.id }" class="select__radio" type="radio"
								value="${ ice.id }" name="ice" checked> <label
								class="select__text" for="ice-${ ice.id }">${ ice.icePercent }% đá</label>
						</div>
					</c:forEach>
				</div>
			</div>
			<div class="option__topping">
				<h3 class="topping__heading">Chọn topping</h3>
				<div class="topping__list-toppings">
					<c:forEach var="topping" items="${toppings}">
						<div class="list__select list__select--full-width">
							<input id="topping-${topping.id}" class="select__radio"
								type="checkbox" value="${topping.id}" name="topping">
							<label class="select__text" for="topping-${topping.id}">${topping.name}</label>
							<fmt:formatNumber var="price_topping"
								value="${topping.price}" type="currency" currencyCode="VND"
								maxFractionDigits="0" />
							<label class="select__text2" for="topping-${topping.id}">+${price_topping}</label>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
</form>
<script type="text/javascript" src="${ pageContext.request.contextPath }/js/order.js"></script>