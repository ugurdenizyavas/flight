package com.deniz.flightinformation.services.actualflight;

import java.util.LinkedHashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;

import com.deniz.flightinformation.services.FlightInformationLocalizerKeys;
import com.deniz.framework.controller.ProcessControllerTemplate;

public class ActualFlightProcessController extends ProcessControllerTemplate {

	@Override
	public LinkedHashMap<String, Boolean> getLockMap() {
		LinkedHashMap<String, Boolean> lockMap = new LinkedHashMap<String, Boolean>();
		lockMap.put(FlightInformationLocalizerKeys.TASK_NAME_OVERVIEW, false);
		lockMap.put(FlightInformationLocalizerKeys.TASK_NAME_DETAILS, true);
		lockMap.put("load", false);
		lockMap.put("delays", true);
		return lockMap;
	}

	final public ModelAndView go(HttpServletRequest request, HttpServletResponse response) {
		return new ModelAndView("redirect:http://localhost:16580/UserAdministration?requestServer=" + request.getServerName() + ":" + request.getServerPort()
				+ "&requestContext=" + request.getContextPath());
	}

}
