package com.project.payroll.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import com.project.payroll.entity.Employee;

public class EmployeeDAOImpl implements EmployeeDAO {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	@Transactional
	public List<Employee> getEmployee() {
		
		Session currentSession = sessionFactory.getCurrentSession();
	    
		Query query = currentSession.createQuery("from Customer");
		List<Employee> empList = query.list();
		
		return empList;
	}
 
}
