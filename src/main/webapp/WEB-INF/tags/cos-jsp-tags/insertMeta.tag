<%--@elvariable id="ValueType" type="aero.deniz.cos.libraries.dto.ValueType"--%>
<%--@elvariable id="ValueType" type="aero.deniz.cos.libraries.dto.Meta"--%>
<%@ tag body-content="empty" description="Inserts COS attributes 'value', 'error' and 'warning'. All values are taken from the given meta object." %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ attribute name="metaObject" type="aero.deniz.cos.libraries.dto.Meta" required="true" description="The meta object that contains the error, warning and value data." %>

<%--    In case of errors or warnings we usually do not add the value. In rare cases the value might be changed by a validator together with an error --%>
<%--    message, e.g. if the user enters 'LHkjfjfj' as flight number and the validator wants to set an error message and the value to 'LH'. Therefore --%>
<%--    we set the value together wit errors/warnings if the value changed flag is set. --%>
<c:if test="${metaObject.valueChanged}">
    <c:if test="${metaObject.valueType == 'STRING'}">
        <c:if test="${not empty metaObject.value}">
            "value": "${metaObject.value}",
        </c:if>
        <c:if test="${empty metaObject.value}">
            "value": null,
        </c:if>
    </c:if>
    <c:if test="${metaObject.valueType != 'STRING'}">
        <c:if test="${not empty metaObject.value}">
            "value": "${metaObject.value}",
        </c:if>
        <c:if test="${empty metaObject.value}">
            "value": null,
        </c:if>
    </c:if>
</c:if>
<c:if test="${metaObject.lockedChanged}">
        "locked": ${metaObject.locked},
</c:if>
<c:forEach items="${metaObject.errors}" var="error">
    "error": "<c:out value="${error.localizerKey}" />
    <c:forEach items="${error.variableValues}" var="variableValue">
    |<c:out value="${variableValue.type.name}" />:<c:out value="${variableValue.value}" />
    </c:forEach>",
</c:forEach>
<c:forEach items="${metaObject.warnings}" var="warning">
    "warning": "<c:out value="${warning.localizerKey}" /><c:forEach items="${warning.variableValues}" var="variableValue">|<c:out value="${variableValue.type.name}" />:<c:out value="${variableValue.value}" /></c:forEach>",
</c:forEach>