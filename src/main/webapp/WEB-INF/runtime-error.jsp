<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Oops</title>
    <link rel="icon" href="${ pageContext.request.contextPath }/image/not-found-icon-24.jpg">
</head>
<body>

<div style="text-align: center;margin-top: 50px;">
    <p style="font-size: 3rem;font-weight: bold;margin: 20px 0;">Oops! Wrong</p>
    <p style="font-family: arial;">${error.message}</p>
    <a style="text-decoration: none;background: blue;width: 103px;margin: auto;padding: 10px;color: white;font-weight: bold;" href="${ pageContext.request.contextPath }/home">Go home</a>
</div>

</body>
</html>