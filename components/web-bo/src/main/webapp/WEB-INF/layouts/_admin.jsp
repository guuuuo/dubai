<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="sitemesh" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">
<head>
    <title><fmt:message key="application.name"/> &gt;&gt; <sitemesh:title/></title>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <%@ include file="/WEB-INF/layouts/includes/css.jsp"%>
    <sitemesh:head/>
</head>

<body>
<!-- topbar starts -->
<%@ include file="/WEB-INF/layouts/includes/top-nav.jsp"%>
<!-- topbar ends -->

<div id="main-container" class="container-fluid">
    <div class="row-fluid">

        <!-- left menu starts -->
        <%@ include file="/WEB-INF/layouts/includes/left-menu.jsp"%>
        <!-- left menu ends -->

        <div id="content" class="span10">
            <!-- content starts -->
            <noscript>
                <div class="alert alert-block span12">
                    <h4 class="alert-heading">Oops!</h4>
                    <p>You need to have <a href="http://en.wikipedia.org/wiki/JavaScript" target="_blank">JavaScript</a> enabled to use this site.</p>
                </div>
            </noscript>

            <sitemesh:body/>
            <!-- content ends -->
        </div><!--/#content.span10-->

    </div><!--/fluid-row-->
</div><!--/.fluid-container-->

<hr>
<%@ include file="/WEB-INF/layouts/includes/bottom-footer.jsp"%>
<%@ include file="/WEB-INF/layouts/includes/js.jsp"%>
</body>
</html>