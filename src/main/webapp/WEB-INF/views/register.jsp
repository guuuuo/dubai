<%@ page language="java" pageEncoding="UTF-8" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="org.apache.shiro.web.filter.authc.FormAuthenticationFilter"%>
<%@ taglib prefix="page" uri="http://www.opensymphony.com/sitemesh/page" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
            <form id="inputForm" action="${ctx}/register" method="post" class="form-horizontal">
                <fieldset>
                    <legend><small>创建新帐号</small></legend>
                    <%
                        String error = (String) request.getAttribute(FormAuthenticationFilter.DEFAULT_ERROR_KEY_ATTRIBUTE_NAME);
                        if(error != null){
                    %>
                    <div class="alert alert-error">
                        <button class="close" data-dismiss="alert">×</button>Login failed, please retry.
                    </div>
                    <%
                        }
                    %>
                    <div class="control-group">
                        <label for="loginName" class="control-label">用户名</label>
                        <div class="controls">
                            <input type="text" id="loginName" name="loginName" class="input-large required" minlength="6"/>
                        </div>
                    </div>
                    <div class="control-group">
                        <label for="email" class="control-label">电子邮件</label>
                        <div class="controls">
                            <input type="email" id="email" name="email" class="input-large required"/>
                        </div>
                    </div>
                    <div class="control-group">
                        <label for="plainPassword" class="control-label">密码</label>
                        <div class="controls">
                            <input type="password" id="plainPassword" name="plainPassword" class="input-large required"/>
                        </div>
                    </div>
                    <div class="control-group">
                        <label for="confirmPassword" class="control-label">确认密码</label>
                        <div class="controls">
                            <input type="password" id="confirmPassword" name="confirmPassword" class="input-large required" equalTo="#plainPassword"/>
                        </div>
                    </div>
                    <div class="form-actions">
                        <input id="submit_btn" class="btn btn-primary" type="submit" value="提交注册信息"/>
                    </div>
                </fieldset>
            </form>
        </div><!--/span-->
    </div><!--/row-->

    <div class="account-extra">
        已有帐号？ 请 <a href="${ctx}/login">直接登录</a>
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
                        remote: "${ctx}/register/checkLoginName"
                    },
                    email : {
                        required: true,
                        email: true
                    }
                },
                messages: {
                    loginName: {
                        remote: "用户名已存在，请检查后重新输入"
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