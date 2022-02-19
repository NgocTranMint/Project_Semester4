package com.demo.services.admin;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.demo.models.Rating;

public interface RatingServiceAdmin {

	
	public List<Rating> findAllRating();

	public Rating findById(int id);

	public Page<Rating> getPage(int currentPage, int pageSize, String sort);

	public Page<Rating> searchByKeyword(int currentPage, int pageSize, String sort, String keyword);
}
