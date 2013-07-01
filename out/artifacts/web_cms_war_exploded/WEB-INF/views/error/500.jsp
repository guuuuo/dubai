<%@ page contentType="text/html;charset=UTF-8" isErrorPage="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="org.slf4j.Logger,org.slf4j.LoggerFactory" %>
<% response.setStatus(HttpServletResponse.SC_OK); %>

<%
    Throwable ex = null;
    if (exception != null)
        ex = exception;
    if (request.getAttribute("javax.servlet.error.exception") != null)
        ex = (Throwable) request.getAttribute("javax.servlet.error.exception");

    //记录日志
    Logger logger = LoggerFactory.getLogger("500.jsp");
    logger.error(ex.getMessage(), ex);
%>

<!DOCTYPE html>
<html>
<head>
    <title>500 - 系统内部错误</title>
</head>

<body>
<h2>500 - 系统发生内部错误.</h2>
<hr/>
<div>错误状态代码：${pageContext.errorData.statusCode}</div>
<div>错误发生页面：${pageContext.errorData.requestURI}</div>
<div>错误信息：<br/>
    <b>${pageContext.exception}</b><br/>
    <div style="margin-left: 30px;">
        <c:forEach var="trace" items="${pageContext.exception.stackTrace}">
            ${trace}<br/>
        </c:forEach>
    </div>
</div>

<p><a href="<c:url value="/"/>">返回首页</a></p>
</body>
</html>
