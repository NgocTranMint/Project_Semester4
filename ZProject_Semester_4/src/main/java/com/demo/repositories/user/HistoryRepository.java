package com.demo.repositories.user;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.demo.models.History;

@Repository
public interface HistoryRepository extends CrudRepository<History, Integer>{

	@Query(value = "SELECT * FROM history h WHERE h.account_id = ?1",
		    nativeQuery = true)
	public Page<History> getAllQuizByAccountId(int account_id, Pageable pageable);

	@Query("from History where account.accountId = :accountId")
	public List<History> findAllByAccountId(@Param("accountId") int accountId);
	
	@Query("from History where account.accountId = :accountId and quiz.quizId = :quizId")
	public History findHistoryByAccounIdAndQuizId(@Param("accountId") int accountId, @Param("quizId") int quizId);
	
	@Query("from History where quiz.quizId = :quizId")
	public List<History> findByQuizId(@Param("quizId") int quizId);
	
}
