<%@ page language="java" pageEncoding="UTF-8" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="org.apache.shiro.web.filter.authc.FormAuthenticationFilter"%>
<%@ page import="org.apache.shiro.authc.AuthenticationException" %>
<%@ page import="org.apache.shiro.authc.UnknownAccountException" %>
<%@ page import="org.apache.shiro.authc.IncorrectCredentialsException" %>
<%@ page import="com.emix.core.exception.IncorrectCaptchaException" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>登录</title>
</head>

<body>

    <div class="row-fluid">
        <div class="span12 account-header">
            <h2></h2>
        </div><!--/span-->
    </div><!--/row-->

    <div class="row-fluid">
        <div class="span6 account-box" style="margin: 0 auto; float:none;">
            <form id="inputForm" action="${ctx}/passport/login" method="post" class="form-horizontal">
                <fieldset>
                    <legend><small>登录</small></legend>
                    <%
                        String expMsg = "";
                        Object errorObject = request.getAttribute(FormAuthenticationFilter.DEFAULT_ERROR_KEY_ATTRIBUTE_NAME);
                        if (errorObject != null) {
                            AuthenticationException authExp = (AuthenticationException) errorObject;
                            if (authExp instanceof UnknownAccountException ||
                                    authExp instanceof IncorrectCredentialsException) {
                                expMsg = "用户名或密码错误！";
                            } else if (authExp instanceof IncorrectCaptchaException) {
                                expMsg = "验证码错误！";
                            } else {
                                expMsg = "登录异常 :" + authExp.getMessage();
                            }
                    %>
                    <div class="alert alert-error">
                        <button class="close" data-dismiss="alert">×</button>
                        <%=expMsg%>
                    </div>
                    <%
                        }
                    %>
                    <div class="control-group">
                        <label for="username" class="control-label">用户名</label>
                        <div class="controls">
                            <input type="text" id="username" name="username" class="input-large required" value="${username}"/>
                        </div>
                    </div>
                    <div class="control-group">
                        <label for="password" class="control-label">密码</label>
                        <div class="controls">
                            <input type="password" id="password" name="password" class="input-large required"/>
                        </div>
                    </div>
                    <div class="control-group">
                        <label for="captcha" class="control-label">验证码</label>
                        <div class="controls">
                            <input type="text"class="input-small required" id="captcha" name="captcha" />
                            &nbsp;&nbsp;
                            <img id="captchaImg" src="${ctx}/captcha" />
                            &nbsp;&nbsp;
                            <a href="javascript:void(0);" onclick="javascript:utils.reloadCaptcha('${ctx}');">看不清？</a>
                        </div>
                    </div>
                    <div class="control-group">
                        <div class="controls">
                            <label for="rememberMe"><input type="checkbox" id="rememberMe" name="rememberMe" />记住我的登录信息</label>
                        </div>
                    </div>

                    <div class="form-actions">
                        <input id="submit_btn" class="btn btn-primary" type="submit" value="登录"/>
                        &nbsp;<a href="${ctx}/passport/register">创建新帐号</a>
                        &nbsp;<a href="${ctx}/passport/forgot-password">忘记密码？</a>
                    </div>
                </fieldset>
            </form>
        </div><!--/span-->
    </div><!--/row-->

    <div class="account-extra">
    </div>

    <!-- *** JavaScript *** -->
    <%@ include file="/WEB-INF/layouts/includes/js.jsp"%>
    <script type="text/javascript">
        $(document).ready(function() {
            $("#username").focus();
            $("#inputForm").validate({
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