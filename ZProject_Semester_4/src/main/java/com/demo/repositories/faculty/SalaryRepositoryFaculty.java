package com.demo.repositories.faculty;

import java.util.List;

import javax.websocket.server.PathParam;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.demo.models.Salary;

@Repository
public interface SalaryRepositoryFaculty extends JpaRepository<Salary, Integer> {


	
	@Query("from Salary where account.accountId = :accountId and acceptPayment = 1 order by createDate desc")
	public List<Salary> findAllSalaryByAccountId(@Param("accountId") int accountId); 
}
