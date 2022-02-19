package com.demo.controllers.faculty;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.ArrayUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.demo.models.Answer;
import com.demo.models.Question;
import com.demo.services.faculty.AnswerServiceFaculty;
import com.demo.services.faculty.QuestionServiceFaculty;
import com.demo.services.faculty.QuizServiceFaculty;

@Controller
@RequestMapping(value = { "faculty/question" })
public class QuestionFacultyController {

	@Autowired
	private QuestionServiceFaculty questionServiceFaculty;

	@Autowired
	private AnswerServiceFaculty answerServiceFaculty;

	@Autowired
	private QuizServiceFaculty quizServiceFaculty;

	private int quizIdd;

	@RequestMapping(value = { "", "index" }, method = RequestMethod.GET)
	public String index(@RequestParam("quizId") int quizId, ModelMap modelMap, Model model) {
		this.quizIdd = quizId;
		return pagination(1, 25, "question_id", modelMap, model);

	}

	@RequestMapping(value = { "create" }, method = RequestMethod.POST)
	public String create(@ModelAttribute("question") Question question, HttpServletRequest request) {

		String[] answerTitle = request.getParameterValues("answerTitle");
		String[] answerStatus = null;

		if (request.getParameterValues("answerStatusMultiple") != null) {
			answerStatus = request.getParameterValues("answerStatusMultiple");
			question.setTypeAnswerChoice("checkbox");
		}
		if (request.getParameterValues("answerStatusSingle") != null) {
			answerStatus = request.getParameterValues("answerStatusSingle");
			question.setTypeAnswerChoice("radio");

		}

		// add question
		question.setQuiz(quizServiceFaculty.findById(quizIdd));
		question.setStatus(true);

		question = questionServiceFaculty.create(question);

		// sort listanswerstatus again
		int t = 0;
		for (String string : answerStatus) {
			if (string.equalsIgnoreCase("1")) {
				answerStatus = ArrayUtils.remove(answerStatus, t - 1);
				t--;
			}
			t++;
		}

		// add list answers
		int i = 0;
		for (String title : answerTitle) {
			Answer answer = new Answer();
			answer.setTitle(title);
			answer.setQuestion(question);

			if (answerStatus[i].equalsIgnoreCase("0")) {
				answer.setAnswerStatus(false);

			} else {
				answer.setAnswerStatus(true);
			}
			answer.setStatus(true);
			answerServiceFaculty.create(answer);
			i++;

		}
/// nthohing 
		return "redirect:/faculty/question/index?quizId=" + quizIdd;
	}

	@RequestMapping(value = { "update" }, method = RequestMethod.POST)
	public String edit(@ModelAttribute("question") Question question, @RequestParam("answerId") String[] answerId,
			HttpServletRequest request) {

		String[] answerTitle = request.getParameterValues("answerTitle");
		String[] answerStatus = null;

		if (request.getParameterValues("answerStatusMultiple") != null) {
			answerStatus = request.getParameterValues("answerStatusMultiple");
			question.setTypeAnswerChoice("checkbox");
		}
		if (request.getParameterValues("answerStatusSingle") != null) {
			answerStatus = request.getParameterValues("answerStatusSingle");
			question.setTypeAnswerChoice("radio");

		}

		// update question
		question.setQuiz(quizServiceFaculty.findById(quizIdd));
		question.setStatus(true);

		question = questionServiceFaculty.update(question);

		// sort listanswerstatus again
		int t = 0;
		for (String string : answerStatus) {
			if (string.equalsIgnoreCase("1")) {
				answerStatus = ArrayUtils.remove(answerStatus, t - 1);
				t--;
			}
			t++;
		}

		// update answers
		for (int i = 0; i < answerTitle.length; i++) {
			Answer answer = new Answer();

			if (answerId.length > i) {
				answer.setAnswerId(Integer.parseInt(answerId[i].toString()));
			}
			answer.setTitle(answerTitle[i]);
			answer.setQuestion(question);

			if (answerStatus[i].equalsIgnoreCase("0")) {
				answer.setAnswerStatus(false);
			} else {
				answer.setAnswerStatus(true);
			}
			answer.setStatus(true);

			answerServiceFaculty.update(answer);

		}

		return "redirect:/faculty/question/index?quizId=" + quizIdd;
	}

	@RequestMapping(value = { "delete" }, method = RequestMethod.GET)
	public String delete(@RequestParam("questionID") int questionID) {

		answerServiceFaculty.deleteByQuestionId(questionID);
		questionServiceFaculty.deleteById(questionID);

		return "redirect:/faculty/question/index?quizId=" + quizIdd;
	}

	@RequestMapping(value = { "pagination" }, method = RequestMethod.GET)
	public String pagination(@RequestParam(name = "currentPage") int currentPage,
			@RequestParam(name = "pageSize") int pageSize, @RequestParam(name = "sort") String sort, ModelMap modelMap,
			Model model) {

		int pageSizee = pageSize;

		Page<Question> pages = questionServiceFaculty.getAllQuestionByQuizId(currentPage, pageSizee, sort, quizIdd);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("totalPages", pages.getTotalPages());
		model.addAttribute("totalElements", pages.getTotalElements());
		model.addAttribute("pageSize", pageSizee);
		model.addAttribute("sort", sort);
		model.addAttribute("questions", pages.getContent());

		Question question = new Question();
		modelMap.put("question", question);
		modelMap.put("quizId", quizIdd);

		return "faculty/question/index";
	}
	
	@RequestMapping(value = "review", method = RequestMethod.GET)
	public String review(@RequestParam("quizId") int quizId, ModelMap modelMap, Model model) {
		
		modelMap.put("quiz", quizServiceFaculty.findById(quizId));
		return "faculty/question/review";

	}

}
