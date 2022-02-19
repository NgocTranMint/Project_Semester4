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
import com.demo.services.user.PayService;

@Controller
@RequestMapping(value = {"user/payment"})
public class PaymentController{

	@Autowired
	private CategoryServiceAdmin categoryServiceAdmin;
	
	@Autowired
	private PayService payService;
	
	@RequestMapping(value = "index", method = RequestMethod.GET)
	public String Index(ModelMap modelMap, HttpSession session) {
		modelMap.put("categories", categoryServiceAdmin.findAllCategory());
		Account account = new Account();
		modelMap.put("account", account);
		Account accountSession = (Account) session.getAttribute("account");
		modelMap.put("payments", payService.findAllByAccountId(accountSession.getAccountId()));
		
		return "user/payment/index";
	}
	
	
	// go to page pay details
	@RequestMapping(value = "paydetails", method = RequestMethod.GET)
	public String Paydetails(ModelMap modelMap, @RequestParam("payId") int payId) {
		modelMap.put("categories", categoryServiceAdmin.findAllCategory());
		Account account = new Account();
		modelMap.put("account", account);
		modelMap.put("pay", payService.findById(payId));
		
		return "user/payment/paydetails";
	}
	
	
	
	
}
