package com.deniz.flightinformation.flight.business.domain;

import com.deniz.framework.dto.AbstractDto;
import com.deniz.framework.dto.Meta;

public class FlightDto extends AbstractDto {

	public Meta airlineMeta = new Meta();
	public Meta flightNumberMeta = new Meta();
	public Meta scheduledTimeMeta = new Meta();
	public Meta categoryCodeMeta = new Meta();
	public Meta viaMeta = new Meta();
	public Meta fromMeta = new Meta();
	public Meta typeMeta = new Meta();
	public Meta destinationMeta = new Meta();

	public Meta getAirlineMeta() {
		return airlineMeta;
	}

	public Meta getFlightNumberMeta() {
		return flightNumberMeta;
	}

	public Meta getScheduledTimeMeta() {
		return scheduledTimeMeta;
	}

	public Meta getCategoryCodeMeta() {
		return categoryCodeMeta;
	}

	public Meta getViaMeta() {
		return viaMeta;
	}

	public Meta getFromMeta() {
		return fromMeta;
	}

	public Meta getTypeMeta() {
		return typeMeta;
	}

	public Meta getDestinationMeta() {
		return destinationMeta;
	}

	@Override
	public String getInfo() {
		return airlineMeta.getValue() + " " + flightNumberMeta.getValue() + " " + scheduledTimeMeta.getValue();
	}

}
