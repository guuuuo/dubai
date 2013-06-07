<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<html>
<head>
	<title>任务管理</title>
</head>

<body>
	<c:if test="${not empty message}">
		<div id="message" class="alert alert-success"><button data-dismiss="alert" class="close">×</button>${message}</div>
	</c:if>

    <div class="row-fluid">
        <div class="box span12">
            <div class="box-header well" data-original-title>
                <h2><i class="icon-tasks"></i> Task</h2>
                <div class="box-btn">
                    <a class="btn" href="${ctx}/task/create">Create Task</a>
                </div>
            </div>
            <div class="box-content">
                <div class="row-fluid">
                    <div class="span10">
                        <form class="form-search" action="#">
                            <label>Title：</label> <input type="text" name="search_LIKE_title" class="input-medium" value="${param.search_LIKE_title}">
                            <label>Desc.：</label> <input type="text" name="search_LIKE_description" class="input-medium" value="${param.search_LIKE_description}">
                            <button type="submit" class="btn btn-primary" id="search_btn">Search</button>
                            <button type="submit" class="btn" id="reset_btn">Reset</button>
                        </form>
                    </div>
                    <tags:sort/>
                </div>
                <table class="table table-striped table-bordered table-condensed">
                    <thead>
                    <tr>
                        <th>Title</th>
                        <th>Desc.</th>
                        <th>Actions</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${tasks.content}" var="task">
                        <tr>
                            <td><a href="${ctx}/task/update/${task.id}">${task.title}</a></td>
                            <td>${task.description}</td>
                            <td class="actions">
                                <ul class="inline">
                                    <li><a href="${ctx}/task/update/${task.id}">Update</a></li>
                                    <li><a href="${ctx}/task/delete/${task.id}">Delete</a></li>
                                </ul>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <tags:pagination page="${tasks}" paginationSize="20"/>
            </div>
        </div><!--/span-->

    </div><!--/row-->
</body>
</html>
