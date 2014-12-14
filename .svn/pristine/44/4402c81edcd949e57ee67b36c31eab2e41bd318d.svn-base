<%@ tag import="java.util.List, java.util.ArrayList" %>
<%@ tag  body-content="empty" description="DEPRECATED: Don't use this Tag any more!!! Inserts COS attributes 'error', 'warning' and a COS 'items' array (with the COS attributes 'value', 'label' and 'selected' inside). All items are taken from the given listEntries object and error, warning and selected information is taken from the given meta object." %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ attribute name="metaListObject" type="java.util.List" required="true" description="The list of metas that contains the errors, warnings and the value that should be taken to select an entry of the list." %>
<%@ attribute name="listEntries" type="java.util.Map" required="true" description="A map that contains all list entries to be added. Only the keys will be taken fo fill the COS id and value attributes. If the given Meta value corresponds with the list entry key, the list entry will be selected." %>
<%@ attribute name="showEmptyNone" required="false" description="Should 'empty.none' be added as first list entry? The default is 'true'" %>
<%@ attribute name="showEmptyAll" required="false" description="Should 'empty.all' be added as first list entry? The default is 'false'" %>
<%@ attribute name="preLocalize" required="false" description="Should 'label:' attribute with the listEntries values be added in order to pre lokalize the items with the values? The default is 'false'" %>

<c:forEach items="${metaListObject}" var="metaObject">
	<c:forEach items="${metaObject.errors}" var="error">
        "error": "<c:out value="${error.localizerKey}" /><c:forEach items="${error.variableValues}" var="variableValue">|<c:out value="${variableValue.type.name}" />:<c:out value="${variableValue.value}" /></c:forEach>",
	</c:forEach>
</c:forEach>

<c:forEach items="${metaListObject}" var="metaObject">
	<c:forEach items="${metaObject.warnings}" var="warning">
        "warning": "<c:out value="${warning.localizerKey}" /><c:forEach items="${warning.variableValues}" var="variableValue">|<c:out value="${variableValue.type.name}" />:<c:out value="${variableValue.value}" /></c:forEach>",
	</c:forEach>
</c:forEach>

<c:if test="${showEmptyNone==null}">
    <c:set var="showEmptyNone" value="true"/>
</c:if>
<c:if test="${showEmptyAll==null}">
    <c:set var="showEmptyAll" value="false"/>
</c:if>
<c:if test="${preLocalize==null}">
    <c:set var="preLocalize" value="false"/>
</c:if>
"items": [
    <c:if test="${showEmptyNone=='true'}">
        {
            "value": "empty.none"
        },
    </c:if>
    <c:if test="${showEmptyAll=='true'}">
        {
            "value": "empty.all"
        },
    </c:if>
    <c:forEach items="${listEntries}" var="entry">
        {
            "value": "${entry.key}",
            <c:if test="${preLocalize=='true'}">
			    "label": "${entry.value}",
            </c:if>
	        <c:forEach items="${metaListObject}" var="metaObject">
		        <c:if test="${entry.key == metaObject.value}">
					"selected": true
				</c:if>
		    </c:forEach>
        } ,
    </c:forEach>
]