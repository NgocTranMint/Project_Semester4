package com.demo.services;

import org.springframework.security.core.userdetails.UserDetailsService;

import com.demo.models.Account;

public interface AccountService extends UserDetailsService {

		public Account save(Account account);
		
		public Account findByUsername(String username);
		
		public Account findById(int accountId);
		
		public Account update(Account account);
}
