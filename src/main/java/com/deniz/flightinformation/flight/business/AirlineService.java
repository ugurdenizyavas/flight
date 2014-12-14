package com.deniz.flightinformation.flight.business;

import com.deniz.flightinformation.flight.persistence.entity.AirlineEntity;

public interface AirlineService {

	/**
	 * Implemented in {@link AbstractAviationService}
	 * @param airport
	 * @return
	 */
	String addIfNotNull(AirlineEntity airline);

}
