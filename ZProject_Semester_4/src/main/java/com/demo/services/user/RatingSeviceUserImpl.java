package com.demo.services.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.demo.models.Comment;
import com.demo.models.Rating;
import com.demo.repositories.user.CommentRepositoryUser;
import com.demo.repositories.user.RatingRepositoryUser;

@Service
public class RatingSeviceUserImpl implements RatingServiceUser{

	@Autowired
	private RatingRepositoryUser ratingRepositoryUser;
	
	@Override
	public Rating save(Rating rating) {
		return ratingRepositoryUser.save(rating);
	}

	@Override
	public Rating findByAccountIdAndQuizId(int accountId, int quizId) {
		return ratingRepositoryUser.findByAccountIdAndQuizId(accountId, quizId);
	}

	@Override
	public Iterable<Rating> findAll() {
		return ratingRepositoryUser.findAll();
	}

	@Override
	public List<Rating> findAllByQuizId(int quizId) {
		return ratingRepositoryUser.findAllByQuizId(quizId);
	}

}
