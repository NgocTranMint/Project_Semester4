package com.demo.repositories.user;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.demo.models.Comment;

@Repository
public interface CommentRepositoryUser extends CrudRepository<Comment, Integer> {

	@Query("from Comment where quiz.quizId = :quizId order by commentId desc")
	public List<Comment> findAllByQuizId(@Param("quizId") int quizId);
}
