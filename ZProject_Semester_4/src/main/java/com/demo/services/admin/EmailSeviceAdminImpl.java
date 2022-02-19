package com.demo.services.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.demo.entites.EmailAjax;
import com.demo.models.Email;
import com.demo.repositories.admin.EmailRepositoryAdmin;

@Service
public class EmailSeviceAdminImpl implements EmailServiceAdmin{

	@Autowired
	private EmailRepositoryAdmin emailRepositoryAdmin;

	@Override
	public Email findById(int id) {
		return emailRepositoryAdmin.findById(id).get();
	}
	
	// this method was not be completed!
	@Override
	public Email create(Email Email) {
		Email.setStatus(true);
		return emailRepositoryAdmin.save(Email);
	}
	
	// this method was not be completed!
	@Override
	public Email update(Email Email) {
		
		return emailRepositoryAdmin.save(Email);
		
	}

	@Override
	public void deleteById(int id) {
		emailRepositoryAdmin.deleteById(id);
	}

	@Override
	public List<Email> findAllEmail() {
		
		return (List<Email>) emailRepositoryAdmin.findAll();

	}


	@Override
	public EmailAjax findByIdAjax(int EmailId) {
		return emailRepositoryAdmin.findByIdAjax(EmailId);
	}

	 public Page<Email> getPage(int currentPage, int pageSize, String sort){
		 Pageable pageable = PageRequest.of(currentPage - 1, pageSize, Sort.by(sort).descending());
			return this.emailRepositoryAdmin.findAll(pageable);
	    }

	@Override
	public Page<Email> searchByEmailUser(int currentPage, int pageSize, String sort, String emailUser) {
		Pageable pageable = PageRequest.of(currentPage - 1, pageSize, Sort.by(sort).descending());
		return this.emailRepositoryAdmin.searchByEmailUser(emailUser, pageable);
	}

	
	
	
	
	

}
