<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<html>
<head>
	<title>用户管理</title>
</head>

<body>

<div class="row-fluid sortable">
    <div class="box span12">
        <div class="box-header well" data-original-title>
            <h2><i class="icon-edit"></i> User Detail</h2>
        </div>
        <div class="box-content">

            <form id="inputForm" action="${ctx}/admin/user/${action}" method="post" class="form-horizontal">
                <input type="hidden" name="id" value="${user.id}"/>
                <fieldset>
                    <div class="control-group">
                        <label class="control-label">登录名</label>
                        <div class="controls">
                            <input type="text" id="loginName" name="loginName" value="${user.loginName}" class="input-large" <c:if test="${action == 'update'}">disabled=""</c:if>/>
                        </div>
                    </div>

                    <div class="control-group">
                        <label class="control-label">昵称</label>
                        <div class="controls">
                            <input type="text" id="niceName" name="niceName" value="${user.niceName}" class="input-large required"/>
                        </div>
                    </div>

                    <div class="control-group">
                        <label for="plainPassword" class="control-label">密码</label>
                        <div class="controls">
                            <input type="password" id="plainPassword" name="plainPassword" class="input-large" placeholder="...Leave it blank if no change"/>
                        </div>
                    </div>

                    <div class="control-group">
                        <label for="confirmPassword" class="control-label">确认密码</label>
                        <div class="controls">
                            <input type="password" id="confirmPassword" name="confirmPassword" class="input-large" equalTo="#plainPassword" />
                        </div>
                    </div>

                    <div class="control-group">
                        <label for="confirmPassword" class="control-label">电子邮件</label>
                        <div class="controls">
                            <input type="text" id="email" name="email" class="input-large" value="${user.email}" />
                        </div>
                    </div>

                    <div class="control-group">
                        <label for="userRoles" class="control-label">角色</label>
                        <div class="controls">
                            <select id="userRoles" name="roles">
                                <option value="admin">Admin</option>
                                <option value="user">User</option>
                            </select>
                        </div>
                    </div>

                    <div class="control-group">
                        <label class="control-label">状态</label>
                        <div class="controls">
                            <label class="radio">
                                <div class="radio"><span class="checked"><input type="radio" value="1" name="statusCode"></span></div>
                                Active
                            </label>
                            <div style="clear:both"></div>
                            <label class="radio">
                                <div class="radio"><span><input type="radio" value="0" name="statusCode"></span></div>
                                Pending
                            </label>
                            <div style="clear:both"></div>
                            <label class="radio">
                                <div class="radio"><span><input type="radio" value="-1" name="statusCode"></span></div>
                                Deactive
                            </label>
                        </div>
                    </div>

                    <c:if test="${action == 'update'}">
                        <div class="control-group">
                            <label class="control-label">注册日期</label>
                            <div class="controls">
                                <span class="help-inline" style="padding:5px 0px"><fmt:formatDate value="${user.registerDate}" pattern="yyyy年MM月dd日  HH时mm分ss秒" /></span>
                            </div>
                        </div>
                    </c:if>
                    <div class="form-actions">
                        <input id="submit_btn" class="btn btn-primary" type="submit" value="提交"/>&nbsp;
                        <input id="cancel_btn" class="btn" type="button" value="返回" onclick="history.back()"/>
                    </div>
                </fieldset>
            </form>

        </div><!--/box-content-->
    </div><!--/span-->
</div><!--/row-->

<script>
    $(document).ready(function() {
        //聚焦第一个输入框
        $("#loginName").focus();
        <c:if test="${action == 'update'}">
        $("#name").focus();
        </c:if>
        //为inputForm注册validate函数
        $("#inputForm").validate({
            errorElement: "em",
            rules: {
                loginName: {
                    required: true,
                    minlength: 3,
                    remote: "${ctx}/admin/user/checkLoginName"
                }
                ,name : {
                    required: true,
                    minlength: 3
                }
                <c:if test="${action == 'create'}">
                    ,plainPassword : {
                        required: true,
                        minlength: 6

                    }
                    ,confirmPassword : {
                        required: true,
                        minlength: 6

                    }
                </c:if>
            },
            messages: {
                loginName: {
                    remote: "用户登录名已存在"
                }
            }
        });
    });
</script>
</body>
</html>
