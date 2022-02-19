package com.demo.services.user;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.demo.entites.AccountAjax;
import com.demo.models.Account;
import com.demo.models.Role;
import com.demo.repositories.user.AccountRepositoryUser;

@Service
public class AccountSeviceUserImpl implements AccountServiceUser{

	@Autowired
	private AccountRepositoryUser accountRepository;
	
	@Override
	public Account findByUsername(String username) {
		
		return accountRepository.findByUsername(username);
	}
	
	@Override
	public Account find(int id) {
		return accountRepository.findById(id).get();
	}
	
	// this method was not be completed!
	@Override
	public Account create(Account account) {
		
		return accountRepository.save(account);
	}
	
	// this method was not be completed!
	@Override
	public Account update(Account account) {
		
		return accountRepository.save(account);
		
	}

	@Override
	public void delete(int id) {
		accountRepository.deleteById(id);
	}

	@Override
	public List<Account> findAllAccount() {
		
		return (List<Account>) accountRepository.findAll();
	}

	@Override
	public long countAccountUser() {
		return accountRepository.count();
	}

	@Override
	public AccountAjax findByIdAjax(int id) {
		return accountRepository.findByIdAjax(id);
	}

	@Override
	public Account findByEmail(String email) {
		return accountRepository.findByEmail(email);
	}

}
