package com.demo.repositories.user;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.demo.models.Pay;

@Repository
public interface PayRepository extends CrudRepository<Pay, Integer>{

	@Query("from Pay where account.accountId = :accountId")
	public List<Pay> findAllByAccountId(@Param("accountId") int accountId);
	
}
