package com.demo.repositories.user;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.demo.models.Email;
import com.demo.models.Pack;

@Repository
public interface PricingRepository extends CrudRepository<Pack, Integer>{
	@Query("from Pack where status = true ")
	public List<Pack> fillAll();
}
