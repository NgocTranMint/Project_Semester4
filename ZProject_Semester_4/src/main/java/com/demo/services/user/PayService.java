package com.demo.services.user;

import java.util.List;

import com.demo.models.Pay;

public interface PayService {
	
	public Pay save(Pay pay);
	
	public List<Pay> findAllByAccountId(int accountId);
	
	public Pay findById(int payId);
}
