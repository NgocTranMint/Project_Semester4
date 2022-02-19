package com.demo.repositories.admin;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.demo.entites.EmailAjax;
import com.demo.models.Email;


@Repository
public interface EmailRepositoryAdmin extends JpaRepository<Email, Integer> {

	@Query("select new com.demo.entites.EmailAjax(emailId, title, emailUser, fullname, phoneNumber, content, replyContent, sendDate, replyDate, checked, status) from Email where emailId = :emailId")
	public EmailAjax findByIdAjax(@Param("emailId") int emailId);
	
	@Query(value = "SELECT * FROM email q WHERE q.email_user like %?1%",
		    nativeQuery = true)
	public Page<Email> searchByEmailUser(String emailUser, Pageable pageable);
	
}
