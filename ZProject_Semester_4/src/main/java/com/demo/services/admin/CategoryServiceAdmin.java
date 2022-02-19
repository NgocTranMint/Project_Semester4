package com.demo.services.admin;

import java.util.List;

import org.springframework.data.domain.Page;

import com.demo.entites.CategoryAjax;
import com.demo.models.Category;

public interface CategoryServiceAdmin {

	
	public List<Category> findAllCategory();

	public Category findById(int id);

	public Category create(Category category);

	public Category update(Category category);

	public void deleteById(int id);

	public CategoryAjax findByIdAjax(int categoryId);
	

	public Page<Category> getPage(int currentPage, int pageSize, String sort);

}
