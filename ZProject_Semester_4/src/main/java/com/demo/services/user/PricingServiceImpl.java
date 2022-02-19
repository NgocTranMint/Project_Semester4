package com.demo.services.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.demo.models.Pack;
import com.demo.repositories.user.PricingRepository;

@Service
public class PricingServiceImpl implements PricingService{

	@Autowired
	private PricingRepository pricingRepository;
	
	@Override
	public Iterable<Pack> findAll() {
		return pricingRepository.fillAll();
	}

	@Override
	public Pack findById(int packId) {
		return pricingRepository.findById(packId).get();
	}

}
