package com.demo.controllers.faculty;

import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.MimeTypeUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.demo.entites.AnswerAjax;
import com.demo.entites.QuestionAjax;
import com.demo.entites.QuestionAnswer;
import com.demo.entites.QuizAjax;
import com.demo.models.Answer;
import com.demo.models.Question;
import com.demo.services.faculty.AnswerServiceFaculty;
import com.demo.services.faculty.QuestionServiceFaculty;
import com.demo.services.faculty.QuizServiceFaculty;

@RestController
@RequestMapping("faculty/ajax")
public class AjaxFacultyController {

	@Autowired
	private QuizServiceFaculty quizServiceFaculty;

	@Autowired
	private QuestionServiceFaculty questionServiceFaculty;

	@Autowired
	private AnswerServiceFaculty answerServiceFaculty;

	@RequestMapping(value = { "findquizbyid" }, method = RequestMethod.GET, produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
	public QuizAjax findQuizById(@RequestParam("quizId") int quizId) {

		return quizServiceFaculty.findByIdAjax(quizId);

	}

	@RequestMapping(value = {
			"findquestionandanswerbyid" }, method = RequestMethod.GET, produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
	public QuestionAnswer findQuestionAndAnswerById(@RequestParam("questionId") int questionId) {

		QuestionAnswer questionAnswer = new QuestionAnswer();
		questionAnswer.setQuestionAjax(questionServiceFaculty.findByIdAjax(questionId));
		questionAnswer.setAnswerAjaxs(answerServiceFaculty.findByIdAjax(questionId));

		return questionAnswer;
	}

	@RequestMapping(value = {"deleteanswer" }, method = RequestMethod.GET, produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
	public void deleteAnswer(@RequestParam("answerId") int answerId) {

		 answerServiceFaculty.deleteById(answerId);

	}

}
