package com.deniz.flightinformation.flight.persistence.impl;

import java.util.List;

import org.hibernate.Criteria;


import com.deniz.flightinformation.flight.persistence.AirportDao;
import com.deniz.flightinformation.flight.persistence.entity.OperatedAirportEntity;
import com.deniz.framework.persistence.DaoTemplate;

public class AirportDaoImpl extends DaoTemplate implements AirportDao {

	@Override
	public List<OperatedAirportEntity> getOperatedAirports() {
		Criteria criteria = getCurrentSession().createCriteria(OperatedAirportEntity.class);
		criteria.createCriteria("airport").setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);
		return criteria.list();
	}

}
