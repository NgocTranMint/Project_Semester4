package com.demo.services.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;

import org.springframework.data.domain.Sort;

import org.springframework.stereotype.Service;

import com.demo.models.Category;
import com.demo.models.Role;
import com.demo.entites.CategoryAjax;
import com.demo.entites.RoleAjax;
import com.demo.repositories.admin.CategoryRepositoryAdmin;
import com.demo.repositories.admin.RoleRepositoryAdmin;

@Service
public class CategoryServiceAdminImpl implements CategoryServiceAdmin{

	@Autowired
	private CategoryRepositoryAdmin categoryRepositoryAdmin;

	@Override
	public List<Category> findAllCategory() {
		return categoryRepositoryAdmin.findAll();
	}

	@Override
	public Category findById(int id) {
		return categoryRepositoryAdmin.findById(id).get();
	}

	@Override
	public Category create(Category category) {
		category.setStatus(true);
		return categoryRepositoryAdmin.save(category);
	}

	@Override
	public Category update(Category category) {
		return categoryRepositoryAdmin.save(category);
	}

	@Override
	public void deleteById(int id) {
		categoryRepositoryAdmin.deleteById(id);
	}

	@Override
	public CategoryAjax findByIdAjax(int categoryId) {
		return categoryRepositoryAdmin.findByIdAjax(categoryId);
	}

	@Override
	public Page<Category> getPage(int currentPage, int pageSize, String sort) {
		Pageable pageable = PageRequest.of(currentPage - 1, pageSize, Sort.by(sort).descending());
			return this.categoryRepositoryAdmin.findAll(pageable);
	}
	

}
