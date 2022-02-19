package com.demo.entites;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.demo.models.Account;
import com.demo.models.Quiz;

public class QuestionAjax {

	private Integer questionId;
	private Integer quizId;
	private String title;
	private String explainDetail;
	private boolean status;
	private String typeAnswerChoice;

	public String getTypeAnswerChoice() {
		return typeAnswerChoice;
	}

	public void setTypeAnswerChoice(String typeAnswerChoice) {
		this.typeAnswerChoice = typeAnswerChoice;
	}

	public Integer getQuestionId() {
		return questionId;
	}

	public void setQuestionId(Integer questionId) {
		this.questionId = questionId;
	}

	public Integer getQuizId() {
		return quizId;
	}

	public void setQuizId(Integer quizId) {
		this.quizId = quizId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getExplainDetail() {
		return explainDetail;
	}

	public void setExplainDetail(String explainDetail) {
		this.explainDetail = explainDetail;
	}

	public boolean isStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

	public QuestionAjax(Integer questionId, Integer quizId, String title, String explainDetail, boolean status,
			String typeAnswerChoice) {
		super();
		this.questionId = questionId;
		this.quizId = quizId;
		this.title = title;
		this.explainDetail = explainDetail;
		this.status = status;
		this.typeAnswerChoice = typeAnswerChoice;
	}

	public QuestionAjax() {
		super();
	}
	
}
