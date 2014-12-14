package com.deniz.flightinformation.services.actualflight.tasks;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONException;

import com.deniz.flightinformation.flight.business.FlightService;
import com.deniz.framework.controller.TaskControllerTemplate;
import com.deniz.framework.controller.model.CosJsonArray;
import com.deniz.framework.controller.model.CosJsonFundamental;
import com.deniz.framework.controller.model.CosJsonObject;
import com.deniz.framework.controller.model.CosJsonService;
import com.deniz.framework.controller.model.CosJsonText;
import com.deniz.framework.dto.Message;

public class ActualFlightDetailsTaskController extends TaskControllerTemplate {

	private FlightService flightService;

	public void setFlightService(FlightService flightService) {
		this.flightService = flightService;
	}

	public CosJsonFundamental init(HttpServletRequest request) throws JSONException {
//		String requestId = request.getParameter("keyId");

//		FlightDto flightDto = flightService.getFlightById(requestId);

		CosJsonArray<CosJsonObject> items = new CosJsonArray<CosJsonObject>();
		CosJsonText flightNoText = new CosJsonText("flightNo", "TK1010");
		items.put(flightNoText);

		CosJsonArray<CosJsonObject> services = new CosJsonArray<CosJsonObject>();
		services.put(new CosJsonService("back").setUrl("actualFlight/details/update"));

		return new CosJsonFundamental(items, services);
	}

	public CosJsonFundamental update(HttpServletRequest request) throws JSONException {
		CosJsonArray<CosJsonObject> items = new CosJsonArray<CosJsonObject>();
		CosJsonText flightNoText = new CosJsonText("flightNo", "TK 1222");
		flightNoText.addError(new Message("validation-error"));
		items.put(flightNoText);

		return new CosJsonFundamental(items, null);
	}
}
