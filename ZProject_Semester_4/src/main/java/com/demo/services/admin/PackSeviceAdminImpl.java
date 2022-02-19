package com.demo.services.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.demo.entites.PackAjax;
import com.demo.entites.PayAjax;
import com.demo.models.Pack;
import com.demo.models.Pay;
import com.demo.repositories.admin.PackRepositoryAdmin;

@Service
public class PackSeviceAdminImpl implements PackServiceAdmin{

	@Autowired
	private PackRepositoryAdmin packRepositoryAdmin;

	@Override
	public Pack findById(int id) {
		return packRepositoryAdmin.findById(id).get();
	}
	
	// this method was not be completed!
	@Override
	public Pack create(Pack pack) {
		pack.setStatus(true);
		return packRepositoryAdmin.save(pack);
	}
	
	// this method was not be completed!
	@Override
	public Pack update(Pack pack) {
		
		return packRepositoryAdmin.save(pack);
		
	}

	@Override
	public void deleteById(int id) {
		packRepositoryAdmin.deleteById(id);
	}

	@Override
	public List<Pack> findAllPack() {
		
		return  packRepositoryAdmin.fillAll();

	}


	@Override
	public PackAjax findByIdAjax(int PayId) {
		return packRepositoryAdmin.findByIdAjax(PayId);
	}

	 public Page<Pack> getPage(int currentPage, int pageSize, String sort){
		 Pageable pageable = PageRequest.of(currentPage - 1, pageSize, Sort.by(sort).descending());
			return this.packRepositoryAdmin.findAll(pageable);
	    }

	

	
	
	

}
