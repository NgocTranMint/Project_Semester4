package com.demo.services.user;

import java.util.List;

import com.demo.models.Pack;

public interface PricingService {

	public Iterable<Pack> findAll();
	
	public Pack findById(int packId);
}
