package com.demo.repositories.user;


import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.demo.models.Account;
import com.demo.models.Quiz;

@Repository
public interface QuizRepository extends CrudRepository<Quiz, Integer>{

//	@Query("from Quiz where category.categoryId=:categoryId")
//	public List<Quiz> findAllQuizByCategoryId(@Param("categoryId") int categoryId);
//	
	@Query(value = "SELECT * FROM quiz q WHERE q.category_id = ?1 and q.status = true",
		    nativeQuery = true)
	public Page<Quiz> getAllQuizByCategoryId(int category_id, Pageable pageable);
	
	@Query(value = "SELECT * FROM quiz q WHERE q.category_id = ?1 and q.fee = ?2 and q.status = true ",
		    nativeQuery = true)
	public Page<Quiz> getAllQuizByCategoryIdFee(int category_id, boolean fee, Pageable pageable);
	
	
	@Query(value = "SELECT * FROM quiz q WHERE q.status = true",
		    nativeQuery = true)
	public Page<Quiz> findAll(Pageable pageable);
	
	@Query(value = "SELECT * FROM quiz q WHERE q.status = true and q.fee = ?1",
		    nativeQuery = true)
	public Page<Quiz> findAllFee(boolean fee, Pageable pageable);
	
	
	@Query(value = "SELECT * FROM quiz q WHERE q.title like %?1%",
		    nativeQuery = true)
	public Page<Quiz> searchByTitle(String title, Pageable pageable);

}
