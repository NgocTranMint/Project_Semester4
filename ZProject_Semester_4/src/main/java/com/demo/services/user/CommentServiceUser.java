package com.demo.services.user;

import java.util.List;

import org.springframework.data.repository.query.Param;

import com.demo.models.Comment;


public interface CommentServiceUser {

	public Comment save(Comment comment);
	
	public Iterable<Comment> findAll();
	
	public List<Comment> findAllByQuizId(int quizId);
		
}
