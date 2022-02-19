package com.demo.controllers.faculty;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.ArrayUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.demo.entites.AccountAjax;
import com.demo.entites.QuestionAnswer;
import com.demo.models.Account;
import com.demo.models.Answer;
import com.demo.models.Question;
import com.demo.models.Quiz;
import com.demo.models.Role;
import com.demo.models.Salary;
import com.demo.services.AccountService;
import com.demo.services.admin.SalaryServiceAdmin;
import com.demo.services.faculty.AnswerServiceFaculty;
import com.demo.services.faculty.QuestionServiceFaculty;
import com.demo.services.faculty.QuizServiceFaculty;
import com.google.gson.Gson;

@Controller
@RequestMapping(value = { "faculty/dashboard" })
public class DashboardFacultyController {

	@Autowired
	private AccountService accountService;

	@Autowired
	private QuizServiceFaculty quizServiceFaculty;

	@Autowired
	private QuestionServiceFaculty questionServiceFaculty;

	@Autowired
	private AnswerServiceFaculty answerServiceFaculty;
	@Autowired
	private SalaryServiceAdmin salaryServiceAdmin;

	@RequestMapping(value = { "", "index" }, method = RequestMethod.GET)
	public String index(Authentication authentication, ModelMap modelMap, HttpServletRequest request, Model model) {
		float totalsalaryinmonth = 0;int totalclick=0;
		//HttpSession session = request.getSession();
		//Account account = (Account) session.getAttribute("account");
	Account account=accountService.findByUsername(authentication.getName());
	
		QuestionAnswer questionAnswer = new QuestionAnswer();
		modelMap.put("questionAnswer", questionAnswer);
		
		Question question = new Question();
		modelMap.put("question", question);
		List<List<String>> slr = new ArrayList<List<String>>();
		List<List<String>> clk = new ArrayList<List<String>>();
		for (int i = 1; i <= 12; i++) {
			float salaryinmonth = 0;int click=0;
			List<Salary> salaries = salaryServiceAdmin.facultysalarybyyearandmonth(account.getAccountId(), java.time.LocalDateTime.now().getYear(), i);
			for (Salary salary : salaries ) {
				salaryinmonth+=salary.getSalary();
				totalsalaryinmonth+=salary.getSalary();
				click+=salary.getTotalClickQuizMonth();
				totalclick+=salary.getTotalClickQuizMonth();
			}
			List<String> a = new ArrayList<String>();
			List<String> b = new ArrayList<String>();
			a.add("category: " + String.valueOf(i) + "/" + String.valueOf(java.time.LocalDateTime.now().getYear()));
			a.add("column-1: " + String.valueOf(salaryinmonth));
			b.add("country: " + String.valueOf(i) + "/" + String.valueOf(java.time.LocalDateTime.now().getYear()));
			b.add(String.valueOf(click));
			slr.add(a);
			clk.add(b);
		}
		String json2 = new Gson().toJson(slr).replace("[[", "[{").replace("],[", "},{").replace("]]", "}]")
				.replace("\"category: ", "\"category\":\"").replace("\"column-1: ", "\"column-1\":\"")
				.replace("\"column-1\":\"", "\"column-1\":").replace("\"}", "}");
		String json = new Gson().toJson(clk).replace("[[", "[{").replace("],[", "},{").replace("]]", "}]")
				.replace("\"country: ", "\"country\":\"").replace(",\"", ",\"litres\":").replace("\"}", "}");
		System.out.println(json);
		String year="\"Revenue in "+java.time.LocalDateTime.now().getYear()+"\"";
		modelMap.put("category", json2);
		modelMap.put("category2", json);
		modelMap.put("totalincome", totalsalaryinmonth);
		modelMap.put("totaldotest", totalclick);
		modelMap.put("year", year);
		return "faculty/dashboard/index";
	}

}
