package com.demo.services.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;

import org.springframework.data.domain.Sort;

import org.springframework.stereotype.Service;

import com.demo.models.Salary;
import com.demo.repositories.admin.SalaryRepositoryAdmin;

@Service
public class SalaryServiceAdminImpl implements SalaryServiceAdmin{

	@Autowired
	private SalaryRepositoryAdmin salaryRepositoryAdmin;
	
	
	
	@Override
	public Salary findById(int id) {
		return salaryRepositoryAdmin.findById(id).get();
	}
	
	// this method was not be completed!
	@Override
	public Salary create(Salary Salary) {
		return salaryRepositoryAdmin.save(Salary);
	}
	
	// this method was not be completed!
	@Override
	public Salary update(Salary Salary) {
		
		return salaryRepositoryAdmin.save(Salary);
		
	}

	@Override
	public void deleteById(int id) {
		salaryRepositoryAdmin.deleteById(id);
	}

	@Override
	public List<Salary> findAllSalary() {
		
		return (List<Salary>) salaryRepositoryAdmin.findAll();

	}




	 public Page<Salary> getPage(int currentPage, int pageSize, String sort){
		 Pageable pageable = PageRequest.of(currentPage - 1, pageSize, Sort.by(sort).descending());
			return this.salaryRepositoryAdmin.findAll(pageable);
	    }

	@Override
	public Salary findNewestSalary() {
		return salaryRepositoryAdmin.findNewestSalary();
	}

	@Override
	public Salary findNewestSalaryByAccountId(int accountId) {
		return salaryRepositoryAdmin.findNewestSalaryByAccountId(accountId);
	}

	@Override
	public double sumfacultysalarybyyearandmonth(int year, int month) {
		// TODO Auto-generated method stub
		return salaryRepositoryAdmin.sumfacultysalarybyyearandmonth(year, month);}
	
	public Page<Salary> searchByUsername(int currentPage, int pageSize, String sort, String username) {
		Pageable pageable = PageRequest.of(currentPage - 1, pageSize, Sort.by(sort).descending());
		return this.salaryRepositoryAdmin.searchByUsername(username, pageable);
	}

	@Override
	public List<Salary> facultysalarybyyearandmonth(int accountId, int year, int month) {
		// TODO Auto-generated method stub
		return salaryRepositoryAdmin.facultysalarybyyearandmonth(accountId, year, month);
	}

}
