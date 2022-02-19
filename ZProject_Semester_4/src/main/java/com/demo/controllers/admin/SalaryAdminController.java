package com.demo.controllers.admin;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.time.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.demo.models.Account;
import com.demo.models.Quiz;
import com.demo.models.Role;
import com.demo.models.Salary;
import com.demo.services.admin.AccountServiceAdmin;
import com.demo.services.admin.QuizServiceAdmin;
import com.demo.services.admin.SalaryServiceAdmin;
import com.google.api.client.util.DateTime;

@Controller
@RequestMapping(value = { "admin/salary" })
public class SalaryAdminController {

	@Autowired
	private SalaryServiceAdmin salaryServiceAdmin;

	@Autowired
	private AccountServiceAdmin accountServiceAdmin;

	@Autowired
	private QuizServiceAdmin quizServiceAdmin;

	@RequestMapping(value = { "", "index" }, method = RequestMethod.GET)
	public String index(ModelMap modelMap, Model model) {

		return pagination(1, 25, "createDate", modelMap, model);

	}

	@RequestMapping(value = { "checkNewSalary" }, method = RequestMethod.GET)
	public String CheckNewSalary() {
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date defaultDate;

		Salary salary = salaryServiceAdmin.findNewestSalary();
		if (salary == null) {
			Date date1 = new Date();
			try {
				defaultDate = simpleDateFormat.parse("0000-01-09");
				Calendar cal1 = Calendar.getInstance();
				Calendar cal2 = Calendar.getInstance();
				cal1.setTime(date1);
				cal2.setTime(defaultDate);
				boolean sameDay = cal1.get(Calendar.DAY_OF_MONTH) == cal2.get(Calendar.DAY_OF_MONTH);

				if (sameDay) {
					List<Account> accounts = accountServiceAdmin.findAllAccount();
					for (Account account : accounts) {
						for (Role role : account.getRoles()) {

							if (role.getRoleName().equals("ROLE_USER_FACULTY")) {

								Salary salary3 = new Salary();
								salary3.setAccount(account);
								salary3.setCreateDate(new Date());
								salary3.setStatus(true);
								salary3.setAcceptPayment(false);

								List<Quiz> quizs = quizServiceAdmin.findAllQuiz();
								int totalClick = 0;
								for (Quiz quiz : quizs) {
									if (quiz.getAccount().getAccountId() == account.getAccountId()) {
										totalClick += quiz.getTimes();
									}
								}

								salary3.setTotalClickQuiz(totalClick);
								float income = 0;
								if (totalClick == 0) {
									income = 0;
								} else {
									income = (float) (totalClick * 0.001);
								}
								salary3.setSalary(income);
								salary3.setTotalClickQuizMonth(totalClick);
								salaryServiceAdmin.create(salary3);

							}
						}

					}
				}

			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else {
			Date date1 = salary.getCreateDate();
			Date date2 = new Date();

			try {
				defaultDate = simpleDateFormat.parse("0000-01-09");
				Calendar cal1 = Calendar.getInstance();
				Calendar cal2 = Calendar.getInstance();
				cal1.setTime(date1);
				cal2.setTime(defaultDate);
				boolean sameDay = cal1.get(Calendar.DAY_OF_MONTH) == cal2.get(Calendar.DAY_OF_MONTH);
				if (!DateUtils.isSameDay(date1, date2) && sameDay) {
					createNewSalary();
				}

			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		return "redirect:/admin/salary/index";
	}

	private void createNewSalary() {
		List<Account> accounts = accountServiceAdmin.findAllAccount();
		for (Account account : accounts) {
			for (Role role : account.getRoles()) {

				if (role.getRoleName().equals("ROLE_USER_FACULTY")) {
					Salary salary2 = salaryServiceAdmin.findNewestSalaryByAccountId(account.getAccountId());
					if (salary2 == null) {
						Salary salary3 = new Salary();
						salary3.setAccount(account);
						salary3.setCreateDate(new Date());
						salary3.setStatus(true);
						salary3.setAcceptPayment(false);

						List<Quiz> quizs = quizServiceAdmin.findAllQuiz();
						int totalClick = 0;
						for (Quiz quiz : quizs) {
							if (quiz.getAccount().getAccountId() == account.getAccountId()) {
								totalClick += quiz.getTimes();
							}
						}

						salary3.setTotalClickQuiz(totalClick);
						float income = (float) (totalClick * 0.001);
						salary3.setSalary(income);
						salary3.setTotalClickQuizMonth(totalClick);

						salaryServiceAdmin.create(salary3);
					} else {
						Salary salary3 = new Salary();
						salary3.setAccount(account);
						salary3.setCreateDate(new Date());
						salary3.setStatus(true);
						salary3.setAcceptPayment(false);

						List<Quiz> quizs = quizServiceAdmin.findAllQuiz();
						int totalClick = 0;
						for (Quiz quiz : quizs) {

							if (quiz.getAccount().getAccountId() == account.getAccountId()) {
								totalClick += quiz.getTimes();
							}
						}

						salary3.setTotalClickQuiz(totalClick);

						float income = 0;
						if (totalClick == 0) {
							income = 0;
						} else {
							income = (float) ((totalClick - salary2.getTotalClickQuiz()) * 0.001);
						}

						salary3.setSalary(income);
						salary3.setTotalClickQuizMonth(totalClick - salary2.getTotalClickQuiz());
						salaryServiceAdmin.create(salary3);
					}
				}
			}

		}
	}

	@RequestMapping(value = { "transfer" }, method = RequestMethod.GET)
	public String Transfer(@RequestParam("salaryId") int salaryId) {

		Salary salary = salaryServiceAdmin.findById(salaryId);
		salary.setAcceptPayment(true);
		salaryServiceAdmin.update(salary);

		return "redirect:/admin/salary/index";
	}

	@RequestMapping(value = { "pagination" }, method = RequestMethod.GET)
	public String pagination(@RequestParam(name = "currentPage") int currentPage,
			@RequestParam(name = "pageSize") int pageSize, @RequestParam(name = "sort") String sort, ModelMap modelMap,
			Model model) {

		int pageSizee = pageSize;

		Page<Salary> pages = salaryServiceAdmin.getPage(currentPage, pageSizee, sort);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("totalPages", pages.getTotalPages());
		model.addAttribute("totalElements", pages.getTotalElements());
		model.addAttribute("pageSize", pageSizee);
		model.addAttribute("sort", sort);
		model.addAttribute("salarys", pages.getContent());

		Salary salary = new Salary();
		modelMap.put("salary", salary);

		return "admin/salary/index";
	}
	
	@RequestMapping(value = "search", method = RequestMethod.GET)
	public String search(ModelMap modelMap, Model model, @RequestParam("keyword") String fullname) {

		return searchPagination(1, 25, "salary_id", modelMap, model, fullname);
	}
	
	public String searchPagination(int currentPage,int pageSize,String sort, ModelMap modelMap,
			Model model, String keyword) {
		
		int pageSizee = pageSize;

			Page<Salary> pages = salaryServiceAdmin.searchByUsername(currentPage, pageSizee, sort, keyword);
			model.addAttribute("currentPage", currentPage);
			model.addAttribute("totalPages", pages.getTotalPages());
			model.addAttribute("totalElements", pages.getTotalElements());
			model.addAttribute("pageSize", pageSizee);
			model.addAttribute("sort", "salaryId");
			model.addAttribute("salarys", pages.getContent());

			Salary salary = new Salary();
			modelMap.put("salary", salary);

		return "admin/salary/index";
	}
}
