package com.hotel.ults;

import java.io.Serializable;
import java.util.Properties;
import java.util.Random;
import java.util.stream.Stream;

import org.hibernate.HibernateException;
import org.hibernate.MappingException;
import org.hibernate.engine.spi.SharedSessionContractImplementor;
import org.hibernate.id.UUIDGenerator;
import org.hibernate.service.ServiceRegistry;
import org.hibernate.type.Type;

public class StringIdGenerator extends UUIDGenerator {

	private String valuePrefix = random();
	private String valueNumber = "";
	private String valueId = "";

	@Override
	public Serializable generate(SharedSessionContractImplementor session, Object obj) throws HibernateException {
		String query = String.format("select %s from %s", valueId, obj.getClass().getSimpleName());
		Stream<String> ids = session.createQuery(query, String.class).stream();
		Long max = ids.map(o -> o.replace(valuePrefix, "")).mapToLong(Long::parseLong).max().orElse(0L);
		return valuePrefix + (String.format(valueNumber, max + 1));
	}

	@Override
	public void configure(Type type, Properties params, ServiceRegistry serviceRegistry) throws MappingException {
		// TODO Auto-generated method stub
		valuePrefix = params.getProperty("prefix");
		valueNumber = params.getProperty("number");
		valueId = params.getProperty("id");
	}

	private String random() {
		Random rnd = new Random();
		int n = 1000 + rnd.nextInt(9000);
		String str = n + "-" + n;
		return str;
	}
}

