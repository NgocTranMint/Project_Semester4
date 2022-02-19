package com.demo.entites;


public class CategoryAjax {

	private Integer categoryId;
	private String title;
	private String description;
	private boolean status;
	
	public Integer getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(Integer categoryId) {
		this.categoryId = categoryId;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
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
	public CategoryAjax(Integer categoryId, String title, String description, boolean status) {
		super();
		this.categoryId = categoryId;
		this.title = title;
		this.description = description;
		this.status = status;
	}
	public CategoryAjax() {
		super();
	}
	
	
	
}
