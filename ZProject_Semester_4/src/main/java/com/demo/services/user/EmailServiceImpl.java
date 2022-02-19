package com.demo.services.user;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.demo.models.Email;
import com.demo.repositories.user.EmailRepository;

@Service
public class EmailServiceImpl implements EmailService{

	@Autowired
	private EmailRepository mailRepository;
	
	@Override
	public Email save(Email email) {
		return mailRepository.save(email);
	}

//	@Override
//	public List<Product> listProduct() {
//		List<Product> products = new ArrayList<Product>();
//		products.add(new Product("P01", "Product's name 1", 0.9, 2));
//		products.add(new Product("P02", "Product's name 2", 1.5, 2));
//		
//		return products;
//	}

}
