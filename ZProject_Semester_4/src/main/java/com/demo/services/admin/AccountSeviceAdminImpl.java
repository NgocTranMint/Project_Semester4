package com.demo.services.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;

import org.springframework.data.domain.Sort;

import org.springframework.stereotype.Service;

import com.demo.entites.AccountAjax;
import com.demo.models.Account;
import com.demo.repositories.admin.AccountRepositoryAdmin;

@Service
public class AccountSeviceAdminImpl implements AccountServiceAdmin{

	@Autowired
	private AccountRepositoryAdmin accountRepositoryAdmin;
	
	@Override
	public Account findByUsername(String username) {
		
		return accountRepositoryAdmin.findByUsername(username);
	}
	
	@Override
	public Account findById(int id) {
		return accountRepositoryAdmin.findById(id).get();
	}
	
	// this method was not be completed!
	@Override
	public Account create(Account account) {
		account.setStatus(true);
		return accountRepositoryAdmin.save(account);
	}
	
	// this method was not be completed!
	@Override
	public Account update(Account account) {
		return accountRepositoryAdmin.save(account);
	}

	@Override
	public void deleteById(int id) {
		accountRepositoryAdmin.deleteById(id);
	}

	@Override
	public List<Account> findAllAccount() {
		
		return (List<Account>) accountRepositoryAdmin.findAll();

	}


	@Override
	public AccountAjax findByIdAjax(int accountId) {
		return accountRepositoryAdmin.findByIdAjax(accountId);
	}

	 public Page<Account> getPage(int currentPage, int pageSize, String sort){
		 Pageable pageable = PageRequest.of(currentPage - 1, pageSize, Sort.by(sort).descending());
			return this.accountRepositoryAdmin.findAll(pageable);
	    }

	@Override
	public List<Account> searchByFullname(Pageable pageable, String fullname) {
		return accountRepositoryAdmin.searchByFullname(pageable, fullname);
	}

	@Override
	public Page<Account> getPageSearch(int currentPage, int pageSize, String sort, String fullname) {
		Pageable pageable = PageRequest.of(currentPage - 1, pageSize, Sort.by(sort).descending());
		return (Page<Account>) this.accountRepositoryAdmin.searchByFullname(pageable, fullname);
	}

	@Override
	public Page<Account> searchByFullname2(int currentPage, int pageSize, String sort, String fullname) {
		Pageable pageable = PageRequest.of(currentPage - 1, pageSize, Sort.by(sort).descending());
		return this.accountRepositoryAdmin.searchByFullname2(fullname, pageable);

	}
	public List<AccountAjax> findThisYear(int year,int month) {
		// TODO Auto-generated method stub
		return accountRepositoryAdmin.findThisYear(year,month);
	}

}
