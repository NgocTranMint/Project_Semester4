package com.demo.services.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;

import org.springframework.data.domain.Sort;

import org.springframework.stereotype.Service;

import com.demo.models.Role;
import com.demo.entites.RoleAjax;
import com.demo.repositories.admin.RoleRepositoryAdmin;

@Service
public class RoleServiceAdminImpl implements RoleServiceAdmin{

	@Autowired
	private RoleRepositoryAdmin RoleRepositoryAdmin;
	
	
	
	@Override
	public Role findById(int id) {
		return RoleRepositoryAdmin.findById(id).get();
	}
	
	// this method was not be completed!
	@Override
	public Role create(Role Role) {
		Role.setStatus(true);
		return RoleRepositoryAdmin.save(Role);
	}
	
	// this method was not be completed!
	@Override
	public Role update(Role Role) {
		
		return RoleRepositoryAdmin.save(Role);
		
	}

	@Override
	public void deleteById(int id) {
		RoleRepositoryAdmin.deleteById(id);
	}

	@Override
	public List<Role> findAllRole() {
		
		return (List<Role>) RoleRepositoryAdmin.findAll();

	}


	@Override
	public RoleAjax findByIdAjax(int RoleId) {
		return RoleRepositoryAdmin.findByIdAjax(RoleId);
	}

	 public Page<Role> getPage(int currentPage, int pageSize, String sort){
		 Pageable pageable = PageRequest.of(currentPage - 1, pageSize, Sort.by(sort).descending());
			return this.RoleRepositoryAdmin.findAll(pageable);
	    }

}
