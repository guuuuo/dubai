<%@ page language="java" pageEncoding="UTF-8" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="org.apache.shiro.web.filter.authc.FormAuthenticationFilter"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>重置密码</title>
</head>

<body>

    <div class="row-fluid">
        <div class="span12 account-header">
            <h2></h2>
        </div><!--/span-->
    </div><!--/row-->

    <div class="row-fluid">
        <div class="span6 account-box" style="margin: 0 auto; float:none;">
            <form id="inputForm" action="${ctx}/forgot-password" method="post" class="form-horizontal">
                <fieldset>
                    <legend><small>请查收邮件</small></legend>
                    请查收邮件
            </form>
        </div><!--/span-->
    </div><!--/row-->

    <div class="account-extra">
        没有帐号？ <a href="${ctx}/register">创建新帐号</a><br>
        已有帐号？ 请 <a href="${ctx}/login">直接登录</a>
    </div>

    <!-- *** JavaScript *** -->
    <%@ include file="/WEB-INF/layouts/includes/js.jsp"%>
    <script type="text/javascript">
        $(document).ready(function() {
            $("#loginName").focus();
        });
    </script>
</body>
</html>