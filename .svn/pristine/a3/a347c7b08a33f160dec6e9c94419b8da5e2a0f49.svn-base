package com.deniz.flightinformation.flight.business;

import java.util.List;

import com.deniz.flightinformation.flight.business.domain.FlightDto;


public interface FlightService
{

	/**
	 * Get Flights with default query
	 * @return flights
	 */
	public List<FlightDto> getFlights();

	/**
	 * saves given flight
	 * @param flight
	 */
	public void save( FlightDto flight );

	/**
	 * uses db id to get the flight
	 * @param requestId db id carried by the request
	 * @return single flight
	 */
	public FlightDto getFlightById( String requestId );
}
