<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%response.setStatus(200);%>

<!DOCTYPE html>
<html>
<head>
	<title>403 - Permission denied</title>
</head>

<body>
	<h2>403 - Permission denied.</h2>
	<p><a href="<c:url value="/"/>">返回首页</a></p>
</body>
</html>