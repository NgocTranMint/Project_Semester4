package com.demo.entites;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.demo.models.Account;
import com.demo.models.Question;

public class AnswerAjax {


	private Integer answerId;
	private Integer questionId;
	private String title;
	private boolean answerStatus;
	private boolean status;
	
	
	public Integer getQuestionId() {
		return questionId;
	}
	public void setQuestionId(Integer questionId) {
		this.questionId = questionId;
	}
	public Integer getAnswerId() {
		return answerId;
	}
	public void setAnswerId(Integer answerId) {
		this.answerId = answerId;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public boolean isAnswerStatus() {
		return answerStatus;
	}
	public void setAnswerStatus(boolean answerStatus) {
		this.answerStatus = answerStatus;
	}
	public boolean isStatus() {
		return status;
	}
	public void setStatus(boolean status) {
		this.status = status;
	}

	public AnswerAjax(Integer answerId, Integer questionId, String title, boolean answerStatus, boolean status) {
		super();
		this.answerId = answerId;
		this.questionId = questionId;
		this.title = title;
		this.answerStatus = answerStatus;
		this.status = status;
	}
	public AnswerAjax() {
		super();
	}

	
	
}
