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
                    <legend><small>请输入用户名/电子邮件，重置密码</small></legend>
                    <%
                        String error = (String) request.getAttribute(FormAuthenticationFilter.DEFAULT_ERROR_KEY_ATTRIBUTE_NAME);
                        if(error != null){
                    %>
                    <div class="alert alert-error">
                        <button class="close" data-dismiss="alert">×</button>用户名或密码错误，请重试！
                    </div>
                    <%
                        }
                    %>
                    <div class="control-group">
                        <label for="loginName" class="control-label">用户名</label>
                        <div class="controls">
                            <input type="text" id="loginName" name="loginName" class="input-large" minlength="6"/>
                        </div>
                    </div>
                    <div class="control-group">
                        <label for="email" class="control-label">或者 电子邮件</label>
                        <div class="controls">
                            <input type="email" id="email" name="email" class="input-large"/>
                        </div>
                    </div>
                    <div class="form-actions">
                        <input id="submit_btn" class="btn btn-primary" type="submit" value="重置密码"/>
                    </div>
                </fieldset>
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