package com.deniz.flightinformation.flight.business.impl;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.transaction.annotation.Transactional;

import com.deniz.flightinformation.flight.business.AirlineService;
import com.deniz.flightinformation.flight.business.AirportService;
import com.deniz.flightinformation.flight.business.FlightService;
import com.deniz.flightinformation.flight.business.domain.FlightDto;
import com.deniz.flightinformation.flight.persistence.FlightDao;
import com.deniz.flightinformation.flight.persistence.entity.FlightEntity;


public class FlightServiceImpl implements FlightService
{

	private FlightDao flightDao;
	private AirportService airportService;
	private AirlineService airlineService;

	@Required
	public void setAirportService( AirportService airportService )
	{
		this.airportService = airportService;
	}

	@Required
	public void setFlightDao( FlightDao flightDao )
	{
		this.flightDao = flightDao;
	}

	@Required
	public void setAirlineService( AirlineService airlineService )
	{
		this.airlineService = airlineService;
	}

	@Override
	@Transactional
	public List<FlightDto> getFlights()
	{
		List<FlightDto> flightDtoList = new ArrayList<FlightDto>();
		List<FlightEntity> flights = flightDao.getFlights();
		for ( FlightEntity flightEntity : flights )
		{
			FlightDto flightDto = convertEntityToDto( flightEntity );
			flightDtoList.add( flightDto );
		}
		return flightDtoList;
	}

	private FlightDto convertEntityToDto( FlightEntity flightEntity )
	{
		FlightDto flightDto = new FlightDto();

		flightDto.setId( flightEntity.getId() + "" );

		String flightType = flightEntity.getType();
		if ( StringUtils.equals( flightType, "A" ) )
		{
			flightDto.getTypeMeta().setValue( flightType );
			flightDto.getFromMeta().setValue( airportService.addIfNotNull( flightEntity.getFromToAirport() ) );
			flightDto.getDestinationMeta().setValue( airportService.addIfNotNull( flightEntity.getAirport() ) );
		}
		else
		{
			flightDto.getTypeMeta().setValue( flightType );
			flightDto.getFromMeta().setValue( airportService.addIfNotNull( flightEntity.getAirport() ) );
			flightDto.getDestinationMeta().setValue( airportService.addIfNotNull( flightEntity.getFromToAirport() ) );
		}
		flightDto.getCategoryCodeMeta().setValue( flightEntity.getDomIntType() + "" );
		flightDto.getFlightNumberMeta().setValue( airlineService.addIfNotNull( flightEntity.getAirline() ) + " " + flightEntity.getFlightNo() );
		flightDto.getScheduledTimeMeta().setValue( flightEntity.getScheduledTime() + "" );
		flightDto.getViaMeta().setValue( airportService.addIfNotNull( flightEntity.getPreviousNextAirport() ) );
		return flightDto;
	}

	@Override
	@Transactional
	public void save( FlightDto flight )
	{
		FlightEntity flightEntity = new FlightEntity();
		// TODO: Add save method
		flightDao.save( flightEntity );
	}

	@Override
	@Transactional( readOnly = true )
	public FlightDto getFlightById( String id )
	{
		FlightEntity flightEntity = flightDao.getById( Integer.parseInt( id ) );
		FlightDto flightDto = convertEntityToDto( flightEntity );
		return flightDto;
	}

}
