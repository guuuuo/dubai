<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<html>
<head>
	<title>角色管理</title>
</head>

<body>
	<c:if test="${not empty message}">
		<div id="message" class="alert alert-success"><button data-dismiss="alert" class="close">×</button>${message}</div>
	</c:if>
    <c:if test="${not empty error}">
        <div id="message" class="alert alert-error"><button data-dismiss="alert" class="close">×</button>${error}</div>
    </c:if>

    <div class="row-fluid">
        <div class="box span12">
            <div class="box-header well" data-original-title>
                <h2><i class="icon-user"></i> Role</h2>
                <div class="box-btn">
                    <a class="btn" href="${ctx}/system/role/create">Create Role</a>
                    <a href="#myModal" role="button" class="btn" data-toggle="modal">新增角色</a>
                </div>
            </div>
            <div class="box-content">
                <div class="row-fluid">
                    <div class="span10">
                        <form class="form-search" action="#">
                            <label for="search_LIKE_roleName">角色名称</label> <input type="text" id="search_LIKE_roleName" name="search_LIKE_roleName" class="input-medium" value="${param.search_LIKE_roleName}">
                            <label for="search_LIKE_roleDesc">角色描述</label> <input type="text"  id="search_LIKE_roleDesc" name="search_LIKE_roleDesc" class="input-medium" value="${param.search_LIKE_roleDesc}">
                            <button type="submit" class="btn btn-primary" id="search_btn">查询</button>
                            <a class="btn" id="reset_btn" href="${ctx}/system/role" >重置</a>
                        </form>
                    </div>
                    <tags:sort/>
                </div>

                <table id="contentTable" class="table table-striped table-bordered table-condensed table-hover">
                    <thead>
                        <tr>
                            <th>角色名称</th>
                            <th>角色描述</th>
                            <th>创建时间</th>
                            <th>状态</th>
                            <th>管理</th>
                        </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${roles.content}" var="role">
                        <tr>
                            <td><a href="${ctx}/system/role/update/${role.id}">${role.roleName}</a></td>
                            <td>${role.roleDesc}</td>
                            <td>
                                <fmt:formatDate value="${role.createdWhen}" pattern="yyyy-MM-dd HH:mm:ss" />
                            </td>
                            <td>
                                <c:choose>
                                    <c:when test="${role.active}">
                                        <span class="label label-success">Active</span>
                                    </c:when>
                                    <c:when test="${!role.active}">
                                        <span class="label label-warning">Inactive</span>
                                    </c:when>
                                </c:choose>
                            </td>
                            <td class="actions">
                                <ul class="inline">
                                    <c:choose>
                                        <c:when test="${role.active}">
                                            <li><a href="${ctx}/system/role/deactive/${role.id}">Deactive</a></li>
                                        </c:when>
                                        <c:otherwise>
                                            <li><a href="${ctx}/system/role/active/${role.id}">Active</a></li>
                                        </c:otherwise>
                                    </c:choose>
                                    <li><a href="${ctx}/system/role/update/${role.id}">Update</a></li>
                                    <li><a href="${ctx}/system/role/delete/${role.id}" rel="popover-del" id="aDel${role.id}">Delete</a></li>
                                </ul>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <tags:pagination page="${roles}" paginationSize="20"/>
            </div><!--/box-content-->
        </div><!--/span-->
    </div><!--/row-->

    <!-- Edit Popup -->
    <div id="myModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
            <h3 id="myModalLabel">新增角色</h3>
        </div>
        <div class="modal-body">

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
                </fieldset>
            </form>

        </div>
        <div class="modal-footer">
            <input id="submit_btn" class="btn btn-primary" type="submit" value="提交" onclick="$('#inputForm').submit();return false;"/>&nbsp;
            <button class="btn" data-dismiss="modal" aria-hidden="true">取消</button>
        </div>
    </div>
</body>
</html>
