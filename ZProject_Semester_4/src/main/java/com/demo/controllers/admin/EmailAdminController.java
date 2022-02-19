package com.demo.controllers.admin;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.demo.configurations.MyConstants;
import com.demo.models.Account;
import com.demo.models.Email;
import com.demo.services.AccountService;
import com.demo.services.admin.EmailServiceAdmin;
import com.demo.services.user.EmailService;

@Controller
@RequestMapping(value = {"admin/email"})
public class EmailAdminController {

	
	@Autowired
	private EmailServiceAdmin emailServiceAdmin;
	
	@Autowired
	private AccountService accountService;
	
	@Autowired
	private EmailService mailService;
	
	@Autowired
	private JavaMailSender javaMailSender;
	
	
	@RequestMapping(value = {"", "index"}, method = RequestMethod.GET)
	public String index(ModelMap modelMap, Model model) {
		
		return pagination(1, 25, "emailId", modelMap, model);		
	}
	
	
	@RequestMapping(value = { "create" }, method = RequestMethod.POST)
	public String create(@ModelAttribute("email") Email email, ModelMap modelMap) {
		
		emailServiceAdmin.create(email);

		return "redirect:/admin/email/index";
	}

	@RequestMapping(value = { "edit" }, method = RequestMethod.PUT)
	public String edit(@ModelAttribute("email") Email email) {
		
		emailServiceAdmin.update(email);

		return "redirect:/admin/email/index";
	}

	@RequestMapping(value = { "delete" }, method = RequestMethod.GET)
	public String delete(@RequestParam("emailID") int emailID) {

		emailServiceAdmin.deleteById(emailID);

		return "redirect:/admin/email/index";
	}

	
	
	@RequestMapping(value = {"pagination"}, method = RequestMethod.GET)
	public String pagination(@RequestParam(name = "currentPage") int currentPage, @RequestParam(name = "pageSize") int pageSize, @RequestParam(name = "sort") String sort,
			ModelMap modelMap, Model model) {

		int pageSizee = pageSize;

		Page<Email> pages = emailServiceAdmin.getPage(currentPage, pageSizee, sort);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("totalPages", pages.getTotalPages());
		model.addAttribute("totalElements", pages.getTotalElements());
		model.addAttribute("pageSize", pageSizee);
		model.addAttribute("sort", sort);
		model.addAttribute("emails", pages.getContent());

		Email email = new Email();		
		modelMap.put("email", email);


		return "admin/email/index";
	}
	
	@RequestMapping(value = "replyIndex", method = RequestMethod.GET)
	public String reply_index(ModelMap modelMap, Model model, @RequestParam("emailId") int emailId) {
		
		modelMap.put("email", emailServiceAdmin.findById(emailId));
		return "admin/email/replyIndex";		
	}
	
	@RequestMapping(value = "replyEmail", method = RequestMethod.POST)
	public String reply_email(ModelMap modelMap, Model model, Authentication authentication,@ModelAttribute("email") Email emailReply,
			@RequestParam("subject") String subject) {
		
		Email email = emailServiceAdmin.findById(emailReply.getEmailId());
		
		emailReply.setTitle(email.getTitle());
		emailReply.setEmailUser(email.getEmailUser());
		emailReply.setFullname(email.getFullname());
		emailReply.setPhoneNumber(email.getPhoneNumber());
		emailReply.setContent(email.getContent());
		emailReply.setSendDate(email.getSendDate());
		emailReply.setStatus(true);
		
		emailReply.setReplyDate(new Date());
		emailReply.setChecked(true);
		emailServiceAdmin.update(emailReply);
		
		SimpleMailMessage message = new SimpleMailMessage();
		
		Email email2 = emailServiceAdmin.findById(emailReply.getEmailId());
		
        message.setTo(email.getEmailUser());
        message.setSubject(subject);
        message.setText(subject + "\n" + email2.getReplyContent());
        
     // Send Message!
        javaMailSender.send(message);
		
		return "admin/email/replyIndex";		
	}

	@RequestMapping(value = "search", method = RequestMethod.GET)
	public String search(ModelMap modelMap, Model model, @RequestParam("keyword") String fullname) {

		return searchPagination(1, 25, "email_id", modelMap, model, fullname);
	}
	
	public String searchPagination(int currentPage,int pageSize,String sort, ModelMap modelMap,
			Model model, String keyword) {
		
		int pageSizee = pageSize;

			Page<Email> pages = emailServiceAdmin.searchByEmailUser(currentPage, pageSizee, sort, keyword);
			model.addAttribute("currentPage", currentPage);
			model.addAttribute("totalPages", pages.getTotalPages());
			model.addAttribute("totalElements", pages.getTotalElements());
			model.addAttribute("pageSize", pageSizee);
			model.addAttribute("sort", "emailId");
			model.addAttribute("emails", pages.getContent());

			Email email = new Email();		
			modelMap.put("email", email);

		return "admin/email/index";
	}
}
