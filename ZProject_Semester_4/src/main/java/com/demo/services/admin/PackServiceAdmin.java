package com.demo.services.admin;

import java.util.List;

import org.springframework.data.domain.Page;

import com.demo.entites.PackAjax;
import com.demo.models.Pack;
import com.demo.models.Pay;
public interface PackServiceAdmin {

	public List<Pack> findAllPack();

	public Pack findById(int id);

	public Pack create(Pack pack);

	public Pack update(Pack pack);

	public void deleteById(int id);

	public PackAjax findByIdAjax(int packId);
	

	public Page<Pack> getPage(int currentPage, int pageSize, String sort);
		
}
