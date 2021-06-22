<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<h3 class="menu__heading">Danh Mục</h3>
<ul class="menu__list-categories">
    <c:forEach var="category" items="${categories}">
        <li class="list-categories__category">
            <a class="category__name" href="${pageContext.request.contextPath}/order?category_id=${category.id}&page=1">
                    ${category.getName()}
            </a>
            <a class="category__amount" href="${pageContext.request.contextPath}/order?category_id=${category.id}&page=1">
                    ${ category.products.size() }
            </a>
        </li>
    </c:forEach>
</ul>