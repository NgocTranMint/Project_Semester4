package com.demo.controllers.user;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.demo.models.Account;
import com.demo.models.AccountPack;
import com.demo.models.Pay;
import com.demo.paypals.PayPalConfig;
import com.demo.paypals.PayPalResult;
import com.demo.paypals.PayPalSucess;
import com.demo.services.AccountService;
import com.demo.services.admin.CategoryServiceAdmin;
import com.demo.services.user.AccountPackService;
import com.demo.services.user.PayService;
import com.demo.services.user.PricingService;


@Controller
@RequestMapping(value = {"user/pricing"})
public class PricingController {
	
	@Autowired
	private PricingService pricingService;
	
	@Autowired
	private AccountService accountService;
	
	@Autowired
	private Environment environment;
	
	@Autowired
	private PayService payService;
	
	@Autowired
	private AccountPackService accountPackService;
	
	@Autowired
	private CategoryServiceAdmin categoryServiceAdmin;
	
	@RequestMapping(value = { "", "index" }, method = RequestMethod.GET)
	public String index(ModelMap modelMap, Authentication authentication, HttpSession session) {
		String authtoken = environment.getProperty("paypal.authtoken");
		String posturl = environment.getProperty("paypal.posturl");
		String business = environment.getProperty("paypal.business");
		String returnurl = environment.getProperty("paypal.returnurl");
		
		modelMap.put("authtoken", authtoken);
		modelMap.put("posturl", posturl);
		modelMap.put("business", business);
		modelMap.put("returnurl", returnurl);
		
		modelMap.put("packs", pricingService.findAll());
		//modelMap.put("account", accountService.findByUsername(authentication.getName()));
		modelMap.put("categories", categoryServiceAdmin.findAllCategory());
		Account account = new Account();
		modelMap.put("account", account);
		modelMap.put("pricing", true);
		
		Account account2 = (Account) session.getAttribute("account");
		Date now = new Date();
		boolean result = false;

		if(account2 == null) {
			result = false;
		} else if(account2.getAccountPacks().size() == 0 && account2 != null) {
			System.out.println("Khong co goi");
		} else {
			for(AccountPack accountPack: account2.getAccountPacks()) {
				System.out.println("pack: " + accountPack.getPack().getTitle());
				System.out.println("pack day: " + (accountPack.getStartDate().getDate() - now.getDate()));
				int number = now.getDate() - accountPack.getStartDate().getDate();
				System.out.println("number: " + number);
				System.out.println("expiry: " +  accountPack.getPack().getExpiry());
				if(number >=  accountPack.getPack().getExpiry()) {
					System.out.println("Het han");
				} else {
					System.out.println("Con han");
					result = true;
					modelMap.put("accountPack", accountPack);
				}
				System.out.println("------");
			}
		}
		
		modelMap.put("result", result);
		System.out.println(result);
		
		return "user/pricing/index";
	}


	@RequestMapping(value = "success", method = RequestMethod.GET)
	public String success(HttpServletRequest request, Authentication authentication) {
		// @RequestParam("amount_1") float amount, @RequestParam("item_name_1") String title
		PayPalConfig payPalConfig = new PayPalConfig();
		
		HttpSession httpSession = request.getSession();
		System.out.println("pack id: " + httpSession.getAttribute("packId").toString());
		
		int pakcid = Integer.parseInt(httpSession.getAttribute("packId").toString());
		
		String authtoken = environment.getProperty("paypal.authtoken");
		String posturl = environment.getProperty("paypal.posturl");
		String business = environment.getProperty("paypal.business");
		String returnurl = environment.getProperty("paypal.returnurl");
		
		payPalConfig.setAuthToken(authtoken);
		payPalConfig.setPosturl(posturl);
		payPalConfig.setBusiness(business);
		payPalConfig.setReturnurl(returnurl);
		
		PayPalResult result = PayPalSucess.getPayPal(request, payPalConfig);
		
		Account account = (Account) httpSession.getAttribute("account");
		
		Pay pay = new Pay();
		pay.setAccount(account);
		pay.setPayment("PAYPAL");
		pay.setTitle("PAYMENT PACK - CODE: " + request.getParameter("tx"));
		pay.setFee(Float.parseFloat(request.getParameter("amt")));
//		pay.setTitle("PAYMENT PACK - CODE: " + title);
//		pay.setFee(amount);
		pay.setDatePaid(new Date());
		pay.setPayStatus(true);
		payService.save(pay);
		
		
		AccountPack accountPack = new AccountPack();
		accountPack.setAccount(account);
		accountPack.setPack(pricingService.findById(pakcid));
		accountPack.setStartDate(new Date());
		accountPack.setStatus(true);
		accountPackService.save(accountPack);

		httpSession.removeAttribute("packId");
		
		return "user/pricing/success";
	}
}