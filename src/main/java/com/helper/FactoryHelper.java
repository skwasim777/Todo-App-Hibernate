package com.helper;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class FactoryHelper {
	private static SessionFactory factory;

	public static SessionFactory getFactory() {
		if (factory == null) {
			factory = new Configuration().configure("hiber.cfg.xml").buildSessionFactory();
		}
		return factory;
	}
	public void closeFactory() {
		if(factory.isOpen()) {
			factory.close();
		}
	}
}
