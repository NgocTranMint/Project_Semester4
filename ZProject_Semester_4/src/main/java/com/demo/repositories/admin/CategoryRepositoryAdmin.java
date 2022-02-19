package com.demo.repositories.admin;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.demo.entites.CategoryAjax;
import com.demo.models.Category;

@Repository
public interface CategoryRepositoryAdmin extends JpaRepository<Category, Integer> {

	@Query("select new com.demo.entites.CategoryAjax(categoryId, title, description, status) from Category where categoryId = :categoryId")
	public CategoryAjax findByIdAjax(@Param("categoryId") int categoryId);
	
}
