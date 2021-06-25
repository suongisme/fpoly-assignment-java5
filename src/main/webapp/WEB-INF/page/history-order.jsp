<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="context" value="${pageContext.request.contextPath}"/>

<div style="text-align: center; margin-top: 50px">
    <a class="btn" href="${pageContext.request.contextPath}/history">Tất cả</a>
    <a class="btn" href="${pageContext.request.contextPath}/history?today">Hôm nay</a>
</div>
<table>
    <thead>
        <tr>
            <th>
                <a style="color: white; font-size: 1.5rem" href="${context}/history?sort=id&direction=${param.direction eq 'ASC' or param.direction eq null ? 'DESC' : 'ASC'}">Mã hóa đơn</a>
            </th>
            <th>
                <a style="color: white; font-size: 1.5rem"  href="${context}/history?sort=date&direction=${param.direction eq 'ASC' or param.direction eq null ? 'DESC' : 'ASC'}">Ngày</a>
            </th>
            <th>
                Tên sản phẩm
            </th>
            <th>Size</th>
            <th>Topping</th>
            <th>Đá</th>
            <th>Đường</th>
            <th>Số lượng</th>
            <th>Hình thức</th>
            <th>Tổng tiền</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="receipt" items="${histories}">
            <c:set var="index" value="0"/>
            <c:forEach var="item" items="${receipt.items}">
                <c:set var="index" value="${index+1}"/>
                <tr>
                    <c:if test="${index eq 1}">
                        <td rowspan="${receipt.items.size()}">${receipt.id}</td>
                    </c:if>

                    <c:if test="${index eq 1}">
                        <td rowspan="${receipt.items.size()}">${receipt.date}</td>
                    </c:if>
                    <td>${item.product.name}</td>
                    <td>${item.name.name}</td>
                    <td>
                    <c:set var="totalPriceTopping" value="0"/>
                    <c:if test="${item.topping.size() eq 0}">
                        không có topping
                    </c:if>
                    <c:forEach var="tp"  items="${item.topping}">
                        ${tp.name},
                        <c:set var="totalPriceTopping" value="${totalPriceTopping + tp.price}"/>
                    </c:forEach>
                    </td>

                    <td>${item.ice.icePercent}%</td>
                    <td>${item.sugar.sugarPercent}%</td>
                    <td>${item.quantity}</td>
                    <td>Tiền mặt</td>

                    <td>${item.quantity * item.product.price + totalPriceTopping}</td>
                </tr>
            </c:forEach>
            <tr style="height: 5px"/>
        </c:forEach>
    </tbody>
</table>