<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<html>
<head>
	<title>角色管理</title>
</head>

<body>

<div class="row-fluid sortable">
    <div class="box span12">
        <div class="box-header well" data-original-title>
            <h2><i class="icon-edit"></i> <c:if test="${action == 'create'}">创建角色</c:if><c:if test="${action == 'update'}">编辑角色</c:if></h2>
        </div>
        <div class="box-content">

            <form id="inputForm" action="${ctx}/system/role/${action}" method="post" class="form-horizontal">
                <input type="hidden" name="id" value="${role.id}"/>
                <fieldset>
                    <div class="control-group">
                        <label class="control-label">角色名称</label>
                        <div class="controls">
                            <input type="text" id="roleName" name="roleName" value="${role.roleName}" class="input-large" <c:if test="${action == 'update'}">disabled=""</c:if>/>
                        </div>
                    </div>

                    <div class="control-group">
                        <label class="control-label">角色描述</label>
                        <div class="controls">
                            <input type="text" id="roleDesc" name="roleDesc" value="${role.roleDesc}" class="input-large required"/>
                        </div>
                    </div>

                    <div class="control-group">
                        <label class="control-label">状态</label>
                        <div class="controls">
                            <label class="radio inline">
                                <div class="radio"><span class="checked">
                                    <input type="radio" value="1" name="active" <c:if test="${role.active}">checked="true"</c:if>>
                                </span></div>
                                启动
                            </label>
                            <label class="radio inline">
                                <div class="radio"><span><input type="radio" value="0" name="active" <c:if test="${!role.active}">checked="true"</c:if>></span></div>
                                禁用
                            </label>
                        </div>
                    </div>

                    <c:if test="${action == 'update'}">
                        <div class="control-group">
                            <label class="control-label">创建日期</label>
                            <div class="controls">
                                <span class="help-inline" style="padding:5px 0px"><fmt:formatDate value="${role.createdWhen}" pattern="yyyy年MM月dd日  HH时mm分ss秒" /></span>
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
                roleName: {
                    required: true,
                    minlength: 3,
                    remote: "${ctx}/system/role/checkRoleName"
                }
                ,roleDesc : {
                    required: true,
                    minlength: 3
                }
            },
            messages: {
                roleName: {
                    remote: "用户登录名已存在"
                }
            }
        });
    });
</script>
</body>
</html>
