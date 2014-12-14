<%--@elvariable id="showPrevious" type="java.lang.String"--%>
<%--@elvariable id="showNext" type="java.lang.String"--%>
<%--@elvariable id="taskId" type="java.lang.String"--%>
<%--@elvariable id="taskViewName" type="java.lang.String"--%>
<%--@elvariable id="lockMap" type="java.util.Map"--%>
<%@ include file="/WEB-INF/cos-jsp/includes.jsp" %>
<%@ taglib prefix="ison" uri="ison.tld" %>
{
	"type": "process",
	"id": "${cosContext.processId}",
    <c:if test="${not empty processLabelVariableValue}">
        "label": <ison:print value="${cosContext.processId}|string:${processLabelVariableValue}"/>,
    </c:if>
	"mode": "init",
    <c:if test="${empty processKeys['id'] or processKeys['id'] == 'empty.none'}">"url": "${cosContext.processId}/${keyEntityName}/init?taskname=${taskname}&keyEntityName=${keyEntityName}",</c:if>
    <c:if test="${not empty processKeys['id'] and processKeys['id'] != 'empty.none'}">"url": "${cosContext.processId}/${keyEntityName}/init?id=${processKeys['id']}&taskname=${taskname}&keyEntityName=${keyEntityName}",</c:if>
	"items": [
        <c:forEach items="${taskMap}" var="entry">
            <c:if test="${entry.value=='selected'}">
                <jsp:include page="/WEB-INF/cos-jsp/${taskViewName}.jsp" />,
            </c:if>
            <c:if test="${entry.value=='hidden=true'}">
                {
                    "type": "task",
                    "id": "${entry.key}",
                    "locked": true,
                },
            </c:if>
            <c:if test="${entry.value=='hidden=false'}">
                {
                    "type": "task",
                    "id": "${entry.key}",
                    "mode": "init",
                    <c:if test="${not empty taskInfoMap[entry.key]}">"info": "${taskInfoMap[entry.key]}",</c:if>
                    "services": [
                        {
                            "id": "init",
                            "trigger": "init",
                            "url": "${cosContext.processId}/${entry.key}/init"
                        }
                    ]
                },
            </c:if>
        </c:forEach>
	],
    <c:if test="${taskMode=='init' || taskStateChanged eq true}">
        "services": [
            <c:if test="${showPrevious eq true}">
                {
                    "id": "previous",
                    "url": "${cosContext.processId}/previous",
                    "parameters": [
                        {
                            "id": "currentTask",
                            "value": "${taskId}"
                        }
                    ]
                },
            </c:if>
            <c:if test="${showPrevious eq false}">
                {
                    "id": "previous",
                    "hidden": true
                },
            </c:if>
            <c:if test="${showNext eq true}">
                {
                    "id": "next",
                    "url": "${cosContext.processId}/next",
                    "parameters": [
                        {
                            "id": "currentTask",
                            "value": "${taskId}"
                        }
                    ]
                },
            </c:if>
            <c:if test="${showNext eq false}">
                {
                    "id": "next",
                    "hidden": true
                },
            </c:if>
        ],
    </c:if>
    <%--@elvariable id="processKeys" type="java.util.Map"--%>
    <c:if test="${not empty processKeys}">
        "keys": [
        <c:forEach items="${processKeys}" var="processKey">
            {
            "id": "${processKey.key}",
            "value": <ison:print value="${processKey.value}"/>,
            },
        </c:forEach>
        ],
    </c:if>
}
