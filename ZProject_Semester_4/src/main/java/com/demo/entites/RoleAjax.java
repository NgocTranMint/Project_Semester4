package com.demo.entites;


public class RoleAjax {


	private Integer roleId;
	private String roleName;
	private String description;
	private boolean status;
	
	
	public Integer getRoleId() {
		return roleId;
	}
	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}
	public String getRoleName() {
		return roleName;
	}
	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public boolean isStatus() {
		return status;
	}
	public void setStatus(boolean status) {
		this.status = status;
	}
	public RoleAjax(Integer roleId, String roleName, String description, boolean status) {
		super();
		this.roleId = roleId;
		this.roleName = roleName;
		this.description = description;
		this.status = status;
	}
	public RoleAjax() {
		super();
	}
	
	
	
}
