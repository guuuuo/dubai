<%@ page language="java" pageEncoding="UTF-8" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="org.apache.shiro.web.filter.authc.FormAuthenticationFilter"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Dashboard</title>
</head>

<body>
<div class="row-fluid">
    <div class="box span12">
        <div class="box-header well">
            <h2><i class="icon-info-sign"></i> Dashboard</h2>
        </div>
        <div class="box-content">
            <a data-rel="tooltip" title="6 new members." class="well span3 top-block" href="#">
                <span class="icon32 icon-red icon-user"></span>
                <div>Total Members</div>
                <div>507</div>
                <span class="notification">6</span>
            </a>

            <a data-rel="tooltip" title="4 new pro members." class="well span3 top-block" href="#">
                <span class="icon32 icon-color icon-star-on"></span>
                <div>Pro Members</div>
                <div>228</div>
                <span class="notification green">4</span>
            </a>

            <a data-rel="tooltip" title="$34 new sales." class="well span3 top-block" href="#">
                <span class="icon32 icon-color icon-cart"></span>
                <div>Sales</div>
                <div>$13320</div>
                <span class="notification yellow">$34</span>
            </a>

            <a data-rel="tooltip" title="12 new messages." class="well span3 top-block" href="#">
                <span class="icon32 icon-color icon-envelope-closed"></span>
                <div>Messages</div>
                <div>25</div>
                <span class="notification red">12</span>
            </a>
            <div class="clearfix"></div>
        </div>
    </div>
</div>

<div class="row-fluid sortable">

    <div class="box span8">
        <div class="box-header well" data-original-title>
            <h2><i class="icon-list-alt"></i> Realtime Traffic</h2>
        </div>
        <div class="box-content">
            <hr/>
            <hr/>
            <hr/>
            <hr/>
            <hr/>
            <hr/>
            <hr/>
            <hr/>
            <hr/>
            <hr/>
            <hr/>
            <hr/>
            <hr/>
        </div>
    </div><!--/span-->

    <div class="box span4">
        <div class="box-header well" data-original-title>
            <h2><i class="icon-list"></i> Weekly Stat</h2>
        </div>
        <div class="box-content">
            <ul class="dashboard-list">
                <li>
                    <a href="#">
                        <i class="icon-arrow-up"></i>
                        <span class="green">92</span>
                        New Comments
                    </a>
                </li>
                <li>
                    <a href="#">
                        <i class="icon-arrow-down"></i>
                        <span class="red">15</span>
                        New Registrations
                    </a>
                </li>
                <li>
                    <a href="#">
                        <i class="icon-minus"></i>
                        <span class="blue">36</span>
                        New Articles
                    </a>
                </li>
                <li>
                    <a href="#">
                        <i class="icon-comment"></i>
                        <span class="yellow">45</span>
                        User reviews
                    </a>
                </li>
                <li>
                    <a href="#">
                        <i class="icon-arrow-up"></i>
                        <span class="green">112</span>
                        New Comments
                    </a>
                </li>
                <li>
                    <a href="#">
                        <i class="icon-arrow-down"></i>
                        <span class="red">31</span>
                        New Registrations
                    </a>
                </li>
                <li>
                    <a href="#">
                        <i class="icon-minus"></i>
                        <span class="blue">93</span>
                        New Articles
                    </a>
                </li>
                <li>
                    <a href="#">
                        <i class="icon-comment"></i>
                        <span class="yellow">254</span>
                        User reviews
                    </a>
                </li>
            </ul>
        </div>
    </div><!--/span-->

</div><!--/row-->

<div class="modal hide fade" id="myModal">
    <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">×</button>
        <h3>Settings</h3>
    </div>
    <div class="modal-body">
        <p>Here settings can be configured...</p>
    </div>
    <div class="modal-footer">
        <a href="#" class="btn" data-dismiss="modal">Close</a>
        <a href="#" class="btn btn-primary">Save changes</a>
    </div>
</div>

</body>
</html>