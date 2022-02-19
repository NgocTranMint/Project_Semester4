package com.demo.repositories.faculty;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.demo.entites.AnswerAjax;
import com.demo.models.Answer;

@Repository
public interface AnswerRepositoryFaculty extends JpaRepository<Answer, Integer> {

	@Transactional
	@Modifying
	@Query("delete from Answer where question_id = :questionId")
	public void deleteByQuestionId(@Param("questionId") int questionId);

	
	@Query("select new com.demo.entites.AnswerAjax(answerId, question.questionId, title, answerStatus, status) from Answer where question.questionId = :questionId")
	public List<AnswerAjax> findByIdAjax(@Param("questionId") int questionId);
	
}
