package com.demo.controllers.user;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.demo.models.Account;
import com.demo.services.admin.CategoryServiceAdmin;


@Controller
@RequestMapping(value = {"user/teacher"})
public class TeacherController {
	
	@Autowired
	private CategoryServiceAdmin categoryServiceAdmin;
	
	@RequestMapping(value = { "", "index" }, method = RequestMethod.GET)
	public String register(ModelMap modelMap) {

		modelMap.put("categories", categoryServiceAdmin.findAllCategory());
		Account account = new Account();
		modelMap.put("account", account);
		modelMap.put("teacher", true);
		return "user/teacher/index";
	}


}
