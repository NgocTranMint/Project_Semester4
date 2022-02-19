package com.demo.services;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.demo.models.Account;
import com.demo.models.Role;
import com.demo.repositories.user.AccountRepositoryUser;

@Service
public class AccountSeviceImpl implements AccountService{
	
	@Autowired
	private AccountRepositoryUser accountRepository;
	
	@Override
	public Account save(Account account) {
		return accountRepository.save(account);
	}

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		Account account = accountRepository.findByUsername(username);
		if(account == null) {
			throw new UsernameNotFoundException("UsernameNotFound");
		}else {
			List<GrantedAuthority> grantedAuthorities = new ArrayList<GrantedAuthority>();
			for (Role role : account.getRoles()) {
				grantedAuthorities.add(new SimpleGrantedAuthority(role.getRoleName()));
			}
			return new User(account.getUsername(), account.getPassword(), grantedAuthorities);
		}
	}

	@Override
	public Account findByUsername(String username) {
		return accountRepository.findByUsername(username);
	}

	@Override
	public Account findById(int accountId) {
		return accountRepository.findById(accountId).get();
	}

	@Override
	public Account update(Account account) {
		return accountRepository.save(account);
	}

}
