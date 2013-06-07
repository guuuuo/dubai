<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<html>
<head>
	<title>帐号信息</title>
	
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
                <h2><i class="icon-edit"></i> 帐号信息</h2>
            </div>
            <div class="box-content">
                <div class="tabbable">
                    <ul class="nav nav-tabs">
                        <li class="active">
                            <a data-toggle="tab" href="#profile">个人资料与安全</a>
                        </li>
                        <li class=""><a data-toggle="tab" href="#settings">设置</a></li>
                    </ul>
                    <div class="tab-content">
                        <div id="profile" class="tab-pane active">
                            <form id="inputForm" action="${ctx}/account/profile" method="post" class="form-horizontal">
                                <input type="hidden" name="id" value="${user.id}"/>
                                <fieldset>
                                    <div class="control-group">
                                        <label for="loginName" class="control-label">用户名:</label>
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
                                        <label for="confirmPassword" class="control-label">电子邮件:</label>
                                        <div class="controls">
                                            <input type="text" id="email" name="email" class="input-large" value="${user.email}" />
                                        </div>
                                    </div>
                                    <br/>
                                    <br/>
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
                                    <br/>
                                    <div class="form-actions">
                                        <input id="submit_btn" class="btn btn-primary" type="submit" value="提交"/>&nbsp;
                                        <input id="cancel_btn" class="btn" type="button" value="返回" onclick="history.back()"/>
                                    </div>
                                </fieldset>
                            </form>
                        </div>

                        <div id="settings" class="tab-pane">
                            <form class="form-horizontal" id="edit-profile2">
                                <fieldset>


                                    <div class="control-group">
                                        <label for="accounttype" class="control-label">Account Type</label>
                                        <div class="controls">
                                            <label class="radio">
                                                <input type="radio" id="accounttype" checked="checked" value="option1" name="accounttype">
                                                POP3
                                            </label>
                                            <label class="radio">
                                                <input type="radio" value="option2" name="accounttype">
                                                IMAP
                                            </label>
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label for="accountusername" class="control-label">Account Username</label>
                                        <div class="controls">
                                            <input type="text" value="rod.howard@example.com" id="accountusername" class="input-large">
                                            <p class="help-block">Leave blank to use your profile email address.</p>
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label for="emailserver" class="control-label">Email Server</label>
                                        <div class="controls">
                                            <input type="text" value="mail.example.com" id="emailserver" class="input-large">
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label for="accountpassword" class="control-label">Password</label>
                                        <div class="controls">
                                            <input type="text" value="password" id="accountpassword" class="input-large">
                                        </div>
                                    </div>




                                    <div class="control-group">
                                        <label for="accountadvanced" class="control-label">Advanced Settings</label>
                                        <div class="controls">
                                            <label class="checkbox">
                                                <input type="checkbox" id="accountadvanced" checked="checked" value="option1" name="accountadvanced">
                                                User encrypted connection when accessing this server
                                            </label>
                                            <label class="checkbox">
                                                <input type="checkbox" value="option2" name="accounttype">
                                                Download all message on connection
                                            </label>
                                        </div>
                                    </div>


                                    <br>

                                    <div class="form-actions">
                                        <button class="btn btn-primary" type="submit">Save</button> <button class="btn">Cancel</button>
                                    </div>
                                </fieldset>
                            </form>
                        </div>

                </div>

            </div><!--/box-content-->
        </div><!--/span-->
    </div><!--/row-->
</body>
</html>
