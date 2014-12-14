<%@ tag body-content="empty" description="Inserts a COS 'items' array (with the COS attributes 'value' and 'label' inside)." %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ attribute name="showEmptyNone" required="false" description="Should 'empty.none' be added as first list entry? The default is 'true'" %>
<%@ attribute name="showEmptyAll" required="false" description="Should 'empty.all' be added as first list entry? The default is 'false'" %>
<%@ attribute name="preLocalize" required="false" description="Should 'label:' attribute with the listEntries values be added in order to pre lokalize the items with the values? The default is 'false'" %>
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
			    "label": "${entry.value}"
            </c:if>
        },
    </c:forEach>
]