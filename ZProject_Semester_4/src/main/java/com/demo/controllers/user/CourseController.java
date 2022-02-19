package com.demo.controllers.user;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.ArrayUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.demo.models.Account;
import com.demo.models.AccountPack;
import com.demo.models.Answer;
import com.demo.models.Comment;
import com.demo.models.History;
import com.demo.models.Question;
import com.demo.models.Quiz;
import com.demo.models.Rating;
import com.demo.services.AccountService;
import com.demo.services.admin.CategoryServiceAdmin;
import com.demo.services.faculty.QuizServiceFaculty;
import com.demo.services.user.CommentServiceUser;
import com.demo.services.user.CourseService;
import com.demo.services.user.HistoryService;
import com.demo.services.user.RatingServiceUser;

@Controller
@RequestMapping(value = { "user/course" })
public class CourseController {

	@Autowired
	private AccountService accountService;

	@Autowired
	private CourseService courseService;

	@Autowired
	private CategoryServiceAdmin categoryServiceAdmin;

	@Autowired
	private QuizServiceFaculty quizServiceFaculty;

	@Autowired
	private HistoryService historyService;

	
	private int categoryIdd;

	@Autowired
	private CommentServiceUser commentServiceUser;
	
	@Autowired
	private RatingServiceUser ratingServiceUser;

	@RequestMapping(value = { "index" }, method = RequestMethod.GET)
	public String index(@RequestParam(name = "categoryId") int categoryId, ModelMap modelMap, Model model) {

		if (categoryId > 0) {
			this.categoryIdd = categoryId;
			modelMap.put("course", true);

			return pagination(1, 15, "quiz_id", modelMap, model);

		} else {
			this.categoryIdd = 0;

			modelMap.put("course", true);

			return pagination(1, 15, "quiz_id", modelMap, model);

		}

	}

	@RequestMapping(value = { "quizdetails" }, method = RequestMethod.GET)
	public String QuizDetails(@RequestParam("quizId") int quizId, ModelMap modelMap, Model model, HttpServletRequest request,
			HttpSession session) {

		Account account = new Account();
		modelMap.put("account", account);
		modelMap.put("categories", categoryServiceAdmin.findAllCategory());
		modelMap.put("course", true);

		modelMap.put("quiz", quizServiceFaculty.findById(quizId));

		// truyen doi tuong cho phan comment
        Comment comment = new Comment();
        modelMap.put("comment", comment);


		// Show tat ca comment
		modelMap.put("comments", commentServiceUser.findAllByQuizId(quizId));
		// Rating
		double totalStar = 0;
		double number = 0;
		for(Rating rating : ratingServiceUser.findAllByQuizId(quizId)) {
			totalStar += rating.getStar();
			number += 1;
		}
		double avgStar = totalStar/number;
		modelMap.put("avgStar", avgStar);

		Account accountRating = (Account) session.getAttribute("account");

		if(accountRating != null) {
			modelMap.put("rating", 	ratingServiceUser.findByAccountIdAndQuizId(accountRating.getAccountId(), quizId));
		} else {
			modelMap.put("rating", 	null);
		}

		return "user/course/quizdetails";
	}

	@RequestMapping(value = { "starttest" }, method = RequestMethod.GET)
	public String StartTest(@RequestParam("quizId") int quizId, ModelMap modelMap, Model model, HttpSession session) {

		Account account = new Account();

		modelMap.put("account", account);
		modelMap.put("categories", categoryServiceAdmin.findAllCategory());
		modelMap.put("course", true);
		modelMap.put("quiz", quizServiceFaculty.findById(quizId));

		// Xu li Pack Khi Nhap Vao Lam Bai
		Account account2 = (Account) session.getAttribute("account");
		Date now = new Date();
		boolean result = false;
		Quiz quiz = quizServiceFaculty.findById(quizId);
		if (quiz.isFee() == false) {
			return "user/course/starttest";
		} else {
			if (account2.getAccountPacks().size() == 0) {
				return "redirect:/user/pricing/index";
			} else if (account2.getAccountPacks().size() > 0) {
				for (AccountPack accountPack : account2.getAccountPacks()) {
					int number = now.getDate() - accountPack.getStartDate().getDate();
					if (number > accountPack.getPack().getExpiry() && accountPack.isStatus() == false) {
						System.out.println("Het han");
						modelMap.put("result", result);
						return "redirect:/user/pricing/index";
					} else {
						System.out.println("Con han");
						return "user/course/starttest";
					}
				}
			}
		}

		return "user/course/starttest";
	}

