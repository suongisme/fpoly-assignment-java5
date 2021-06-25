<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<h3 class="products__heading">Sản Phẩm: ${category.name}</h3>
<div class="products__list-products">

	<c:choose>
		<c:when test="${products.size() eq null or products.size() eq 0}">
			<h1 style="font-size: 1.5rem; margin-left: 20px">Không có sản phẩm nào!</h1>
		</c:when>
		<c:otherwise>
			<c:forEach var="product" items="${products}">
				<div class="list-products__product">
					<img class="product__img" src="${ pageContext.request.contextPath }/${product.image}" alt="${product.name}">
					<div>
						<div class="product__info">
							<p class="info__name">${product.name}</p>
							<p class="info__price">
								<fmt:formatNumber
										value="${product.getPrice()}"
										maxFractionDigits="0"
										currencyCode="VND" type="currency" />
							</p>
						</div>
						<a class="product__btn" href="${pageContext.request.contextPath}/order?product_id=${product.id}&category_id=${product.category.id}">+</a>
					</div>
				</div>
			</c:forEach>
		</c:otherwise>
	</c:choose>

</div>






