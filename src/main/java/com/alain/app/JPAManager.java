package com.alain.app;

import java.text.ParseException;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;

public class JPAManager {

	protected EntityManager entityManager;
	
	public JPAManager(EntityManager entityManager){
		this.entityManager  = entityManager;
	}
	
	public void insertSampleData(){
		EntityTransaction transaction = entityManager.getTransaction();
		transaction.begin();

		try {
		
		
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		transaction.commit();
	}
	
}
