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
                        <li class="active"><a href="${ctx}/account/settings/profile">个人资料</a></li>
                        <li class=""><a href="${ctx}/account/settings/password">更改密码</a></li>
                    </ul>

                    <form id="inputForm" action="${ctx}/account/settings/profile" method="post" class="form-horizontal">
                        <input type="hidden" name="id" value="${user.id}"/>
                        <fieldset>
                            <div class="control-group">
                                <label class="control-label">用户名</label>
                                <div class="controls" style="padding-top: 5px;">
                                    ${user.loginName}
                                </div>
                            </div>
                            <div class="control-group">
                                <label for="niceName" class="control-label">昵称</label>
                                <div class="controls">
                                    <input type="text" id="niceName" name="niceName" value="${user.niceName}" class="input-large required"/>
                                </div>
                            </div>
                            <div class="control-group">
                                <label for="email" class="control-label">电子邮件</label>
                                <div class="controls">
                                    <input type="text" id="email" name="email" class="string optional span4" value="${user.email}" />
                                </div>
                            </div>
                            <div class="control-group">
                                <label for="website" class="control-label">个人网站</label>
                                <div class="controls">
                                    <input type="text" id="website" name="desc" class="string optional span4"/>
                                </div>
                            </div>
                            <div class="control-group">
                                <label for="desc" class="control-label">个人简介</label>
                                <div class="controls">
                                    <textarea id="desc" name="desc" class="cleditor text optional span4" rows="5" cols="40"></textarea>
                                </div>
                            </div>

                            <div class="form-actions">
                                <input id="submit_btn" class="btn btn-primary" type="submit" value="保存设置"/>&nbsp;
                                <input id="cancel_btn" class="btn" type="button" value="返回" onclick="history.back()"/>
                            </div>
                        </fieldset>
                    </form>

                </div><!-- /tab -->
            </div><!--/box-content-->
        </div><!--/span-->
    </div><!--/row-->
</body>
</html>
