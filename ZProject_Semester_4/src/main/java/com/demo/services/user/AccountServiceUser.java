package com.demo.services.user;

import java.util.List;

import org.springframework.data.repository.query.Param;

import com.demo.entites.AccountAjax;
import com.demo.models.Account;

public interface AccountServiceUser {

	public Account findByUsername(String username);
	
	public List<Account> findAllAccount();

	public Account find(int id);

	public Account create(Account account);

	public Account update(Account account);

	public void delete(int id);

	public long countAccountUser();
	
	public AccountAjax findByIdAjax(int id);
	
	public Account findByEmail(String email);
}
