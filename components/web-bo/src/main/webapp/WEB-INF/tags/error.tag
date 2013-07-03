<%@tag pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:if test="${not empty errors}">

    <div id="error-message" class="alert alert-error"><button data-dismiss="alert" class="close">×</button>
        <ul>
            <c:forEach items="${errors.fieldErrors}" var="error">
                <c:if test="${not empty error.code || not empty error.defaultMessage}">
                    <li><a href="#${error.field}">${error.field}</a> - <spring:message code="${error.code}" text="${error.defaultMessage}"/></li>
                </c:if>
            </c:forEach>
            <c:forEach items="${errors.globalErrors}" var="error">
                <li><spring:message code="${error.code}" text="${error.defaultMessage}"/></li>
            </c:forEach>
        </ul>
    </div>


    <script type="text/javascript">
        jQuery(document).ready(function () {
            <c:forEach items="${errors.fieldErrors}" var="error">
                utils.highLight('${error.field}', '<spring:message code="${error.code}" text="${error.defaultMessage}"/>');
            </c:forEach>
        });
    </script>

</c:if>

