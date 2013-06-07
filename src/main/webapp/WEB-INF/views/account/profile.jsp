<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<html>
<head>
	<title>资料修改</title>
	
	<script>
		$(document).ready(function() {
			//聚焦第一个输入框
			$("#name").focus();
			//为inputForm注册validate函数
			$("#inputForm").validate();
		});
	</script>
</head>

<body>
    <div class="row-fluid sortable">
        <div class="box span12">
            <div class="box-header well" data-original-title>
                <h2><i class="icon-edit"></i> Profile</h2>
            </div>
            <div class="box-content">

                <form id="inputForm" action="${ctx}/profile" method="post" class="form-horizontal">
                    <input type="hidden" name="id" value="${user.id}"/>
                    <fieldset>
                        <div class="control-group">
                            <label for="loginName" class="control-label">登录名:</label>
                            <div class="controls">
                                <input type="text" disabled="disabled" id="loginName" name="loginName" value="${user.loginName}" class="input-large required"/>
                            </div>
                        </div>
                        <div class="control-group">
                            <label for="niceName" class="control-label">昵称:</label>
                            <div class="controls">
                                <input type="text" id="niceName" name="niceName" value="${user.niceName}" class="input-large required"/>
                            </div>
                        </div>
                        <div class="control-group">
                            <label for="plainPassword" class="control-label">密码:</label>
                            <div class="controls">
                                <input type="password" id="plainPassword" name="plainPassword" class="input-large" placeholder="...Leave it blank if no change"/>
                            </div>
                        </div>
                        <div class="control-group">
                            <label for="confirmPassword" class="control-label">确认密码:</label>
                            <div class="controls">
                                <input type="password" id="confirmPassword" name="confirmPassword" class="input-large" equalTo="#plainPassword" />
                            </div>
                        </div>
                        <div class="form-actions">
                            <input id="submit_btn" class="btn btn-primary" type="submit" value="提交"/>&nbsp;
                            <input id="cancel_btn" class="btn" type="button" value="返回" onclick="history.back()"/>
                        </div>
                    </fieldset>
                </form>

            </div><!--/box-content-->
        </div><!--/span-->
    </div><!--/row-->
</body>
</html>
