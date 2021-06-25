<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:forEach var="page" items="${pages}">

    <a href="${pageContext.request.contextPath}/order?category_id=${param.category_id}&page=${page}"
       class="pagination">
        ${page}
    </a>

</c:forEach>