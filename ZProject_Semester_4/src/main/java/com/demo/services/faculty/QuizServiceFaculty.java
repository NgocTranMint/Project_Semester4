package com.demo.services.faculty;

import java.util.List;

import org.springframework.data.domain.Page;
import com.demo.entites.QuizAjax;
import com.demo.models.Quiz;
public interface QuizServiceFaculty {

	public List<Quiz> findAllQuiz();

	
	public Quiz findById(int id);

	public Quiz create(Quiz quiz);

	public Quiz update(Quiz quiz);

	public void deleteById(int id);

	public QuizAjax findByIdAjax(int quizId);

	public Page<Quiz> getPage(int currentPage, int pageSize, String sort);

	public Page<Quiz> getAllQuizByAccountId(int currentPage, int pageSize, String sort, int accountId);
	
	public Page<Quiz> searchByKeyword(int currentPage, int pageSize, String sort, String keyword);
}
