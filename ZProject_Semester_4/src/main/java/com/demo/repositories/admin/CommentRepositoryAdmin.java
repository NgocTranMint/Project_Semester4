package com.demo.repositories.admin;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.demo.entites.CommentAjax;
import com.demo.models.Comment;
import com.demo.models.Rating;

@Repository
public interface CommentRepositoryAdmin extends JpaRepository<Comment, Integer> {

	@Query("select new com.demo.entites.CommentAjax(commentId, account.fullname, quiz.title, comment, status, createDate) from Comment where commentId = :commentId")
	public CommentAjax findByIdAjax(@Param("commentId") int commentId);
	
	@Query(value = "Select * From comment c inner join account a on c.account_id = a.account_id inner join quiz q on q.quiz_id = c.quiz_id"
			+ " where a.username like %:keyword% || q.title like %:keyword% || c.comment like %:keyword%",
			nativeQuery = true)
	public Page<Comment> searchByKeyword(String keyword, Pageable pageable);
	
}
