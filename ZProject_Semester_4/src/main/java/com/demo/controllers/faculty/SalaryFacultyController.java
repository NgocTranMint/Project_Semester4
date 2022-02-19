package com.demo.controllers.faculty;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
import com.demo.services.faculty.SalaryServiceFaculty;
import com.google.api.client.util.DateTime;

@Controller
@RequestMapping(value = { "faculty/salary" })
public class SalaryFacultyController {

	@Autowired
	private SalaryServiceFaculty salaryServiceFaculty;

	
	@RequestMapping(value = { "", "index" }, method = RequestMethod.GET)
	public String index(ModelMap modelMap, HttpServletRequest request) {

		HttpSession session = request.getSession();
		Account account = (Account) session.getAttribute("account");
			
		modelMap.put("salarys", salaryServiceFaculty.findAllSalaryByAccountId(account.getAccountId()));
		
		return "faculty/salary/index";
	}

	
}
