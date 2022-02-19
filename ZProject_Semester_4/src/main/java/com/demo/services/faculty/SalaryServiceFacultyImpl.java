package com.demo.services.faculty;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;

import org.springframework.data.domain.Sort;

import org.springframework.stereotype.Service;

import com.demo.models.Salary;
import com.demo.repositories.admin.SalaryRepositoryAdmin;
import com.demo.repositories.faculty.SalaryRepositoryFaculty;

@Service
public class SalaryServiceFacultyImpl implements SalaryServiceFaculty{

	@Autowired
	private SalaryRepositoryFaculty salaryRepositoryFaculty;

	@Override
	public List<Salary> findAllSalaryByAccountId(int accountId) {
		return salaryRepositoryFaculty.findAllSalaryByAccountId(accountId);
	}
	
	
	
	
}
