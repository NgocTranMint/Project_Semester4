package com.demo.repositories.admin;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.demo.entites.RoleAjax;
import com.demo.models.Role;

@Repository
public interface RoleRepositoryAdmin extends JpaRepository<Role, Integer> {

	@Query("select new com.demo.entites.RoleAjax(roleId, roleName, description, status) from Role where roleId = :roleId")
	public RoleAjax findByIdAjax(@Param("roleId") int roleId);
	
}
