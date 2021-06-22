<%--
  Created by IntelliJ IDEA.
  User: me
  Date: 6/19/21
  Time: 11:47 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Dashboard">
    <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">

    <title>ADMIN-LOGIN</title>

    <link href="${pageContext.request.contextPath}/assets/css/bootstrap.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/font-awesome/css/font-awesome.css" rel="stylesheet" />

    <link href="${pageContext.request.contextPath}/assets/css/style.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/css/style-responsive.css" rel="stylesheet">

    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
</head>

<body>
<div id="login-page">
    <div class="container">

        <form:form class="form-login" action="${pageContext.request.contextPath}/admin/login" method="post" modelAttribute="userLoginForm">
            <h2 class="form-login-heading">sign in now</h2>
            <div class="login-wrap">
                <form:input path="username" class="form-control" placeholder="User ID" />
                <form:errors path="username"/>
                <br>
                <form:password path="password" class="form-control" placeholder="Password"/>
                <form:errors path="password"/>
                <label class="checkbox">
		                <span class="pull-right">
		                    <a data-toggle="modal" href="login.html#myModal"> Forgot Password?</a>

		                </span>
                </label>
                <button class="btn btn-theme btn-block" href="index.html" type="submit"><i class="fa fa-lock"></i> SIGN IN</button>
                <hr>

                <div class="login-social-link centered">
                    <p>or you can sign in via your social network</p>
                    <button class="btn btn-facebook" type="submit"><i class="fa fa-facebook"></i> Facebook</button>
                    <button class="btn btn-twitter" type="submit"><i class="fa fa-twitter"></i> Twitter</button>
                </div>
                <div class="registration">
                    Don't have an account yet?<br/>
                    <a class="" href="#">
                        Create an account
                    </a>
                </div>

            </div>

            <!-- Modal -->
            <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="myModal" class="modal fade">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            <h4 class="modal-title">Forgot Password ?</h4>
                        </div>
                        <div class="modal-body">
                            <p>Enter your e-mail address below to reset your password.</p>
                            <input type="text" name="email" placeholder="Email" autocomplete="off" class="form-control placeholder-no-fix">

                        </div>
                        <div class="modal-footer">
                            <button data-dismiss="modal" class="btn btn-default" type="button">Cancel</button>
                            <button class="btn btn-theme" type="button">Submit</button>
                        </div>
                    </div>
                </div>
            </div>
        </form:form>

    </div>
</div>

<script src="${pageContext.request.contextPath}/assets/js/jquery.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>

<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery.backstretch.min.js"></script>
<script>
    $.backstretch("${pageContext.request.contextPath}/assets/img/login-bg.jpg", {speed: 500});
</script>


</body>
</html>
