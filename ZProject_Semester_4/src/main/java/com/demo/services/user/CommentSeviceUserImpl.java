package com.demo.services.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.demo.models.Comment;
import com.demo.repositories.user.CommentRepositoryUser;

@Service
public class CommentSeviceUserImpl implements CommentServiceUser{

	@Autowired
	private CommentRepositoryUser commentRepository;
	
	@Override
	public Comment save(Comment comment) {
		comment.setStatus(true);
		return commentRepository.save(comment);
	}

	@Override
	public Iterable<Comment> findAll() {
		return  commentRepository.findAll();
	}

	@Override
	public List<Comment> findAllByQuizId(int quizId) {
		return commentRepository.findAllByQuizId(quizId);
	}


}
