<%--
  Created by IntelliJ IDEA.
  User: me
  Date: 6/17/21
  Time: 3:22 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>


<html>
<head>
    <title>Đặt hàng</title>

    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Baloo+2:wght@700&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/order.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/order_form.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/_loader.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/pagination.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/notify.css">

</head>
<body>

    <tiles:insertAttribute name="notify"/>

    <div class="header">
        <tiles:insertAttribute name="order-header"/>
    </div>

    <div class="body">
        <div class="body__menu">
            <tiles:insertAttribute name="order-menu"/>
        </div>

        <div class="body__products">
            <tiles:insertAttribute name="order-products"/>
            <div class="body__pagination">
                <tiles:insertAttribute name="order-pagination"/>
            </div>
        </div>

        <div class="body__cart">
            <tiles:insertAttribute name="order-cart"/>
        </div>

    </div>

    <div class="loader" style="display: none; position: relative">
        <div class="background"
             style="background: black;
                    opacity: .5;
                    width: 100%;
                    height: 100vh;
                    position: fixed;
                    top: 0;
                    z-index: 3;">

        </div>
        <tiles:insertAttribute name="loader"/>
    </div>

    <div>
        <tiles:insertAttribute name="order-form"/>
    </div>

    <script src="${pageContext.request.contextPath}/js/order-form.js"></script>
    <script src="${pageContext.request.contextPath}/js/notify.js"></script>
</body>
</html>
