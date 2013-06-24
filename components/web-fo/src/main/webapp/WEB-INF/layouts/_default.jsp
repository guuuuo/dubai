<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="sitemesh" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Dubai &gt;&gt; <sitemesh:title/></title>
    <!-- The styles -->
    <link rel="stylesheet" href="${ctx}/assets/vendor/bootstrap/css/bootstrap.css">
    <link rel='stylesheet' href='${ctx}/assets/css/vendor/uniform.default.css'>
    <link rel='stylesheet' href='${ctx}/assets/vendor/jquery-validation/validate.css'>
    <link rel='stylesheet' href='${ctx}/assets/css/main.css'>
    <style type="text/css">
        body {
            background-color: #f5f5f5;
        }

        .account-header {
            padding-top: 40px;
            height: 100px;
        }

        .account-box {
            padding: 19px 29px 29px;
            background-color: #fff;
            border: 1px solid #e5e5e5;
            -webkit-border-radius: 5px;
            -moz-border-radius: 5px;
            border-radius: 5px;
            -webkit-box-shadow: 0 1px 2px rgba(0,0,0,.05);
            -moz-box-shadow: 0 1px 2px rgba(0,0,0,.05);
            box-shadow: 0 1px 2px rgba(0,0,0,.05);
        }

        .account-extra {
            display: block;
            line-height: 19px;
            margin: 1.5em auto;
            text-align: center;
            text-shadow: 1px 1px 0 #FFFFFF;
            width: 300px;
        }
    </style>

    <!-- The HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

    <!-- The fav icon -->
    <link rel="shortcut icon" href="${ctx}/assets/img/favicon.ico">

    <sitemesh:head/>
</head>

<body>

<div class="container-fluid">
    <div class="row-fluid ">

        <sitemesh:body/>

    </div><!--/fluid-row-->

</div><!--/.fluid-container-->

</body>
</html>