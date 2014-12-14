package com.deniz.flightinformation.flight.persistence.entity;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.MappedSuperclass;


/**
 * Base entity for all aviation entities. Can not be instantiated.
 * @author deniz.yavas
 * 
 */
@MappedSuperclass
public class AviationEntity
{

	private int id;
	private String iataCode;

	@Id
	@Column( name = "ID" )
	public int getId()
	{
		return id;
	}

	@Column( name = "IATACODE" )
	public String getIataCode()
	{
		return iataCode;
	}

	public void setId( int id )
	{
		this.id = id;
	}

	public void setIataCode( String iataCode )
	{
		this.iataCode = iataCode;
	}

}
