package com.demo.repositories.admin;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.demo.models.Account;
import com.demo.models.Quiz;
import com.demo.entites.AccountAjax;

@Repository
public interface AccountRepositoryAdmin extends JpaRepository<Account, Integer> {

	@Query("from Account where username = :username")
	public Account findByUsername(@Param("username") String username);

	@Query("select new com.demo.entites.AccountAjax(accountId, username, password, fullname, email, dob, addr, gender, phone, avatar, status, createDate) from Account where accountId = :accountId")
	public AccountAjax findByIdAjax(@Param("accountId") int accountId);

	@Query("from Account where fullname like %:fullname%")
	public List<Account> searchByFullname(Pageable pageable, @Param("fullname") String fullname);
	
	@Query(value = "SELECT * FROM account q WHERE q.fullname like %?1%",
		    nativeQuery = true)
	public Page<Account> searchByFullname2(String fullname, Pageable pageable);

	@Query("select new com.demo.entites.AccountAjax(accountId, username, password, fullname, email, dob, addr, gender, phone, avatar, status, createDate) from Account where year(createDate) = :year and month(createDate) = :month")
	public List<AccountAjax> findThisYear(@Param("year") int year,@Param("month") int month);

}
