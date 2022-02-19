package com.demo.services.admin;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.repository.query.Param;

import com.demo.models.Salary;

public interface SalaryServiceAdmin {

	
	public List<Salary> findAllSalary();

	public Salary findNewestSalary();
	
	public Salary findNewestSalaryByAccountId(int accountId); 
	
	public Salary findById(int id);

	public Salary create(Salary Salary);

	public Salary update(Salary Salary);

	public void deleteById(int id);

//	public SalaryAjax findByIdAjax(int SalaryId);
//	
	public double sumfacultysalarybyyearandmonth(int year,int month);

	public Page<Salary> getPage(int currentPage, int pageSize, String sort);
	
	public Page<Salary> searchByUsername(int currentPage, int pageSize, String sort, String username);

	public List<Salary> facultysalarybyyearandmonth(int accountId, int year, int month);
}
