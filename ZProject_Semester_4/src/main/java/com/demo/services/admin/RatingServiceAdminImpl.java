package com.demo.services.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;

import org.springframework.data.domain.Sort;

import org.springframework.stereotype.Service;

import com.demo.models.Comment;
import com.demo.models.Rating;
import com.demo.models.Role;
import com.demo.entites.CommentAjax;
import com.demo.entites.RoleAjax;
import com.demo.repositories.admin.CommentRepositoryAdmin;
import com.demo.repositories.admin.RatingRepositoryAdmin;
import com.demo.repositories.admin.RoleRepositoryAdmin;

@Service
public class RatingServiceAdminImpl implements RatingServiceAdmin{

	@Autowired
	private RatingRepositoryAdmin ratingRepositoryAdmin;
	
	@Override
	public List<Rating> findAllRating() {
		return ratingRepositoryAdmin.findAll();
	}

	@Override
	public Rating findById(int id) {
		return ratingRepositoryAdmin.findById(id).get();
	}
	
	@Override
	public Page<Rating> getPage(int currentPage, int pageSize, String sort){
		 Pageable pageable = PageRequest.of(currentPage - 1, pageSize, Sort.by(sort).descending());
			return this.ratingRepositoryAdmin.findAll(pageable);
	}

	@Override
	public Page<Rating> searchByKeyword(int currentPage, int pageSize, String sort, String keyword) {
		Pageable pageable = PageRequest.of(currentPage - 1, pageSize, Sort.by(sort).descending());
		return this.ratingRepositoryAdmin.searchByKeyword(keyword, pageable);
	}

	
}
