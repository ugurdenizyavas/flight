package com.deniz.flightinformation.services.actualflight.tasks;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONException;

import com.deniz.flightinformation.flight.business.AirportService;
import com.deniz.flightinformation.flight.business.FlightService;
import com.deniz.flightinformation.flight.business.domain.AirportDto;
import com.deniz.flightinformation.flight.business.domain.FlightDto;
import com.deniz.framework.controller.TaskControllerTemplate;
import com.deniz.framework.controller.enums.CosJsonTriggerEnum;
import com.deniz.framework.controller.model.CosJsonArray;
import com.deniz.framework.controller.model.CosJsonColumn;
import com.deniz.framework.controller.model.CosJsonDate;
import com.deniz.framework.controller.model.CosJsonFundamental;
import com.deniz.framework.controller.model.CosJsonList;
import com.deniz.framework.controller.model.CosJsonListItem;
import com.deniz.framework.controller.model.CosJsonObject;
import com.deniz.framework.controller.model.CosJsonParameter;
import com.deniz.framework.controller.model.CosJsonRow;
import com.deniz.framework.controller.model.CosJsonService;
import com.deniz.framework.controller.model.CosJsonTable;

public class ActualFlightOverviewTaskController extends TaskControllerTemplate {

	private FlightService flightService;
	private AirportService airportService;

	public void setFlightService(FlightService flightService) {
		this.flightService = flightService;
	}

	public void setAirportService(AirportService airportService) {
		this.airportService = airportService;
	}

	public CosJsonFundamental init(HttpServletRequest request) throws JSONException {
		CosJsonArray<CosJsonObject> items = new CosJsonArray<CosJsonObject>();

		createFilters(items);

		createTable(items);

		CosJsonArray<CosJsonObject> services = new CosJsonArray<CosJsonObject>();
		services.put(new CosJsonService("search").setUrl("actualFlight/overview/init"));

		return new CosJsonFundamental(items, services);
	}

	public CosJsonObject update(HttpServletRequest request) throws JSONException {

		CosJsonObject itemsAndServices = new CosJsonObject();

		CosJsonArray<CosJsonObject> taskItems = new CosJsonArray<CosJsonObject>();

		createFilters(taskItems);

		createTable(taskItems);

		itemsAndServices.put("items", taskItems);

		return itemsAndServices;
	}

	private void createTable(CosJsonArray<CosJsonObject> taskItems) throws JSONException {
		List<CosJsonColumn> columns = createTableColumns();

		List<CosJsonRow> rows = createTableRows();

		List<CosJsonService> services = createTableServices();

		CosJsonTable groupsTable = new CosJsonTable("groupsTable", columns, rows, services);

		taskItems.put(groupsTable);
	}

	private List<CosJsonService> createTableServices() throws JSONException {
		List<CosJsonService> services = new ArrayList<CosJsonService>();

		CosJsonArray<CosJsonParameter> parameters = new CosJsonArray<CosJsonParameter>().addObjects(new CosJsonParameter("*"));

		services.add(new CosJsonService("edit").setTrigger(CosJsonTriggerEnum.select).setUrl("actualFlight/details/init").setParameters(parameters));
		return services;
	}

	private List<CosJsonRow> createTableRows() {
		List<CosJsonRow> rows = new ArrayList<CosJsonRow>();
		List<FlightDto> flightDtoList = flightService.getFlights();
		for (FlightDto flightDto : flightDtoList) {
			rows.add((CosJsonRow) new CosJsonRow(flightDto.getId(), flightDto.getFlightNumberMeta().getValue(), flightDto.getFromMeta().getValue(), flightDto
					.getViaMeta().getValue(), flightDto.getDestinationMeta().getValue(), flightDto.getScheduledTimeMeta().getValue(), flightDto
					.getTypeMeta().getValue()));
		}
		return rows;
	}

	private List<CosJsonColumn> createTableColumns() throws JSONException {
		List<CosJsonColumn> columns = new ArrayList<CosJsonColumn>();
		columns.add(new CosJsonColumn("flightNo", "Flight No"));
		columns.add(new CosJsonColumn("origin", "Origin"));
		columns.add(new CosJsonColumn("via", "Via"));
		columns.add(new CosJsonColumn("destination", "Destination"));
		columns.add(new CosJsonColumn("stad", "STAD"));
		columns.add(new CosJsonColumn("type", "Type"));
		return columns;
	}

	private void createFilters(CosJsonArray<CosJsonObject> taskItems) throws JSONException {
		CosJsonDate filterDate = createDateFilter();

		CosJsonList filterAirportList = createAirportFilter();
		taskItems.put(filterAirportList).put(filterDate);
	}

	private CosJsonDate createDateFilter() throws JSONException {
		return (CosJsonDate) new CosJsonDate("date").setValue("19.04.2013");
	}

	private CosJsonList createAirportFilter() throws JSONException {
		List<CosJsonObject> listItems = new ArrayList<CosJsonObject>();
		List<AirportDto> airportDtoList = airportService.getOperatedAirports();
		for (AirportDto airportDto : airportDtoList) {
			listItems.add(new CosJsonListItem(airportDto.getIataCodeMeta().getValue(), airportDto.getIataCodeMeta().getValue()));
		}
		CosJsonList filterAirportList = new CosJsonList("airportList", listItems);
		return filterAirportList;
	}

}
