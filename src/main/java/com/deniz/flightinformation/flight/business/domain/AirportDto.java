package com.deniz.flightinformation.flight.business.domain;

import com.deniz.framework.dto.AbstractDto;
import com.deniz.framework.dto.Meta;

public class AirportDto extends AbstractDto {

	private Meta iataCodeMeta = new Meta();

	public Meta getIataCodeMeta() {
		return iataCodeMeta;
	}

	@Override
	public String getInfo() {
		return iataCodeMeta.getValue();
	}

}
