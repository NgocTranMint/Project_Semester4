package com.demo.services.faculty;

import java.util.List;


import com.demo.models.Salary;

public interface SalaryServiceFaculty {

	
	public List<Salary> findAllSalaryByAccountId(int accountId);

	

}
