<%@ page language="java" pageEncoding="UTF-8" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="page" uri="http://www.opensymphony.com/sitemesh/page" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>创建新帐号</title>
</head>

<body>

    <div class="row-fluid">
        <div class="span12 account-header">
            <h2></h2>
        </div><!--/span-->
    </div><!--/row-->

    <div class="row-fluid">
        <div class="span6 account-box" style="margin: 0 auto; float:none;">
            <form:form id="inputForm" modelAttribute="userForm" action="${ctx}/passport/register" method="post" cssClass="form-horizontal">
                <fieldset>
                    <legend><small>创建新帐号</small></legend>
                    <tags:error />
                    <div class="control-group">
                        <label for="loginName" class="control-label">用户名</label>
                        <div class="controls">
                            <form:input path="user.loginName" id="loginName" cssClass="input-large required" minlength="6"/>
                        </div>
                    </div>
                    <div class="control-group">
                        <label for="email" class="control-label">电子邮件</label>
                        <div class="controls">
                            <form:input path="user.email" id="email" class="input-large required"/>
                        </div>
                    </div>
                    <div class="control-group">
                        <label for="plainPassword" class="control-label">密码</label>
                        <div class="controls">
                            <form:password path="plainPassword" id="plainPassword" cssClass="input-large required"/>
                        </div>
                    </div>
                    <div class="control-group">
                        <label for="confirmPassword" class="control-label">确认密码</label>
                        <div class="controls">
                            <form:password path="confirmPassword" id="confirmPassword" cssClass="input-large required" equalTo="#plainPassword"/>
                        </div>
                    </div>
                    <div class="control-group">
                        <label for="captcha" class="control-label">验证码</label>
                        <div class="controls">
                            <form:input path="captcha" id="captcha" cssClass="input-small required"/>
                            &nbsp;&nbsp;
                            <img id="captchaImg" src="${ctx}/captcha" />
                            &nbsp;&nbsp;
                            <a href="javascript:void(0);" onclick="javascript:utils.reloadCaptcha('${ctx}');">看不清？</a>
                        </div>
                    </div>
                    <div class="form-actions">
                        <input id="submit_btn" class="btn btn-primary" type="submit" value="提交注册信息"/>
                        &nbsp;<a href="${ctx}/passport/login">已有帐号登录</a>
                    </div>
                </fieldset>
            </form:form>
        </div><!--/span-->
    </div><!--/row-->

    <div class="account-extra">
    </div>

    <!-- *** JavaScript *** -->
    <%@ include file="/WEB-INF/layouts/includes/js.jsp"%>
    <script type="text/javascript">
        $(document).ready(function() {
            //聚焦第一个输入框
            $("#loginName").focus();
            //为inputForm注册validate函数
            $("#inputForm").validate({
                rules: {
                    loginName: {
                        remote: "${ctx}/passport/register/validateLoginName"
                    },
                    email : {
                        required: true,
                        email: true,
                        remote: "${ctx}/passport/register/validateEmail"
                    },
                    captcha : {
                        remote: "${ctx}/passport/register/validateCaptcha"
                    }
                },
                messages: {
                    loginName: {
                        remote: "用户名已存在"
                    },
                    email : {
                        email : "格式错误",
                        remote: "电子邮件已存在"
                    },
                    captcha : {
                        remote: "验证码输入错误"
                    }
                },
                highlight: function(element) {
                    $(element).closest('.control-group').removeClass('success').addClass('error');
                },
                success: function(element) {
                    element.text('').addClass('valid').closest('.control-group').removeClass('error').addClass('success');
                }
            });
        });
    </script>

</body>
</html>