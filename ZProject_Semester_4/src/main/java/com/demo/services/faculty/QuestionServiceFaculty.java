package com.demo.services.faculty;

import java.util.List;

import org.springframework.data.domain.Page;

import com.demo.entites.QuestionAjax;
import com.demo.models.Question;

public interface QuestionServiceFaculty {

	public List<Question> findAllQuestion();

	public Question findById(int id);

	public Question create(Question question);

	public Question update(Question question);

	public void deleteById(int id);

	public QuestionAjax findByIdAjax(int quizId);
	

	public Page<Question> getPage(int currentPage, int pageSize, String sort);
	
	public Page<Question> getAllQuestionByQuizId(int currentPage, int pageSize, String sort, int quizId);
	
}
