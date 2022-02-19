package com.demo.services.faculty;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.demo.entites.QuizAjax;
import com.demo.models.Quiz;
import com.demo.repositories.faculty.QuizRepositoryFaculty;

@Service
public class QuizSeviceFacultyImpl implements QuizServiceFaculty{

	@Autowired
	private QuizRepositoryFaculty quizRepositoryFaculty;

	@Override
	public List<Quiz> findAllQuiz() {
		return quizRepositoryFaculty.findAll();
	}

	@Override
	public Quiz findById(int id) {
		return quizRepositoryFaculty.findById(id).get();
	}

	@Override
	public Quiz create(Quiz quiz) {
		return quizRepositoryFaculty.save(quiz);
		
	}

	@Override
	public Quiz update(Quiz quiz) {
		return quizRepositoryFaculty.save(quiz);
	}

	@Override
	public void deleteById(int id) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public QuizAjax findByIdAjax(int quizId) {
		return quizRepositoryFaculty.findByIdAjax(quizId);
	}

	@Override
	public Page<Quiz> getPage(int currentPage, int pageSize, String sort) {
		Pageable pageable = PageRequest.of(currentPage - 1, pageSize, Sort.by(sort).descending());
		return this.quizRepositoryFaculty.findAll(pageable);
	}

	@Override
	public Page<Quiz> getAllQuizByAccountId(int currentPage, int pageSize, String sort, int accountId) {
		Pageable pageable = PageRequest.of(currentPage - 1, pageSize, Sort.by(sort).descending());
		return this.quizRepositoryFaculty.getAllQuizByAccountId(accountId, pageable);
	}

	@Override
	public Page<Quiz> searchByKeyword(int currentPage, int pageSize, String sort, String keyword) {
		Pageable pageable = PageRequest.of(currentPage - 1, pageSize, Sort.by(sort).descending());
		return this.quizRepositoryFaculty.searchByKeyword(keyword, pageable);
	}

	
}
