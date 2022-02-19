package com.demo.services.admin;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import org.springframework.data.repository.query.Param;

import com.demo.entites.AccountAjax;
import com.demo.models.Account;

public interface AccountServiceAdmin {

	public Account findByUsername(String username);
	
	public List<Account> findAllAccount();

	public Account findById(int id);

	public Account create(Account account);

	public Account update(Account account);

	public void deleteById(int id);

	public AccountAjax findByIdAjax(int accountId);
	
	public List<AccountAjax> findThisYear(int year,int month);

	public Page<Account> getPage(int currentPage, int pageSize, String sort);
	public Page<Account> getPageSearch(int currentPage, int pageSize, String sort, String fullname);
	public Page<Account> searchByFullname2(int currentPage, int pageSize, String sort, String fullname);
	
	public List<Account> searchByFullname(Pageable pageable, String fullname);

}
