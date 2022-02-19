package com.demo.repositories.faculty;


import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.demo.entites.QuizAjax;
import com.demo.models.Email;
import com.demo.models.Quiz;

@Repository
public interface QuizRepositoryFaculty extends JpaRepository<Quiz, Integer> {

//	@Query("select new com.demo.entites.QuizAjax(quizId, title, account.fullname, description, times, timer, fee, status) from Quiz where account.accountId = :accountId")
//	public List<QuizAccountAjax> findByAccountIdAjax(@Param("accountId") int accountId);	
	
	@Query("select new com.demo.entites.QuizAjax(quizId, category.categoryId, category.title, title, description, times, timer, fee, image, status, dateCreated) from Quiz where quizId = :quizId")
	public QuizAjax findByIdAjax(@Param("quizId") int quizId);
	
	@Query(value = "SELECT * FROM quiz q WHERE q.account_id = ?1",
		    nativeQuery = true)
	public Page<Quiz> getAllQuizByAccountId(int account_id, Pageable pageable);
	
	@Query(value = "Select * From quiz q inner join account a on q.account_id = a.account_id where a.username like %:keyword% || q.title like %:keyword%",
			nativeQuery = true)
	public Page<Quiz> searchByKeyword(String keyword, Pageable pageable);
	
	
}
