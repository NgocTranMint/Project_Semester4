package com.demo.services.admin;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.demo.entites.EmailAjax;
import com.demo.models.Email;
public interface EmailServiceAdmin {

	public List<Email> findAllEmail();

	public Email findById(int id);

	public Email create(Email email);

	public Email update(Email email);

	public void deleteById(int id);

	public EmailAjax findByIdAjax(int EmailId);
	

	public Page<Email> getPage(int currentPage, int pageSize, String sort);
	
	public Page<Email> searchByEmailUser(int currentPage, int pageSize, String sort, String emailUser);
		
}
