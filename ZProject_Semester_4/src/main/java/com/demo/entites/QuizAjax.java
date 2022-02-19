package com.demo.entites;

import java.util.Date;

public class QuizAjax {

	private Integer quizId;
	private int categoryId;
	private String categoryName;
	private String title;
	private String description;
	private int times;
	private byte timer;
	private boolean fee;
	private String image;
	private boolean status;
	private Date dateCreated;
	
	
	
	
	public Date getDateCreated() {
		return dateCreated;
	}

	public void setDateCreated(Date dateCreated) {
		this.dateCreated = dateCreated;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public Integer getQuizId() {
		return quizId;
	}

	public void setQuizId(Integer quizId) {
		this.quizId = quizId;
	}

	public int getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getTimes() {
		return times;
	}

	public void setTimes(int times) {
		this.times = times;
	}

	public byte getTimer() {
		return timer;
	}

	public void setTimer(byte timer) {
		this.timer = timer;
	}

	public boolean isFee() {
		return fee;
	}

	public void setFee(boolean fee) {
		this.fee = fee;
	}

	public String getImage() {
		return image;
	}

	public void getImage(String image) {
		this.image = image;
	}

	public boolean isStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}



	public QuizAjax(Integer quizId, int categoryId, String categoryName, String title, String description, int times,
			byte timer, boolean fee, String image, boolean status, Date dateCreated) {
		super();
		this.quizId = quizId;
		this.categoryId = categoryId;
		this.categoryName = categoryName;
		this.title = title;
		this.description = description;
		this.times = times;
		this.timer = timer;
		this.fee = fee;
		this.image = image;
		this.status = status;
		this.dateCreated = dateCreated;
	}

	public QuizAjax() {
		super();
	}

}
