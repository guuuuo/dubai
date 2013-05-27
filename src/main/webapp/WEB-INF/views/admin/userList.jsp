<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<html>
<head>
	<title>用户管理</title>
</head>

<body>
	<c:if test="${not empty message}">
		<div id="message" class="alert alert-success"><button data-dismiss="alert" class="close">×</button>${message}</div>
	</c:if>

    <div class="row-fluid">
        <div class="box span12">
            <div class="box-header well" data-original-title>
                <h2><i class="icon-user"></i> User</h2>
                <div class="box-btn">
                    <a class="btn" href="${ctx}/admin/user/create">Create User</a>
                </div>
            </div>
            <div class="box-content">
                <div class="row-fluid">
                    <div class="span10">
                        <form class="form-search" action="#">
                            <label>登录名：</label> <input type="text" name="search_LIKE_loginName" class="input-medium" value="${param.search_LIKE_loginName}">
                            <label>用户名：</label> <input type="text" name="search_LIKE_name" class="input-medium" value="${param.search_LIKE_niceName}">
                            <button type="submit" class="btn btn-primary" id="search_btn">Search</button>
                            <button type="submit" class="btn" id="reset_btn">Reset</button>
                        </form>
                    </div>
                    <tags:sort/>
                </div>

                <table id="contentTable" class="table table-striped table-bordered table-condensed">
                    <thead><tr><th>登录名</th><th>用户名</th><th>注册时间<th>管理</th></tr></thead>
                    <tbody>
                    <c:forEach items="${users.content}" var="user">
                        <tr>
                            <td><a href="${ctx}/admin/user/update/${user.id}">${user.loginName}</a></td>
                            <td>${user.niceName}</td>
                            <td>
                                <fmt:formatDate value="${user.registerDate}" pattern="yyyy年MM月dd日  HH时mm分ss秒" />
                            </td>
                            <td>
                                <a href="${ctx}/admin/user/update/${user.id}">Update</a>-
                                <a href="${ctx}/admin/user/delete/${user.id}">Delete</a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <tags:pagination page="${users}" paginationSize="20"/>
            </div><!--/box-content-->
        </div><!--/span-->
    </div><!--/row-->
</body>
</html>
