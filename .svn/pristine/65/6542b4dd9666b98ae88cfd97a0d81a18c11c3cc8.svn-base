package com.deniz.flightinformation.flight.business;

import java.util.List;

import com.deniz.flightinformation.flight.business.domain.AirportDto;
import com.deniz.flightinformation.flight.persistence.entity.AirportEntity;


public interface AirportService
{

	/**
	 * get operated airports by the company
	 * @return
	 */
	public List<AirportDto> getOperatedAirports();

	/**
	 * Implemented in {@link AbstractAviationService}
	 * @param airport
	 * @return
	 */
	public String addIfNotNull( AirportEntity airport );

}
