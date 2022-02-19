package com.demo.services.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.demo.models.Quiz;
import com.demo.repositories.user.QuizRepository;
import com.demo.services.faculty.QuizServiceFaculty;

@Service
public class CourseServiceImpl implements CourseService {

	@Autowired
	private QuizRepository quizRepository;

	@Override
	public Page<Quiz> getPage(int currentPage, int pageSize, String sort) {
		Pageable pageable = PageRequest.of(currentPage - 1, pageSize, Sort.by(sort).descending());
		return this.quizRepository.findAll(pageable);
	}

	
	@Override
	public Page<Quiz> getAllQuizByCategoryId(int currentPage, int pageSize, String sort, int categoryId) {
		Pageable pageable = PageRequest.of(currentPage - 1, pageSize, Sort.by(sort).descending());
		return this.quizRepository.getAllQuizByCategoryId(categoryId, pageable);

	}


	@Override
	public Page<Quiz> searchByTitle(int currentPage, int pageSize, String sort, String title) {
		Pageable pageable = PageRequest.of(currentPage - 1, pageSize, Sort.by(sort).descending());
		return this.quizRepository.searchByTitle(title, pageable);

	}


	@Override
	public Page<Quiz> getAllQuizByCategoryIdFee(int currentPage, int pageSize, String sort, int categoryId,
			boolean fee) {
		Pageable pageable = PageRequest.of(currentPage - 1, pageSize, Sort.by(sort).descending());
		return this.quizRepository.getAllQuizByCategoryIdFee(categoryId, fee, pageable);
	}


	@Override
	public Page<Quiz> getPageFee(int currentPage, int pageSize, String sort, boolean fee) {
		Pageable pageable = PageRequest.of(currentPage - 1, pageSize, Sort.by(sort).descending());
		return this.quizRepository.findAllFee(fee, pageable);
	}


	

//	@Override
//	public List<Quiz> findAllQuizByCategoryId(int categoryId) {
//		return courseRepository.findAllQuizByCategoryId(categoryId);
//	}

}
