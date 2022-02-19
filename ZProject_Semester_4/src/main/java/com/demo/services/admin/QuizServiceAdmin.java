package com.demo.services.admin;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.query.Param;

import com.demo.entites.QuizAjax;
import com.demo.models.Quiz;

public interface QuizServiceAdmin {

	
	public List<Quiz> findAllQuiz();

	public Quiz findById(int id);

	public Quiz create(Quiz quiz);

	public Quiz update(Quiz quiz);

	public void deleteById(int id);

	public QuizAjax findByIdAjax(int quizId);

	public Page<Quiz> getPage(int currentPage, int pageSize, String sort);
	
	public List<QuizAjax> findAllAjaxByCategoryId();
	
	public List<QuizAjax> findAjaxByCategoryId(int categoryId);
	
	public Page<Quiz> searchByKeyword(int currentPage, int pageSize, String sort, String keyword);
	
	public Page<Quiz> sortByCategory(int currentPage, int pageSize, String sort, int categoryId);

}
