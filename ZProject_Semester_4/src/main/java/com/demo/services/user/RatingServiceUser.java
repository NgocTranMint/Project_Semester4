package com.demo.services.user;

import java.util.List;

import org.springframework.data.repository.query.Param;

import com.demo.models.Rating;

public interface RatingServiceUser {

	public Rating save(Rating rating);
	
	public Rating findByAccountIdAndQuizId(int accountId, int quizId);
	
	public Iterable<Rating> findAll();
	
	public List<Rating> findAllByQuizId(int quizId);
		
}
