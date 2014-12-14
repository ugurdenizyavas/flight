package tester;

import java.util.List;

import org.junit.Assert;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;

import com.deniz.flightinformation.flight.business.FlightService;
import com.deniz.flightinformation.flight.business.domain.FlightDto;

@ContextConfiguration(locations = {"/spring/0.spring.xml"})
public class TestFlight
{
	
	@Autowired
	FlightService flightService;
	
	@Test
	public void testGetAllFlights()
	{
		List<FlightDto> flights = flightService.getFlights();
		Assert.assertEquals( flights.size(), 1 );
	}

	@Test
	public void testFailFlights()
	{
		Assert.assertEquals( false, true );
	}
}
