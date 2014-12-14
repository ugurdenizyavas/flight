<%@ include file="/WEB-INF/cos-jsp/includes.jsp"%>
		{
			"type": "task",
			"id": "overview",
			"mode": "init",
			"selected": true,
			"items": [
				{
					"type":"time",
					"id":"validFrom",
					"required":true,
					"format": "day",
                    "services":
					[
                        {
                            "trigger":"change",
                            "url":"${cosContext.processId}/overview/search",
                            "parameters": [
	                            {
	                            	"id": "*"
	                           	}
                            ]
                        }
                    ]
				},
				{
					"type":"time",
					"id":"validTo",
					"format": "day",
                    "services":
					[
                        {
                            "trigger":"change",
                            "url":"${cosContext.processId}/overview/search",
                            "parameters": [
	                            {
	                            	"id": "*"
	                           	}
                            ]
                        }
                    ]
				},
				{
					"type":"time",
					"id":"snapshot",
					"required":true,
					"format": "day",
                    "services":
					[
                        {
                            "trigger":"change",
                            "url":"${cosContext.processId}/overview/search",
                            "parameters": [
	                            {
	                            	"id": "*"
	                           	}
                            ]
                        }
                    ]
				},
				{
					"type":"list",
					"id":"status",
                    "services":
					[
                        {
                            "trigger":"change",
                            "url":"${cosContext.processId}/overview/search",
                            "parameters": [
	                            {
	                            	"id": "*"
	                           	}
                            ]
                        }
                    ]
				},
				{
					"type":"list",
					"id":"viewSwitch",
					"items": [
						{
							"value": "summarized"
						},
						{
							"value": "historical"
						}
					],
                    "services":
					[
                        {
                            "trigger":"change",
                            "url":"${cosContext.processId}/overview/viewSwitch",
                            "parameters": [
	                            {
	                            	"id": "+"
	                           	}
                            ]
                        }
                    ]
				},
				{
					"type": "list",
					"id": "entityList",
                    "services":
					[
                        {
                            "trigger":"change",
                            "url":"${cosContext.processId}/overview/search",
                            "parameters": [
	                            {
	                            	"id": "*"
	                           	}
                            ]
                        }
                    ]
				},
				{
					"type": "list",
					"id": "ownerList",
                    "services":
					[
                        {
                            "trigger":"change",
                            "url":"${cosContext.processId}/overview/search",
                            "parameters": [
	                            {
	                            	"id": "*",
	                           	}
                            ]
                        }
                    ],
				},
				{
					"type": "list",
					"id": "titleList",
                    "services":
					[
                        {
                            "trigger":"change",
                            "url":"${cosContext.processId}/overview/search",
                            "parameters": [
	                            {
	                            	"id": "*",
	                           	}
                            ]
                        }
                    ],
				},
				{
					"type": "table",
					"id": "entriesTable",
					"checked": "multiple",
					"page": ${pageInfo.pageNumber},
					"pageCount": ${pagingInfo.pageCount},
					<c:if test="${pagingInfo.pageSize=='all'}">
					"pageSize": "${pagingInfo.pageSize}",
					</c:if>
					<c:if test="${pagingInfo.pageSize!='all'}">
					"pageSize": ${pagingInfo.pageSize},
					</c:if>
					"rowCount": ${queryResult.rowCount},
					"columns": [
						{
							"type": "text",
							"id": "titleNaturalKey",
							"sorted": "up"
						},
						{
							"type": "text",
							"id": "entityNaturalKey",
                            "hidden": true
						},
						{
							"type": "text",
							"id": "entityDisplay"
						},
						{
							"type": "text",
							"id": "ownerNaturalKey",
                            "hidden": true
						},
						{
							"type": "text",
							"id": "ownerDisplay"
						},
						{
							"type": "text",
							"id": "status"
						},
						{
							"type": "text",
							"id": "info"
						},
						{
							"type": "text",
							"id": "list"
						},
						{
							"type": "text",
							"id": "vgList"
						},
						{
							"type":"text",
							"id": "created",
							"hidden": true
						},
						{
							"type": "time",
							"id": "effective",
							"sorted": "none"
						},
						{
							"type": "time",
							"id": "discontinue",
							"sorted": "none"
						}
					],
					"rows": [
						<c:forEach var="entity" items="${queryResult.entities}">
						[
							"${entity.titleNaturalKeyMeta.value}",
                            "${entity.entityNaturalKeyMeta.value}",
                            "${entity.entityDisplayMeta.value}",
                            "${entity.ownerNaturalKeyMeta.value}",
                            "${entity.ownerDisplayMeta.value}",
							{
								"value": "${entity.statusMeta.value}",
								<c:if test="${entity.statusMeta.value=='PROPOSAL'}">
								"status": "orange"
								</c:if>
								<c:if test="${entity.statusMeta.value=='ACCEPTED'}">
								"status": "green"
								</c:if>
								<c:if test="${entity.statusMeta.value=='REJECTED'}">
								"status": "red"
								</c:if>
								<c:if test="${entity.statusMeta.value=='RELEASED'}">
								"status": "blue"
								</c:if>
								<c:if test="${entity.statusMeta.value=='DELETED'}">
								"status": "red"
								</c:if>
							},
							{
								"value": "",
								<c:if test="${not empty entity.infoMeta.value}">
								"status": "blue"
								</c:if>
							},
							"${entity.groupSetMeta.value}",
							"${entity.groupSetVGMeta.value}",
							"${entity.insertedMeta.value}",
							"${entity.effectiveMeta.value}",
							"${entity.discontinueMeta.value}"
						],
						</c:forEach>
					],
					"services": [
						{
							"id": "select",
							"trigger": "select",
							"url": "${cosContext.processId}/details/init",
							"parameters": [
								{
									"id": "+"
								}
							]
						},
						{
							"id": "paging",
							"trigger": "paging",
							"url": "${cosContext.processId}/overview/paging"
						}
					]
				}
			],
			"services": [
				{
					"id": "init",
					"trigger": "init",
					"url": "${cosContext.processId}/overview/init"
				},
				{
					"id": "add",
					"url": "${cosContext.processId}/details/init",
					"parameters": [
						{
							"id": "*"
						},
						{
							"id": "isNew",
							"value": "true"
						}
					]
				},
				{
					"id": "delete",
					"confirm":"status.attachments.delete.confirm",
					"url": "${cosContext.processId}/overview/delete",
					"parameters": [
						{ "id": "*" }
					]
				}
			]
		}