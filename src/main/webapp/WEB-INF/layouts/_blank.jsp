<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="sitemesh" uri="http://www.opensymphony.com/sitemesh/decorator" %>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">
<html>
<head>
    <title>Dubai &gt;&gt;<sitemesh:title/></title>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <%@ include file="/WEB-INF/layouts/includes/css.jsp"%>
    <sitemesh:head/>
</head>

<body>
    <sitemesh:body/>
    <%@ include file="/WEB-INF/layouts/includes/js.jsp"%>
</body>
</html>