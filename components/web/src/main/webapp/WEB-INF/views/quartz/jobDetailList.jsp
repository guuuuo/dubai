<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<html>
<head>
    <title>Job Details Management</title>
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
            <h2><i class="icon-user"></i> Job Details</h2>
            <div class="box-btn">
                <a class="btn" href="${ctx}/admin/user/create">XXX</a>
            </div>
        </div>
        <div class="box-content">
            <div class="row-fluid">
                <div class="span10">
                    <form class="form-search" action="#">
                        <label for="search_LIKE_jobName">Job Name</label> <input type="text" id="search_LIKE_jobName" name="search_LIKE_jobDetailPK.jobName" class="input-medium" value="${param.search_LIKE_jobDetailPK.jobName}">
                        <label for="search_LIKE_jobClassName">Job Class Name</label> <input type="text"  id="search_LIKE_jobClassName" name="search_LIKE_jobClassName" class="input-medium" value="${param.search_LIKE_jobClassName}">
                        <button type="submit" class="btn btn-primary" id="search_btn">Search</button>
                        <button type="reset" class="btn" id="reset_btn">Reset</button>
                    </form>
                </div>
                <tags:sort/>
            </div>

            <table id="contentTable" class="table table-striped table-bordered table-condensed">
                <thead>
                <tr>
                    <th>Job Name</th>
                    <th>Group Name</th>
                    <th>Description</th>
                    <th>Job Class Name</th>
                    <th>Actions</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${jobDetails.content}" var="jobDetail">
                    <tr>
                        <td>${jobDetail.jobDetailPK.jobName}</td>
                        <td>${jobDetail.jobDetailPK.jobGroup}</td>
                        <td>${jobDetail.description}</td>
                        <td>${jobDetail.jobClassName}</td>
                        <td class="actions">
                            <ul class="inline">

                            </ul>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <tags:pagination page="${jobDetails}" paginationSize="20"/>
        </div><!--/box-content-->
    </div><!--/span-->
</div><!--/row-->
</body>
</html>
