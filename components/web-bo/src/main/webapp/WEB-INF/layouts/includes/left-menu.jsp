<%@ page contentType="text/html;charset=UTF-8"%>

<div class="span2">
    <div class="well nav-collapse sidebar-nav">
        <ul class="nav nav-tabs nav-stacked main-menu">

            <!--
            <li class="nav-header hidden-tablet">Main</li>
            <li><a class="ajax-link" href="${ctx}/dashboard"><i class="icon-home"></i><span class="hidden-tablet"> Dashboard</span></a></li>
            -->

            <shiro:hasRole name="admin">
                <li class="nav-header hidden-tablet">组织结构管理</li>
                <li><a class="ajax-link" href="${ctx}/system/dept"><i class="icon-user"></i><span class="hidden-tablet"> 部门</span></a></li>
                <li><a class="ajax-link" href="${ctx}/system/role"><i class="icon-user"></i><span class="hidden-tablet"> 角色</span></a></li>
                <li><a class="ajax-link" href="${ctx}/system/user"><i class="icon-user"></i><span class="hidden-tablet"> 用户</span></a></li>

                <li class="nav-header hidden-tablet">资源权限管理</li>
                <li><a class="ajax-link" href="${ctx}/system/menu"><i class="icon-user"></i><span class="hidden-tablet"> 功能菜单</span></a></li>
                <li><a class="ajax-link" href="${ctx}/system/acl"><i class="icon-user"></i><span class="hidden-tablet"> 权限分配</span></a></li>


                <li class="nav-header hidden-tablet">定时任务管理</li>
                <li><a class="ajax-link" href="${ctx}/quartz/job-details"><i class="icon-user"></i><span class="hidden-tablet"> 定时任务</span></a></li>

                <li class="nav-header hidden-tablet">其它</li>
                <li><a class="ajax-link" href="${ctx}/system/log"><i class="icon-user"></i><span class="hidden-tablet"> 系统日志</span></a></li>
            </shiro:hasRole>

        </ul>
    </div><!--/.well -->
</div><!--/span-->