package com.demo.services.admin;

import java.util.List;

import org.springframework.data.domain.Page;

import com.demo.entites.RoleAjax;
import com.demo.models.Role;

public interface RoleServiceAdmin {

	
	public List<Role> findAllRole();

	public Role findById(int id);

	public Role create(Role role);

	public Role update(Role role);

	public void deleteById(int id);

	public RoleAjax findByIdAjax(int roleId);
	

	public Page<Role> getPage(int currentPage, int pageSize, String sort);

}
