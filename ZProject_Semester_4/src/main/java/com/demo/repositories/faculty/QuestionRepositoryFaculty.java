package com.demo.repositories.faculty;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.demo.entites.QuestionAjax;
import com.demo.models.Question;

@Repository
public interface QuestionRepositoryFaculty extends JpaRepository<Question, Integer> {

	
	@Query("select new com.demo.entites.QuestionAjax(questionId, quiz.quizId, title, explainDetail, status, typeAnswerChoice) from Question where questionId = :questionId")
	public QuestionAjax findByIdAjax(@Param("questionId") int questionId);
	
	@Query(value = "SELECT * FROM question q WHERE q.quiz_id = ?1",
		    nativeQuery = true)
	public Page<Question> getAllQuestionByQuizId(int quizId, Pageable pageable);
	
}
