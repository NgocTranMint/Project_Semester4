package com.demo.services.admin;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.demo.entites.CommentAjax;
import com.demo.entites.RoleAjax;
import com.demo.models.Comment;
import com.demo.models.Rating;

public interface CommentServiceAdmin {

	
	public List<Comment> findAllComment();

	public Comment findById(int id);

	public CommentAjax findByIdAjax(int commentId);
	

	public Page<Comment> getPage(int currentPage, int pageSize, String sort);
	
	public Page<Comment> searchByKeyword(int currentPage, int pageSize, String sort, String keyword);

}
