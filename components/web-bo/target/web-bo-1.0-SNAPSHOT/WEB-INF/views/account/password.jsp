<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
	<title>帐号信息</title>
</head>

<body>
    <c:if test="${not empty message}">
        <div id="message" class="alert alert-success"><button data-dismiss="alert" class="close">×</button>${message}</div>
    </c:if>

    <div class="row-fluid">
        <div class="box span12">
            <div class="box-header well" data-original-title>
                <h2><i class="icon-edit"></i> 设置</h2>
            </div>
            <div class="box-content">
                <div class="tabbable">
                    <ul class="nav nav-tabs">
                        <li class=""><a href="${ctx}/account/settings/profile">个人资料</a></li>
                        <li class="active"><a href="${ctx}/account/settings/password">更改密码</a></li>
                    </ul>
                    <form id="form_update_password" action="${ctx}/account/settings/password" method="post" class="form-horizontal">
                        <input type="hidden" name="id" value="${user.id}"/>
                        <fieldset>
                            <div class="control-group">
                                <label for="plainPassword" class="control-label">当前密码</label>
                                <div class="controls">
                                    <input type="password" id="password" name="password" class="input-large" placeholder="...Leave it blank if no change"/>
                                </div>
                            </div>
                            <div class="control-group">
                                <label for="plainPassword" class="control-label">新密码</label>
                                <div class="controls">
                                    <input type="password" id="plainPassword" name="plainPassword" class="input-large" placeholder="...Leave it blank if no change"/>
                                </div>
                            </div>
                            <div class="control-group">
                                <label for="confirmPassword" class="control-label">确认新密码</label>
                                <div class="controls">
                                    <input type="password" id="confirmPassword" name="confirmPassword" class="input-large" equalTo="#plainPassword" />
                                </div>
                            </div>

                            <div class="form-actions">
                                <button class="btn btn-primary" type="submit">修改密码</button>&nbsp;<button class="btn">取消</button>
                            </div>

                        </fieldset>
                    </form>
                </div><!-- /tab -->
            </div><!--/box-content-->
        </div><!--/span-->
    </div><!--/row-->
</body>
</html>
