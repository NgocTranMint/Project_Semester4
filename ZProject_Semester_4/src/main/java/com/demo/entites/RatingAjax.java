package com.demo.entites;

import java.util.Date;

public class RatingAjax {

	private Integer ratingId;
	private Integer accountId;
	private Integer quizId;
	private int star;
	private Date createDate;
	private boolean status;
	public Integer getRatingId() {
		return ratingId;
	}
	public void setRatingId(Integer ratingId) {
		this.ratingId = ratingId;
	}
	public Integer getAccountId() {
		return accountId;
	}
	public void setAccountId(Integer accountId) {
		this.accountId = accountId;
	}
	public Integer getQuizId() {
		return quizId;
	}
	public void setQuizId(Integer quizId) {
		this.quizId = quizId;
	}
	public int getStar() {
		return star;
	}
	public void setStar(int star) {
		this.star = star;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public boolean isStatus() {
		return status;
	}
	public void setStatus(boolean status) {
		this.status = status;
	}
	public RatingAjax(Integer ratingId, Integer accountId, Integer quizId, int star, Date createDate, boolean status) {
		super();
		this.ratingId = ratingId;
		this.accountId = accountId;
		this.quizId = quizId;
		this.star = star;
		this.createDate = createDate;
		this.status = status;
	}
	public RatingAjax() {
		super();
	}
	
	
}
