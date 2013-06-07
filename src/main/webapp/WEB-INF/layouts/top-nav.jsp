<div class="navbar navbar-fixed-top">
    <div class="navbar-inner">
        <div class="container-fluid">
            <a class="btn btn-navbar" data-toggle="collapse" data-target=".top-nav.nav-collapse,.sidebar-nav.nav-collapse">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </a>
            <a class="brand" href="/"> <img alt="Dubai Logo" src="/assets/img/logo20.png" /> <span>Dubai</span></a>

            <!-- module switch starts -->
            <div class="nav-collapse collapse">
                <ul class="nav">
                    <li class="active">
                        <a href="/">首页</a>
                    </li>
                    <li>
                        <a href="/">监控</a>
                    </li>
                    <li>
                        <a href="/">日志</a>
                    </li>
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
                    <li><a href="${ctx}/profile">Profile</a></li>
                    <li class="divider"></li>
                    <li><a href="${ctx}/logout">Logout</a></li>
                </ul>
            </div>
            <!-- user dropdown ends -->

        </div>
    </div>
</div>