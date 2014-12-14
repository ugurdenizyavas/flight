package com.deniz.flightinformation.flight.persistence.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;


@Entity
@Table( name = "FIOPERATEDAIRPORTS" )
public class OperatedAirportEntity
{

	private int id;
	private AirportEntity airport;

	@Id
	@Column( name = "ID" )
	public int getId()
	{
		return id;
	}

	public void setId( int id )
	{
		this.id = id;
	}

	@ManyToOne
	@JoinColumn( name = "AIRPORTID" )
	public AirportEntity getAirport()
	{
		return airport;
	}

	public void setAirport( AirportEntity airport )
	{
		this.airport = airport;
	}

}
