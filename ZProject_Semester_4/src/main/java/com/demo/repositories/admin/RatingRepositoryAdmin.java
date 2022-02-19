package com.demo.repositories.admin;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.demo.models.Quiz;
import com.demo.models.Rating;

@Repository
public interface RatingRepositoryAdmin extends JpaRepository<Rating, Integer> {

	@Query(value = "Select * From rating r inner join account a on r.account_id = a.account_id inner join quiz q on q.quiz_id = r.quiz_id"
			+ " where a.username like %:keyword% || q.title like %:keyword%",
			nativeQuery = true)
	public Page<Rating> searchByKeyword(String keyword, Pageable pageable);
	
}
