package com.demo.services.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;

import org.springframework.data.domain.Sort;

import org.springframework.stereotype.Service;

import com.demo.models.Quiz;
import com.demo.models.Role;
import com.demo.entites.QuizAjax;
import com.demo.entites.RoleAjax;
import com.demo.repositories.admin.QuizRepositoryAdmin;
import com.demo.repositories.admin.RoleRepositoryAdmin;

@Service
public class QuizServiceAdminImpl implements QuizServiceAdmin{

	@Autowired
	private QuizRepositoryAdmin quizRepositoryAdmin;
	
	@Override
	public List<Quiz> findAllQuiz() {
		return quizRepositoryAdmin.findAll();
	}

	@Override
	public Quiz findById(int id) {
		return quizRepositoryAdmin.findById(id).get();
	}

	@Override
	public Quiz create(Quiz quiz) {
		quiz.setStatus(true);
		return quizRepositoryAdmin.save(quiz);
	}

	@Override
	public Quiz update(Quiz quiz) {
		return quizRepositoryAdmin.save(quiz);
	}

	@Override
	public void deleteById(int id) {
		quizRepositoryAdmin.deleteById(id);
	}

	@Override
	public QuizAjax findByIdAjax(int quizId) {
		return quizRepositoryAdmin.findByIdAjax(quizId);
	}

	@Override
	public Page<Quiz> getPage(int currentPage, int pageSize, String sort) {
		Pageable pageable = PageRequest.of(currentPage - 1, pageSize, Sort.by(sort).descending());
			return this.quizRepositoryAdmin.findAll(pageable);
	}
	
	@Override
	public List<QuizAjax> findAllAjaxByCategoryId() {
		return quizRepositoryAdmin.findAllAjaxByCategoryId();
	}

	@Override
	public List<QuizAjax> findAjaxByCategoryId(int categoryId) {
		return quizRepositoryAdmin.findAjaxByCategoryId(categoryId);
	}

	@Override
	public Page<Quiz> searchByKeyword(int currentPage, int pageSize, String sort, String keyword) {
		Pageable pageable = PageRequest.of(currentPage - 1, pageSize, Sort.by(sort).descending());
		return this.quizRepositoryAdmin.searchByKeyword(keyword, pageable);
	}

	@Override
	public Page<Quiz> sortByCategory(int currentPage, int pageSize, String sort, int categoryId) {
		Pageable pageable = PageRequest.of(currentPage - 1, pageSize, Sort.by(sort).descending());
		return this.quizRepositoryAdmin.sortByCategory(categoryId, pageable);
	}


}
