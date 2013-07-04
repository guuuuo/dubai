<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<div class="navbar navbar-fixed-top">
    <div class="navbar-inner">
        <div class="container-fluid">
            <a class="btn btn-navbar" data-toggle="collapse" data-target=".top-nav.nav-collapse,.sidebar-nav.nav-collapse">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </a>
            <a class="brand" href="/"> <img alt="Dubai Logo" src="${ctx}/assets/img/logo20.png" /> <span>Dubai</span></a>

            <!-- module switch starts -->
            <div class="nav-collapse collapse module-menu">
                <ul class="nav">
                    <c:forEach items="${_modules}" var="module">
                        <li <c:if test="${_currentModuleCode == module.moduleCode}">class="active"</c:if>>
                            <a href="${ctx}/module/${module.moduleCode}" title="${module.moduleDesc}">${module.moduleName}</a>
                        </li>
                    </c:forEach>
                </ul>
            </div>
            <!-- module switch ends -->

            <!-- user dropdown starts -->
            <div class="btn-group pull-right" >
                <a class="btn dropdown-toggle" data-toggle="dropdown" href="#">
                    <i class="icon-user"></i><span class="hidden-phone"> <shiro:principal property="name"/></span>
                    <span class="caret"></span>
                </a>
                <ul class="dropdown-menu">
                    <li><a href="${ctx}/account/settings">设置</a></li>
                    <li class="divider"></li>
                    <li><a href="${ctx}/passport/logout">退出</a></li>
                </ul>
            </div>
            <!-- user dropdown ends -->

        </div>
    </div>
</div>