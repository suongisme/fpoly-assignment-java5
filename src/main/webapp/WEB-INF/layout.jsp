<%--
  Created by IntelliJ IDEA.
  User: me
  Date: 6/13/21
  Time: 7:11 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <c:set var="context" value="${pageContext.request.contextPath}"/>
    <meta charset="UTF-8">

    <title> <tiles:getAsString name="title"/> </title>

    <link rel="icon" href="/images/icon_page.png">

    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Baloo+2:wght@700&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="${ context }/css/_layout.css">
    <link rel="stylesheet" href="${ context }/css/_header.css">
    <link rel="stylesheet" href="${ context }/css/_footer.css">
    <link rel="stylesheet" href="${ context }/<tiles:getAsString name="css"/>">
</head>
<body>

    <div>
        <tiles:insertAttribute name="header"/>
    </div>

    <div style="min-height: 300px">
        <tiles:insertAttribute name="content"/>
    </div>

    <div>
        <tiles:insertAttribute name="footer"/>
    </div>

    <script src="${ context }/js/_header.js"></script>
    <script src="${ context }/js/fontawesome.js"></script>

</body>
</html>
