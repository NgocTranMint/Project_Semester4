package com.demo.services.user;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.demo.models.Account;
import com.demo.models.Quiz;
public interface CourseService {

//	public List<Quiz> findAllQuizByCategoryId(int categoryId);
//	
	
	public Page<Quiz> getPage(int currentPage, int pageSize, String sort);

	public Page<Quiz> getPageFee(int currentPage, int pageSize, String sort, boolean fee);

	
	public Page<Quiz> getAllQuizByCategoryId(int currentPage, int pageSize, String sort, int categoryId);
	
	public Page<Quiz> getAllQuizByCategoryIdFee(int currentPage, int pageSize, String sort, int categoryId, boolean fee);
	
	
	
	public Page<Quiz> searchByTitle(int currentPage, int pageSize, String sort, String title);
	
}
