package com.deniz.flightinformation.flight.persistence.impl;

import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;


import com.deniz.flightinformation.flight.persistence.FlightDao;
import com.deniz.flightinformation.flight.persistence.entity.FlightEntity;
import com.deniz.framework.persistence.DaoTemplate;

public class FlightDaoImpl extends DaoTemplate implements FlightDao {

	@SuppressWarnings("unchecked")
	@Override
	public List<FlightEntity> getFlights() {
		Criteria criteria = getCurrentSession().createCriteria(FlightEntity.class);
		
		GregorianCalendar calendar = new GregorianCalendar();
		calendar.add(calendar.MINUTE, -30);
		Date now = calendar.getTime();

		// Advance the calendar one day:
		calendar.add(calendar.MINUTE, 90);
		Date tomorrow = calendar.getTime();

		criteria.add(Restrictions.gt("scheduledTime", now));

		criteria.add(Restrictions.lt("scheduledTime", tomorrow));

		criteria.addOrder(Order.asc("scheduledTime"));
		return criteria.list();
	}

	@Override
	public void save(FlightEntity flightEntity) {
		getCurrentSession().save(flightEntity);
	}

	@Override
	public FlightEntity getById(int id) {
		Criteria criteria = getCurrentSession().createCriteria(FlightEntity.class);
		criteria.add(Restrictions.gt("id", id));
		return (FlightEntity) criteria.list().get(0);
	}

}
