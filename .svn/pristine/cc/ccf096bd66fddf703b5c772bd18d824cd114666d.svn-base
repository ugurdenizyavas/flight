<%@ include file="/WEB-INF/cos-jsp/includes.jsp"%>
		{
			"type": "task",
			"id": "details",
			"mode": "init",
			"selected": true,
			"items": [
				{
					"type":"time",
					"id":"effective",
					"label": "${localizedEffective}",
					"format": "day",
					"required":true
				},
				{
					"type":"time",
					"id":"discontinue",
					"label": "${localizedDiscontinue}",
					"format": "day"
				},
				{
					"type":"list",
					"id":"status"
				},
				{
					"type": "list",
					"id": "entity",
					"required": true,
                    "services":
					[
                        {
                            "trigger":"change",
                            "url":"${cosContext.processId}/details/changeEntity",
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
					"id": "owner",
					"required": true
				},
				{
					"type": "text",
					"id": "title",
					"required": true
				},
				{
					"type":"text",
					"id":"info"
				}
			],
			"services": [
				{
					"id": "init",
					"trigger": "init",
					"url": "${cosContext.processId}/details/init",
					"parameters": [
						{
							"id": "isTabClick",
							"value" : "true"
						}
					]
				},
				{
					"id": "save",
					"url": "${cosContext.processId}/details/save",
					"parameters": [
						{
							"id": "+"
						}
					]
				}
			]
		}