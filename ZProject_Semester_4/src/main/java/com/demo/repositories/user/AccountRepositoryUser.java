package com.demo.repositories.user;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.demo.entites.AccountAjax;
import com.demo.models.Account;



@Repository
public interface AccountRepositoryUser extends CrudRepository<Account, Integer> {

	@Query("from Account where username = :username")
	public Account findByUsername(@Param("username") String username);
	
	@Query("select new com.demo.entites.AccountAjax(accountId, username, password, fullname, email, dob, addr, gender, phone, avatar, status, createDate) from Account where accountId = :accountId")
	public AccountAjax findByIdAjax(@Param("accountId") int accountId);
	
	@Query("from Account where email = :email")
	public Account findByEmail(@Param("email") String email);
}
