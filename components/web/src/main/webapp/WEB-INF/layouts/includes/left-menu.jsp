<div class="span2">
    <div class="well nav-collapse sidebar-nav">
        <ul class="nav nav-tabs nav-stacked main-menu">
            <li class="nav-header hidden-tablet">Main</li>
            <li><a class="ajax-link" href="${ctx}/dashboard"><i class="icon-home"></i><span class="hidden-tablet"> Dashboard</span></a></li>

            <shiro:hasRole name="admin">
                <li class="nav-header hidden-tablet">Admin</li>
                <li><a class="ajax-link" href="${ctx}/admin/user"><i class="icon-user"></i><span class="hidden-tablet"> User Mgr</span></a></li>

                <li class="nav-header hidden-tablet">Quartz</li>
                <li><a class="ajax-link" href="${ctx}/quartz/job-details"><i class="icon-user"></i><span class="hidden-tablet"> Job Details</span></a></li>
            </shiro:hasRole>

            <li class="nav-header hidden-tablet">TODO</li>
            <li><a class="ajax-link" href="${ctx}/task"><i class="icon-tasks"></i><span class="hidden-tablet"> Task List</span></a></li>
        </ul>
    </div><!--/.well -->
</div><!--/span-->