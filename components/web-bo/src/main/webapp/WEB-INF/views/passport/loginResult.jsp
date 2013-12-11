<%@ page language="java" pageEncoding="UTF-8" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>重置密码 &gt;&gt; 请查收邮件</title>
</head>

<body>

    <div class="row-fluid">
        <div class="span12 account-header">
            <h2></h2>
        </div><!--/span-->
    </div><!--/row-->

    <div class="row-fluid">
        <div class="span6 account-box" style="margin: 0 auto; float:none;">
            <form id="inputForm" action="" method="post" class="form-horizontal">
                <fieldset>
                    <legend><small>提示</small></legend>
                    <p>登录成功</p>
                    <br/>
                    <div class="control-group center">
                        <div id="showDiv"><span class="red">3</span> 秒后自动跳转至首页</div>
                    </div>
            </form>
        </div><!--/span-->
    </div><!--/row-->

    <!-- *** JavaScript *** -->
    <%@ include file="/WEB-INF/layouts/includes/js.jsp"%>
    <script type="text/javascript">
        function auto_jump() {
            secs = $("#init_value").val() - 1;
            $("#init_value").val(secs);
            if (secs < 0) {
                return false;
            }
            if (secs == 0) {
                clearInterval(time);
                $("#showDiv").html('正在载入...');
                window.location.href = '/${ctx}';
            } else {
                $("#showDiv").html('<span class="red">' + secs + '</span> 秒后自动跳转至首页');
            }
        }
        $(function () {
            var value = 3;
            $("body").append("<input type='hidden' id='init_value' value=" + value + " />");
            time = setInterval('auto_jump()', 1000);
        })
    </script>
</body>
</html>