	@RequestMapping(value = { "endtest" }, method = RequestMethod.POST)
	public String EndTest(@RequestParam("quizId") int quizId, ModelMap modelMap, Model model,
			HttpServletRequest request) {

		Account account2 = (Account) request.getSession().getAttribute("account");

		Account account = new Account();
		// plus 1 time in times of quiz
		Quiz quiz = quizServiceFaculty.findById(quizId);
		quiz.setTimes(quiz.getTimes() + 1);
		quizServiceFaculty.update(quiz);

		// create new history
		History history = new History();

		if (historyService.findHistoryByAccounIdAndQuizId(account2.getAccountId(), quizId) != null) 		{
			history.setHistoryId(
					historyService.findHistoryByAccounIdAndQuizId(account2.getAccountId(), quizId).getHistoryId());

		}
		history.setDate(new Date());
		history.setQuiz(quizServiceFaculty.findById(quizId));

		history.setAccount(accountService.findById(account2.getAccountId()));
		history.setStatus(true);
		
		String listQuestionIdd = "";
		for(String questionId : request.getParameterValues("questionId")) {
			listQuestionIdd += questionId + " ";
		}
		history.setListQuestionId(listQuestionIdd);
		// get list anserchoice

		List<String> listAnswerIdChoice = new ArrayList<String>();
		String listAnswerId = "";
		String[] listQuestionId = request.getParameterValues("questionId");
		int i = 0;
		for (String string : listQuestionId) {

			String answer = "answer" + i;

			if (request.getParameterValues(answer) != null) {

				for (String answerId : request.getParameterValues(answer)) {
					if (answerId != "0") {
						listAnswerIdChoice.add(answerId);
						listAnswerId += answerId + " ";
					}
				}

			}

			i++;
		}

		history.setListAnswerChoice(listAnswerId);
		history.setTimeDone(Integer.parseInt(request.getParameter("timersubmit")));

		// get number of right answer_ choice

		int rightAnswerChoice = 0;
		for (String questionId : listQuestionId) {

			for (Question question : quiz.getQuestions()) {
				int numberRightCheckbox = 0;
				int numberAnswerUserChecked = 0;

				if (Integer.parseInt(questionId) == question.getQuestionId()) {
					
					
					if (question.getTypeAnswerChoice().equalsIgnoreCase("radio")) {
						for (Answer answer : question.getAnswers()) {
							for (String answerIdChoice : listAnswerIdChoice) {
								if (answer.getAnswerId() == Integer.parseInt(answerIdChoice)
										&& answer.isAnswerStatus()) {
									rightAnswerChoice += 1;

								}
							}
						}
					} else if (question.getTypeAnswerChoice().equalsIgnoreCase("checkbox")) {
						
						// get total right answer in a question
						int totalRightAnswerInDb = 0;
						for (Answer answer : question.getAnswers()) {
							if (answer.isAnswerStatus()) {
								totalRightAnswerInDb += 1;
							}
						}
					
						// check right answer 
						for (Answer answer : question.getAnswers()) {

							// get number Answer User Checked
							for (String answerIdChoice : listAnswerIdChoice) {

								if (answer.getAnswerId() == Integer.parseInt(answerIdChoice)) {
			
									numberAnswerUserChecked += 1;

								}
							}
							
							
							
							// get number Right Checkbox 							
							for (String answerIdChoice : listAnswerIdChoice) {

								if (answer.getAnswerId() == Integer.parseInt(answerIdChoice)
										&& answer.isAnswerStatus()) {
			
									numberRightCheckbox += 1;

								}
									
								if (totalRightAnswerInDb == numberAnswerUserChecked) {
									if(numberRightCheckbox == totalRightAnswerInDb) {
						
										rightAnswerChoice += 1;
										numberRightCheckbox = 0;
									}
									
								}
							}
						}
					}
				}
			}
		}
		System.out.println("right andwer: " + rightAnswerChoice);
		history.setNumberRightAnswer(rightAnswerChoice);

		historyService.create(history);

		modelMap.put("account", account);
		modelMap.put("categories", categoryServiceAdmin.findAllCategory());
		modelMap.put("course", true);
		modelMap.put("quiz", quizServiceFaculty.findById(quizId));

		return "redirect:/user/course/testresult?quizId=" + quizId;
	}

	// test result
	@RequestMapping(value = { "testresult" }, method = RequestMethod.GET)
	public String TestResult(@RequestParam("quizId") int quizId, ModelMap modelMap, Model model,
			HttpServletRequest request) {

		HttpSession session = request.getSession();
		Account accountt = (Account) session.getAttribute("account");
		Account account = new Account();
		modelMap.put("account", account);
		modelMap.put("categories", categoryServiceAdmin.findAllCategory());
		modelMap.put("course", true);
		modelMap.put("history", historyService.findHistoryByAccounIdAndQuizId(accountt.getAccountId(), quizId));
		modelMap.put("quiz", quizServiceFaculty.findById(quizId));

		return "user/course/testresult";
	}

