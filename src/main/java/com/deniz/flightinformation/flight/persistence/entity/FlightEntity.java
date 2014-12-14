package com.deniz.flightinformation.flight.persistence.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;


@Entity
@Table( name = "FIFLIGHTS" )
public class FlightEntity
{

	private int id;
	private String flightNo;
	private Date scheduledTime;
	private AirlineEntity airline;
	private int domIntType;
	private AirportEntity previousNextAirport;
	private AirportEntity airport;
	private String type;
	private AirportEntity fromToAirport;

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
	@JoinColumn( name = "AIRLINEID" )
	public AirlineEntity getAirline()
	{
		return airline;
	}

	public void setAirline( AirlineEntity airline )
	{
		this.airline = airline;
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

	@Column( name = "FLIGHTNO", length = 7 )
	public String getFlightNo()
	{
		return flightNo;
	}

	public void setFlightNo( String flightNo )
	{
		this.flightNo = flightNo;
	}

	@Temporal( TemporalType.TIMESTAMP )
	@Column( name = "SCHEDULEDTIME" )
	public Date getScheduledTime()
	{
		return scheduledTime;
	}

	public void setScheduledTime( Date scheduledTime )
	{
		this.scheduledTime = scheduledTime;
	}

	@Column( name = "TYPE", length = 1 )
	public String getType()
	{
		return type;
	}

	public void setType( String type )
	{
		this.type = type;
	}

	@Column( name = "DOMINTTYPE" )
	public int getDomIntType()
	{
		return domIntType;
	}

	public void setDomIntType( int domIntType )
	{
		this.domIntType = domIntType;
	}

	@ManyToOne
	@JoinColumn( name = "PREVIOUSNEXTAIRPORT" )
	public AirportEntity getPreviousNextAirport()
	{
		return previousNextAirport;
	}

	public void setPreviousNextAirport( AirportEntity previousNextAirport )
	{
		this.previousNextAirport = previousNextAirport;
	}

	@ManyToOne
	@JoinColumn( name = "FROMTOAIRPORT" )
	public AirportEntity getFromToAirport()
	{
		return fromToAirport;
	}

	public void setFromToAirport( AirportEntity fromToAirport )
	{
		this.fromToAirport = fromToAirport;
	}

}
