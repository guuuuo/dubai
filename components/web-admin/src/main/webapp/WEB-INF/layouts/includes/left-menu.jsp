<%@ page contentType="text/html;charset=UTF-8"%>

<div class="span2">
    <div class="well nav-collapse sidebar-nav">
        <ul class="nav nav-tabs nav-stacked main-menu">

            <li class="nav-header hidden-tablet">Main</li>
            <li><a class="ajax-link" href="${ctx}/dashboard"><i class="icon-home"></i><span class="hidden-tablet"> Dashboard</span></a></li>

            <shiro:hasRole name="admin">
                <li class="nav-header hidden-tablet">系统模块</li>
                <li><a class="ajax-link" href="${ctx}/system/role"><i class="icon-user"></i><span class="hidden-tablet"> 角色管理</span></a></li>
                <li><a class="ajax-link" href="${ctx}/system/user"><i class="icon-user"></i><span class="hidden-tablet"> 用户管理</span></a></li>

                <li class="nav-header hidden-tablet">调度管理</li>
                <li><a class="ajax-link" href="${ctx}/quartz/job-details"><i class="icon-user"></i><span class="hidden-tablet"> 作业管理</span></a></li>
            </shiro:hasRole>

        </ul>
    </div><!--/.well -->
</div><!--/span-->