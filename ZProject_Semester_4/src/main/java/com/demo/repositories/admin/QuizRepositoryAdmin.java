package com.demo.repositories.admin;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.demo.entites.QuizAjax;
import com.demo.models.Quiz;
import com.demo.models.Salary;

@Repository
public interface QuizRepositoryAdmin extends JpaRepository<Quiz, Integer> {

	@Query("select new com.demo.entites.QuizAjax(quizId, category.categoryId, category.title, title, description, times, timer, fee, image, status, dateCreated) from Quiz where quizId = :quizId")
	public QuizAjax findByIdAjax(@Param("quizId") int quizId);
	
	@Query("select new com.demo.entites.QuizAjax(quizId, category.categoryId, category.title, title, description, times, timer, fee, image, status, dateCreated) from Quiz")
	public List<QuizAjax> findAllAjaxByCategoryId();
	
	@Query("select new com.demo.entites.QuizAjax(quizId, category.categoryId, category.title, title, description, times, timer, fee, image, status, dateCreated) from Quiz where category.categoryId = :categoryId")
	public List<QuizAjax> findAjaxByCategoryId(@Param("categoryId") int categoryId);
	
	@Query(value = "Select * From quiz q inner join account a on q.account_id = a.account_id where a.username like %:keyword% || q.title like %:keyword%",
			nativeQuery = true)
	public Page<Quiz> searchByKeyword(String keyword, Pageable pageable);
	
	@Query(value = "Select * From quiz q inner join category c on q.category_id = c.category_id where q.category_id = ?1",
			nativeQuery = true)
	public Page<Quiz> sortByCategory(int categoryId, Pageable pageable);
	
}
