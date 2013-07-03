<%@ page language="java" pageEncoding="UTF-8" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
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
            <form:form id="inputForm" modelAttribute="forgotPasswordForm" action="${ctx}/passport/forgot-password" method="post" cssClass="form-horizontal">
                <fieldset>
                    <legend><small>请输入用户名/电子邮件，重置密码</small></legend>
                    <tags:error />
                    <div class="control-group">
                        <form:label path="loginName" for="loginName" cssClass="control-label"><fmt:message key="system.user.loginName" /></form:label>
                        <div class="controls">
                            <form:input path="loginName" id="loginName" cssClass="input-large" />
                        </div>
                    </div>
                    <div class="control-group">
                        <form:label path="email" for="email" cssClass="control-label">或者 <fmt:message key="system.user.email" /></form:label>
                        <div class="controls">
                            <form:input path="email" id="email" cssClass="input-large" />
                        </div>
                    </div>

                    <div class="control-group">
                        <form:label path="captcha" for="captcha" cssClass="control-label">验证码</form:label>
                        <div class="controls">
                            <form:input path="captcha" id="captcha" cssClass="input-small required" />
                            &nbsp;&nbsp;
                            <img id="captchaImg" src="${ctx}/captcha" />
                            &nbsp;&nbsp;
                            <a href="javascript:void(0);" onclick="javascript:utils.reloadCaptcha('${ctx}');">看不清？</a>
                        </div>
                    </div>
                    <div class="form-actions">
                        <input id="submit_btn" class="btn btn-primary" type="submit" value="重置密码"/>
                    </div>
                </fieldset>
            </form:form>
        </div><!--/span-->
    </div><!--/row-->

    <div class="account-extra">
        没有帐号？ <a href="${ctx}/passport/register">创建新帐号</a><br>
        已有帐号？ 请 <a href="${ctx}/passport/login">直接登录</a>
    </div>
</body>
</html>