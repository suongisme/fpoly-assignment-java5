<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="cart__header">
    <h3 class="header__heading">Giỏ Hàng</h3>
    <a class="header__clean" href="${pageContext.request.contextPath}/cart/clear">xóa tất cả</a>
</div>
<div class="cart__items">
    <c:choose>
        <c:when test="${carts eq null }">
            <p class="items__status">Bạn chưa chọn sản phẩm nào!</p>
        </c:when>
        <c:when test="${carts.size() eq 0}">
            <p class="items__status">Bạn chưa chọn sản phẩm nào!</p>
        </c:when>
        <c:otherwise>
            <c:forEach var="cart" items="${carts}">
                <c:set var="total_money" value="${total_money + cart.product.price * cart.quantity}"/>
                <c:set var="total_amount" value="${total_amount+cart.quantity}"/>
                <div class="items__item">
                    <div class="item__info">
                        <p class="item-info__name">${cart.product.name}</p>
                        <p class="item-info__size">
                            ${cart.name.name}, ${cart.ice.icePercent}% đá, ${cart.sugar.sugarPercent}% Đường
                            <c:forEach var="topping" items="${cart.topping}">
                                ,${topping.name}
                                <c:set var="total_money" value="${total_money + topping.price}"/>
                            </c:forEach>
                        </p>
                        <p class="item-info__price">
                            <fmt:formatNumber var="money"
                                              value="${cart.product.price}"
                                              type="currency"
                                              currencyCode="VND"
                                              maxFractionDigits="0" />

                            <fmt:formatNumber var="total"
                                              value="${cart.product.price * cart.quantity}"
                                              type="currency"
                                              currencyCode="VND"
                                              maxFractionDigits="0"/>
                                ${money} x ${cart.quantity} = ${total}
                        </p>
                    </div>
                    <div class="item__action">
                        <p id="cart__increase" data-id="${cart.product.id}" data-price="${cart.product.price}" class="action__handle action__handle--left" >+</p>
                        <p id="cart__quantity" class="action__quantity">${cart.getQuantity()}</p>
                        <p id="cart__decrease" data-id="${cart.product.id}" data-price="${cart.product.price}" class="action__handle action__handle--right">-</p>
                    </div>
                </div>
            </c:forEach>
        </c:otherwise>
    </c:choose>
</div>
<div class="cart__pay">
    <div class="pay__info">
        <img class="info__img" alt="cup" src="${ pageContext.request.contextPath }/images/cup.png">
        <span class="info__cal">
            x ${total_amount eq null ? 0 : total_amount} = ${total_money eq null ? 0 : total_money}
        </span>
    </div>
    <a class="pay__btn" href="${ pageContext.request.contextPath }/payment">Thanh toán</a>
</div>