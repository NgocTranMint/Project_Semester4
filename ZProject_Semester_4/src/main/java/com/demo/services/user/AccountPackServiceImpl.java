package com.demo.services.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.demo.models.AccountPack;
import com.demo.repositories.user.AccountPackRepository;

@Service
public class AccountPackServiceImpl implements AccountPackService{

	@Autowired
	private AccountPackRepository accountPackRepository;
	
	@Override
	public AccountPack save(AccountPack accountPack) {
		return accountPackRepository.save(accountPack);
	}

}
