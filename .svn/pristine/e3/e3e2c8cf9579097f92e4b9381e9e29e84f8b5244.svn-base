package com.deniz.flightinformation.flight.business.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Required;
import org.springframework.transaction.annotation.Transactional;

import com.deniz.flightinformation.flight.business.AbstractAviationService;
import com.deniz.flightinformation.flight.business.AirportService;
import com.deniz.flightinformation.flight.business.domain.AirportDto;
import com.deniz.flightinformation.flight.persistence.AirportDao;
import com.deniz.flightinformation.flight.persistence.entity.AirportEntity;
import com.deniz.flightinformation.flight.persistence.entity.OperatedAirportEntity;


public class AirportServiceImpl extends AbstractAviationService<AirportEntity> implements AirportService {

	private AirportDao airportDao;

	@Required
	public void setAirportDao(AirportDao airportDao) {
		this.airportDao = airportDao;
	}

	@Transactional(readOnly=true)
	@Override
	public List<AirportDto> getOperatedAirports() {
		List<AirportDto> operatedAirportsDto = new ArrayList<AirportDto>();
		List<OperatedAirportEntity> operatedAirports = airportDao.getOperatedAirports();
		for (OperatedAirportEntity operatedAirportEntity : operatedAirports) {
			AirportDto airportDto = new AirportDto();
			airportDto.getIataCodeMeta().setValue(addIfNotNull(operatedAirportEntity.getAirport()));
			operatedAirportsDto.add(airportDto);
		}
		return operatedAirportsDto;
	}

}
