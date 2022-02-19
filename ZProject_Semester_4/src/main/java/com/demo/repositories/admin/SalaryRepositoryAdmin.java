package com.demo.repositories.admin;

import java.util.List;

import javax.websocket.server.PathParam;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.demo.models.Account;
import com.demo.models.Salary;

@Repository
public interface SalaryRepositoryAdmin extends JpaRepository<Salary, Integer> {


	@Query(value = "select * from Salary order by salary_id desc limit 1", nativeQuery = true)
	public Salary findNewestSalary(); 
	
	@Query(value = "select * from Salary where account_id = :accountId order by salary_id desc limit 1", nativeQuery = true)
	public Salary findNewestSalaryByAccountId(@Param("accountId") int accountId); 
	
	@Query("select sum(salary) from Salary where year(createDate) = :year and month(createDate) = :month")
	public double sumfacultysalarybyyearandmonth(@Param("year") int year,@Param("month") int month);
	
	@Query("from Salary where account_id = :accountId and year(createDate) = :year and month(createDate) = :month")
	public List<Salary> facultysalarybyyearandmonth(@Param("accountId") int accountId,@Param("year") int year,@Param("month") int month);

	@Query(value = "Select * From salary b inner join account a on b.account_id = a.account_id where a.username like %:username%",
			nativeQuery = true)
	public Page<Salary> searchByUsername(String username, Pageable pageable);
}
