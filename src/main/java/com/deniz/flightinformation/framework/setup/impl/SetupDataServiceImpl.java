package com.deniz.flightinformation.framework.setup.impl;

import org.springframework.context.ApplicationListener;
import org.springframework.context.event.ContextRefreshedEvent;

import com.deniz.flightinformation.flight.business.FlightService;
import com.deniz.framework.setup.impl.AbstractSetupDataServiceImpl;


/**
 * Inserts setup data for application
 * @author deniz.yavas
 * 
 */
public class SetupDataServiceImpl extends AbstractSetupDataServiceImpl implements ApplicationListener<ContextRefreshedEvent>
{

	public FlightService flightService;

	public void setFlightService( FlightService flightService )
	{
		this.flightService = flightService;
	}

	@Override
	public void insertData()
	{
	}

}
