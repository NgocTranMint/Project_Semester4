package com.demo.services.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;

import org.springframework.data.domain.Sort;

import org.springframework.stereotype.Service;

import com.demo.models.Comment;
import com.demo.models.Role;
import com.demo.entites.CommentAjax;
import com.demo.entites.RoleAjax;
import com.demo.repositories.admin.CommentRepositoryAdmin;
import com.demo.repositories.admin.RoleRepositoryAdmin;

@Service
public class CommentServiceAdminImpl implements CommentServiceAdmin{

	@Autowired
	private CommentRepositoryAdmin commentRepositoryAdmin;

	@Override
	public List<Comment> findAllComment() {
		return commentRepositoryAdmin.findAll();
	}

	@Override
	public Comment findById(int id) {
		return commentRepositoryAdmin.findById(id).get();
	}

	@Override
	public CommentAjax findByIdAjax(int commentId) {
		return commentRepositoryAdmin.findByIdAjax(commentId);
	}
	
	@Override
	public Page<Comment> getPage(int currentPage, int pageSize, String sort){
		 Pageable pageable = PageRequest.of(currentPage - 1, pageSize, Sort.by(sort).descending());
			return this.commentRepositoryAdmin.findAll(pageable);
	}

	@Override
	public Page<Comment> searchByKeyword(int currentPage, int pageSize, String sort, String keyword) {
		Pageable pageable = PageRequest.of(currentPage - 1, pageSize, Sort.by(sort).descending());
		return this.commentRepositoryAdmin.searchByKeyword(keyword, pageable);
	}
}
