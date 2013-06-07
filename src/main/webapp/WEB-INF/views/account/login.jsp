<%@ page language="java" pageEncoding="UTF-8" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="org.apache.shiro.web.filter.authc.FormAuthenticationFilter"%>
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
            <form id="inputForm" action="${ctx}/account/login" method="post" class="form-horizontal">
                <fieldset>
                    <legend><small>登录</small></legend>
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
                        <label for="username" class="control-label">登录名:</label>
                        <div class="controls">
                            <input type="text" id="username" name="username" class="input-large required" value="${username}"/>
                        </div>
                    </div>
                    <div class="control-group">
                        <label for="password" class="control-label">密码:</label>
                        <div class="controls">
                            <input type="password" id="password" name="password" class="input-large required"/>
                        </div>
                    </div>
                    <div class="form-actions">
                        <input id="submit_btn" class="btn btn-primary" type="submit" value="登录"/>&nbsp;
                        <input id="cancel_btn" class="btn" type="button" value="取消" onclick="history.back()"/>
                    </div>
                </fieldset>
            </form>
        </div><!--/span-->
    </div><!--/row-->

    <div class="account-extra">
        没有帐号？ <a href="${ctx}/account/register">创建新帐号</a><br>
        忘记登录密码？ <a href="${ctx}/account/reset-password">申请重置密码</a>
    </div>

</body>
</html>