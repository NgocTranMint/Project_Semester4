package com.demo.services.faculty;

import java.util.List;

import org.springframework.data.domain.Page;

import com.demo.entites.AnswerAjax;
import com.demo.entites.QuizAjax;
import com.demo.models.Answer;
import com.demo.models.Question;
import com.demo.models.Quiz;
public interface AnswerServiceFaculty {

	public List<Answer> findAllAnswer();

	public Answer findById(int id);

	public Answer create(Answer answer);

	public Answer update(Answer answer);

	public void deleteById(int id);

	public void deleteByQuestionId(int questionId);

	public List<AnswerAjax> findByIdAjax(int quizId);
	
		
}
