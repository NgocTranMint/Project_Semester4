package com.demo.repositories.admin;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.demo.entites.PackAjax;
import com.demo.models.Pack;

@Repository
public interface PackRepositoryAdmin extends JpaRepository<Pack, Integer> {


	@Query("select new com.demo.entites.PackAjax(packId, title, expiry, fee, description, status) from Pack where packId = :packId  ")
	public PackAjax findByIdAjax(@Param("packId") int packId);
	
	@Query("from Pack where status = true ")
	public List<Pack> fillAll();
	
}
