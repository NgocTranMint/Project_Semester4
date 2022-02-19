package com.demo.repositories.user;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.demo.models.Rating;

@Repository
public interface RatingRepositoryUser extends CrudRepository<Rating, Integer> {

	@Query("from Rating where account.accountId = :accountId and quiz.quizId = :quizId")
	public Rating findByAccountIdAndQuizId(@Param("accountId") int accountId, @Param("quizId") int quizId);
	
	@Query("from Rating where quiz.quizId = :quizId")
	public List<Rating> findAllByQuizId(@Param("quizId") int quizId);
	
}
