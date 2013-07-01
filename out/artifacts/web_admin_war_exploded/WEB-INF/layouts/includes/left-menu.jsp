<div class="span2">
    <div class="well nav-collapse sidebar-nav">
        <ul class="nav nav-tabs nav-stacked main-menu">

            <li class="nav-header hidden-tablet">Main</li>
            <li><a class="ajax-link" href="${ctx}/dashboard"><i class="icon-home"></i><span class="hidden-tablet"> Dashboard</span></a></li>

            <shiro:hasRole name="admin">
                <li class="nav-header hidden-tablet">System</li>
                <li><a class="ajax-link" href="${ctx}/system/user"><i class="icon-user"></i><span class="hidden-tablet"> User Mgr</span></a></li>

                <li class="nav-header hidden-tablet">Quartz</li>
                <li><a class="ajax-link" href="${ctx}/quartz/job-details"><i class="icon-user"></i><span class="hidden-tablet"> Job Details</span></a></li>
            </shiro:hasRole>

        </ul>
    </div><!--/.well -->
</div><!--/span-->