	// ReviewTest
	@RequestMapping(value = { "reviewtest" }, method = RequestMethod.GET)
	public String ReviewTest(@RequestParam("quizId") int quizId, ModelMap modelMap, Model model,
			HttpServletRequest request) {

		Account accountt = (Account) request.getSession().getAttribute("account");
		Account account = new Account();
		modelMap.put("account", account);
		modelMap.put("categories", categoryServiceAdmin.findAllCategory());
		modelMap.put("course", true);
			
		String[] listQuestionId = historyService.findHistoryByAccounIdAndQuizId(accountt.getAccountId(), quizId).getListQuestionId().split(" ", -1);
		listQuestionId = ArrayUtils.remove(listQuestionId, listQuestionId.length - 1);
		for (String string : listQuestionId) {
			System.out.println("questionId : " + string);
		}
		
		String[] listAnswerId = historyService.findHistoryByAccounIdAndQuizId(accountt.getAccountId(), quizId).getListAnswerChoice().split(" ", -1);
		listAnswerId = ArrayUtils.remove(listAnswerId, listAnswerId.length - 1);
		for (String string : listAnswerId) {
			System.out.println("questionId : " + string);
		}
		modelMap.put("listQuestionId", listQuestionId);
		
		modelMap.put("listAnswerId", listAnswerId);
		modelMap.put("quiz", quizServiceFaculty.findById(quizId));
        
		return "user/course/reviewtest";
	}

	@RequestMapping(value = { "pagination" }, method = RequestMethod.GET)
	public String pagination(@RequestParam(name = "currentPage") int currentPage,
			@RequestParam(name = "pageSize") int pageSize, @RequestParam(name = "sort") String sort, ModelMap modelMap,
			Model model) {

		int pageSizee = pageSize;

		Page<Quiz> pages = null;
		if (categoryIdd > 0) {
			pages = courseService.getAllQuizByCategoryId(currentPage, pageSizee, sort, categoryIdd);
		} else {

			pages = courseService.getPage(currentPage, pageSizee, sort);
		}

		model.addAttribute("currentPage", currentPage);
		model.addAttribute("totalPages", pages.getTotalPages());
		model.addAttribute("totalElements", pages.getTotalElements());
		model.addAttribute("pageSize", pageSizee);
		model.addAttribute("sort", sort);
		model.addAttribute("quizs", pages.getContent());

		Account account = new Account();

		modelMap.put("account", account);
		modelMap.put("categories", categoryServiceAdmin.findAllCategory());

		return "user/course/index";
	}

	
	@RequestMapping(value = "search", method = RequestMethod.GET)
	public String search(ModelMap modelMap, Model model, @RequestParam("keyword") String keyword) {

		return searchPagination(1, 15, "quiz_id", modelMap, model, keyword);
	}
	
	public String searchPagination(int currentPage,int pageSize,String sort, ModelMap modelMap,
			Model model, String keyword) {
		
		int pageSizee = pageSize;

			Page<Quiz> pages = courseService.searchByTitle(currentPage, pageSizee, sort, keyword);
			model.addAttribute("currentPage", currentPage);
			model.addAttribute("totalPages", pages.getTotalPages());
			model.addAttribute("totalElements", pages.getTotalElements());
			model.addAttribute("pageSize", pageSizee);
			model.addAttribute("sort", sort);
			model.addAttribute("quizs", pages.getContent());

			Account account = new Account();

			modelMap.put("account", account);
			modelMap.put("categories", categoryServiceAdmin.findAllCategory());


		return "user/course/index";
	}
	
	@RequestMapping(value = "filter", method = RequestMethod.GET)
	public String Filter(ModelMap modelMap, Model model, @RequestParam("fee") boolean fee) {

		return FilterPagination(1, 15, "quiz_id", modelMap, model, fee);
	}
	
	public String FilterPagination(int currentPage,int pageSize,String sort, ModelMap modelMap,
			Model model, boolean fee) {
		
		int pageSizee = pageSize;

		Page<Quiz> pages = null;
		if (categoryIdd > 0) {
			pages = courseService.getAllQuizByCategoryIdFee(currentPage, pageSizee, sort, categoryIdd, fee);
		} else {

			pages = courseService.getPageFee(currentPage, pageSizee, sort, fee);
		}
			
			model.addAttribute("currentPage", currentPage);
			model.addAttribute("totalPages", pages.getTotalPages());
			model.addAttribute("totalElements", pages.getTotalElements());
			model.addAttribute("pageSize", pageSizee);
			model.addAttribute("sort", sort);
			model.addAttribute("quizs", pages.getContent());

			Account account = new Account();

			modelMap.put("account", account);
			modelMap.put("categories", categoryServiceAdmin.findAllCategory());


		return "user/course/index";
	}
}