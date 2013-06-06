<%@ page language="java" pageEncoding="UTF-8" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="org.apache.shiro.web.filter.authc.FormAuthenticationFilter"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Dubai >> Login</title>
    <!-- The styles -->
    <link rel="stylesheet" href="/assets/vendor/bootstrap/css/bootstrap-cerulean.css">
    <link rel='stylesheet' href='/assets/css/vendor/uniform.default.css'>
    <style type="text/css">
        body {
            background-color: #f5f5f5;
        }

        div.center, p.center {
            margin-left: auto !important;
            margin-right: auto !important;
            float: none !important;
            display: block;
            text-align: center;
        }

        .login-header {
            padding-top: 40px;
            height: 120px;
        }

        .login-box {
            padding: 19px 29px 29px;
            margin: 0 auto 20px;
            background-color: #fff;
            border: 1px solid #e5e5e5;
            -webkit-border-radius: 5px;
            -moz-border-radius: 5px;
            border-radius: 5px;
            -webkit-box-shadow: 0 1px 2px rgba(0,0,0,.05);
            -moz-box-shadow: 0 1px 2px rgba(0,0,0,.05);
            box-shadow: 0 1px 2px rgba(0,0,0,.05);
        }

        .login-box .input-prepend, .login-box .checkbox {
            margin-bottom: 10px;
        }

        .login-box .btn {
            margin-top: 15px;
            width: 100%
        }
    </style>

    <!-- The HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

    <!-- The fav icon -->
    <link rel="shortcut icon" href="/assets/img/favicon.ico">
</head>

<body>
    <div class="container-fluid">
        <div class="row-fluid">

            <div class="row-fluid">
                <div class="span12 center login-header">
                    <h2>Welcome to Dubai</h2>
                </div><!--/span-->
            </div><!--/row-->

            <div class="row-fluid">
                <div class="well span5 center login-box">
                    <%
                        String error = (String) request.getAttribute(FormAuthenticationFilter.DEFAULT_ERROR_KEY_ATTRIBUTE_NAME);
                        if(error != null){
                    %>
                        <div class="alert alert-error controls">
                            <button class="close" data-dismiss="alert">×</button>Login failed, please retry.
                        </div>
                    <%
                        }
                    %>
                    <div class="alert alert-info">
                        Please login with your Username and Password.
                    </div>
                    <form id="loginForm" action="${ctx}/login" method="post" class="form-horizontal">
                        <fieldset>
                            <div class="input-prepend" title="Username" data-rel="tooltip">
                                <span class="add-on"><i class="icon-user"></i></span><input autofocus class="input-large span10 required" name="username" id="username" type="text" value="${username}" />
                            </div>
                            <div class="clearfix"></div>

                            <div class="input-prepend" title="Password" data-rel="tooltip">
                                <span class="add-on"><i class="icon-lock"></i></span><input class="input-large span10 required" name="password" id="password" type="password" />
                            </div>
                            <div class="clearfix"></div>

                            <div class="input-prepend checkbox">
                                <label class="remember" for="rememberMe"><input type="checkbox" id="rememberMe" name="rememberMe" />Remember me</label>
                            </div>
                            <div class="clearfix"></div>

                            <p class="center span5">
                                <button type="submit" class="btn btn-large btn-primary">Login</button>
                            </p>
                        </fieldset>
                    </form>
                </div><!--/span-->
            </div><!--/row-->
        </div><!--/fluid-row-->

    </div><!--/.fluid-container-->

    <!-- Placed at the end of the document so the pages load faster -->
    <!-- jQuery -->
    <script src="/assets/js/vendor/jquery-1.7.2.min.js"></script>
    <!-- Bootstrap -->
    <script src="/assets/vendor/bootstrap/js/bootstrap.js"></script>
    <!-- checkbox, radio, and file input styler -->
    <script src="/assets/js/vendor/jquery.uniform.min.js"></script>
    <!-- application script -->
    <script src="/assets/js/main.js"></script>
</body>
</html>