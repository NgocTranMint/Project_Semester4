package com.demo.controllers.user;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.demo.models.Account;
import com.demo.services.admin.CategoryServiceAdmin;
import com.demo.services.user.HistoryService;

@Controller
@RequestMapping(value = {"user/history"})
public class HistoryController{

	@Autowired
	private CategoryServiceAdmin categoryServiceAdmin;
	
	@Autowired
	private HistoryService historyService;
	
	@RequestMapping(value = "index", method = RequestMethod.GET)
	public String register(ModelMap modelMap, HttpSession session) {
		modelMap.put("categories", categoryServiceAdmin.findAllCategory());
		Account account = new Account();
		modelMap.put("account", account);
		Account accountSession = (Account) session.getAttribute("account");
		modelMap.put("histories", historyService.findAllByAccountId(accountSession.getAccountId()));
		
		return "user/history/index";
	}
}
