package com.demo.controllers.user;

import java.util.Random;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.demo.configurations.MyConstants;
import com.demo.models.Account;
import com.demo.services.user.AccountServiceUser;

@Controller
@RequestMapping(value = {"user/forgotpassword"})
public class ForgotPasswordController {

	@Autowired
	private AccountServiceUser accountServiceUser;
	
	@Autowired
	private JavaMailSender javaMailSender;
	
	private int numberRandow;
	private Account account;
	
	@RequestMapping(value = {"","index"}, method = RequestMethod.GET)
	public String index(ModelMap modelMap) {

		return "user/forgotpassword/index";
	}
	
	@RequestMapping(value = "checkEmail", method = RequestMethod.POST)
	public String checkEmail(ModelMap modelMap, @RequestParam("email") String email) {
		this.account = accountServiceUser.findByEmail(email);
		if(account != null) {
			Random random = new Random();
			this.numberRandow = random.nextInt(999999);
			
			SimpleMailMessage message = new SimpleMailMessage();
			
			String subject = "Please reset your password";
			String content = "Please enter the 6-digit code to reset the password: " + numberRandow;
			
	        message.setTo(email);
	        message.setSubject(subject);
	        message.setText(content);

	     // Send Message!
	        javaMailSender.send(message);
	        modelMap.put("msgSuccess", "A message has been sent to your email");
			return "user/forgotpassword/index";
		} else {
			modelMap.put("msgError", "Email is not Exist!");
			return "user/forgotpassword/index";
		}
		
	}
	
	@RequestMapping(value = "checkCode", method = RequestMethod.POST)
	public String checkCode(ModelMap modelMap, @RequestParam("codeconfirm") int codeconfirm) {
		if(codeconfirm == numberRandow) {
			
			return "user/forgotpassword/changepassword";
		} else {
			modelMap.put("msgCode", "Your Code is Incorrect!");
			return "user/forgotpassword/index";
		}
		
	}
	
	@RequestMapping(value = "changepassword", method = RequestMethod.POST)
	public String changepassword(ModelMap modelMap, @RequestParam("password") String password, 
			@RequestParam("passwordConfirm") String passwordConfirm) {
		if(password.equalsIgnoreCase(passwordConfirm)) {
			String hash = BCrypt.hashpw(password, BCrypt.gensalt(4));
			this.account.setPassword(hash);
			accountServiceUser.update(account);
			modelMap.put("success", "Password updated successfully!");
			return "user/forgotpassword/changepassword";
		} else {
			modelMap.put("error", "Confirm Password is wrong!!!");
			return "user/forgotpassword/changepassword";
		}
		
	}
}
