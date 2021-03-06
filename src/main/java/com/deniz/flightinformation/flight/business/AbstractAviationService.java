package com.deniz.flightinformation.flight.business;

import com.deniz.flightinformation.flight.persistence.entity.AviationEntity;


/**
 * Base object for all aviation entity business services
 * @author deniz.yavas
 * 
 * @param <E>
 */
public abstract class AbstractAviationService<E extends AviationEntity>
{

	/**
	 * Adds Iata Code of aviation entity if it is not null
	 * @param aviationEntity
	 * @return
	 */
	public String addIfNotNull( E aviationEntity )
	{
		if ( aviationEntity != null )
			return aviationEntity.getIataCode();
		return "";
	}
	
}
