<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<html>
<head>
	<title>部门管理</title>
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
                <h2><i class="icon-user"></i> dept</h2>
                <div class="box-btn">
                    <a class="btn" href="${ctx}/system/dept/create">Create dept</a>
                </div>
            </div>
            <div class="box-content">
                <div class="row-fluid">
                    <div class="span10">
                        <form class="form-search" action="#">
                            <label for="search_LIKE_deptName">部门名称</label> <input type="text" id="search_LIKE_deptName" name="search_LIKE_deptName" class="input-medium" value="${param.search_LIKE_deptName}">
                            <label for="search_LIKE_deptDesc">部门描述</label> <input type="text"  id="search_LIKE_deptDesc" name="search_LIKE_deptDesc" class="input-medium" value="${param.search_LIKE_deptDesc}">
                            <button type="submit" class="btn btn-primary" id="search_btn">查询</button>
                            <a class="btn" id="reset_btn" href="${ctx}/system/dept" >重置</a>
                        </form>
                    </div>
                    <tags:sort/>
                </div>

                <table id="contentTable" class="table table-striped table-bordered table-condensed">
                    <thead>
                        <tr>
                            <th>部门名称</th>
                            <th>部门描述</th>
                            <th>创建时间</th>
                            <th>状态</th>
                            <th>管理</th>
                        </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${depts.content}" var="dept">
                        <tr>
                            <td><a href="${ctx}/system/dept/update/${dept.id}">${dept.deptName}</a></td>
                            <td>${dept.deptDesc}</td>
                            <td>
                                <fmt:formatDate value="${dept.createdWhen}" pattern="yyyy-MM-dd HH:mm:ss" />
                            </td>
                            <td>
                                <c:choose>
                                    <c:when test="${dept.active}">
                                        <span class="label label-success">Active</span>
                                    </c:when>
                                    <c:when test="${!dept.active}">
                                        <span class="label label-warning">Inactive</span>
                                    </c:when>
                                </c:choose>
                            </td>
                            <td class="actions">
                                <ul class="inline">
                                    <c:choose>
                                        <c:when test="${dept.active}">
                                            <li><a href="${ctx}/system/dept/deactive/${dept.id}">Deactive</a></li>
                                        </c:when>
                                        <c:otherwise>
                                            <li><a href="${ctx}/system/dept/active/${dept.id}">Active</a></li>
                                        </c:otherwise>
                                    </c:choose>
                                    <li><a href="${ctx}/system/dept/update/${dept.id}">Update</a></li>
                                    <li><a href="${ctx}/system/dept/delete/${dept.id}">Delete</a></li>
                                </ul>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <tags:pagination page="${depts}" paginationSize="20"/>
            </div><!--/box-content-->
        </div><!--/span-->
    </div><!--/row-->
</body>
</html>
