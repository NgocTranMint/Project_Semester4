package com.demo.entites;

import java.util.List;

import com.demo.models.Answer;
import com.demo.models.Question;

public class QuestionAnswer {

	private QuestionAjax questionAjax;
	private List<AnswerAjax> answerAjaxs;

	public QuestionAjax getQuestionAjax() {
		return questionAjax;
	}

	public void setQuestionAjax(QuestionAjax questionAjax) {
		this.questionAjax = questionAjax;
	}

	public List<AnswerAjax> getAnswerAjaxs() {
		return answerAjaxs;
	}

	public void setAnswerAjaxs(List<AnswerAjax> answerAjaxs) {
		this.answerAjaxs = answerAjaxs;
	}

	public QuestionAnswer(QuestionAjax questionAjax, List<AnswerAjax> answerAjaxs) {
		super();
		this.questionAjax = questionAjax;
		this.answerAjaxs = answerAjaxs;
	}

	public QuestionAnswer() {
		super();
	}

}
