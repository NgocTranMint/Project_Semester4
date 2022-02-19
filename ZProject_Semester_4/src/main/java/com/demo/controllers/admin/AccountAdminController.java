package com.demo.controllers.admin;

import java.util.Date;

import javax.servlet.ServletContext;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.ServletContextAware;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.demo.helpers.UploadHelper;
import com.demo.models.Account;
import com.demo.services.AccountService;
import com.demo.services.admin.AccountServiceAdmin;
import com.demo.services.admin.RoleServiceAdmin;

@Controller
@RequestMapping(value = { "admin/account" })
public class AccountAdminController implements ServletContextAware {

	@Autowired
	private AccountServiceAdmin accountServiceAdmin;

	@Autowired
	private AccountService accountService;

	@Autowired
	private RoleServiceAdmin roleServiceAdmin;
	private ServletContext servletContext;
	private RedirectStrategy redirectStrategy = new DefaultRedirectStrategy();

	public void setRedirectStrategy(RedirectStrategy redirectStrategy) {
		this.redirectStrategy = redirectStrategy;
	}

	protected RedirectStrategy getRedirectStrategy() {
		return redirectStrategy;
	}

	@Override
	public void setServletContext(ServletContext servletContext) {

		this.servletContext = servletContext;

	}
	
	@RequestMapping(value = { "", "index" }, method = RequestMethod.GET)
	public String index(ModelMap modelMap, Model model) {
		return pagination(1, 25, "accountId", modelMap, model);

	}


	@RequestMapping(value = { "create" }, method = RequestMethod.POST)
	public String create(@ModelAttribute("account") Account account, @RequestParam("role") int[] roles,
			@RequestParam(value = "file") MultipartFile file, RedirectAttributes redirectAttributes,
			ModelMap modelMap) {
		if (accountServiceAdmin.findByUsername(account.getUsername().trim()) != null) {
			modelMap.put("accounts", accountServiceAdmin.findAllAccount());
			modelMap.put("account", account);
			modelMap.put("msg", "Username has already Existed!");
			return "admin/account/index";

		} else {
			String fileNameUpload = UploadHelper.upload(servletContext, file);
			redirectAttributes.addFlashAttribute("fileName", fileNameUpload);
			account.setPassword(BCrypt.hashpw(account.getPassword(), BCrypt.gensalt()));
			account.setAvatar(fileNameUpload);
			account.setCreateDate(new Date());
			if (roles != null && roles.length > 0) {
				for (int role : roles) {
					account.getRoles().add(roleServiceAdmin.findById(role));
				}
			}
			accountServiceAdmin.create(account);
		}

		return "redirect:/admin/account/index";
	}

	@RequestMapping(value = { "update" }, method = RequestMethod.POST)
	public String edit(@ModelAttribute("account") Account account, @RequestParam(value = "file") MultipartFile file,
			RedirectAttributes redirectAttributes) {
		Account account2 = accountService.findByUsername(account.getUsername());
		account2.setAvatar(accountService.findByUsername(account.getUsername()).getAvatar());
		String fileNameUpload = UploadHelper.upload(servletContext, file);
		if (fileNameUpload != null) {
			redirectAttributes.addFlashAttribute("fileName", fileNameUpload);
			account2.setAvatar(fileNameUpload);
		}
		account2.setEmail(account.getEmail());
		account2.setAddr(account.getAddr());
		account2.setGender(account.isGender());
		account2.setFullname(account.getFullname());

		accountServiceAdmin.update(account2);

		return "redirect:/admin/account/index";
	}

	@RequestMapping(value = { "delete" }, method = RequestMethod.GET)
	public String delete(@RequestParam("accountID") int accountID) {

		accountServiceAdmin.deleteById(accountID);

		return "redirect:/admin/account/index";
	}

	@RequestMapping(value = { "pagination" }, method = RequestMethod.GET)
	public String pagination(@RequestParam(name = "currentPage") int currentPage,
			@RequestParam(name = "pageSize") int pageSize, @RequestParam(name = "sort") String sort, ModelMap modelMap,
			Model model) {
		
		int pageSizee = pageSize;
			Page<Account> pages = accountServiceAdmin.getPage(currentPage, pageSizee, sort);
			model.addAttribute("currentPage", currentPage);
			model.addAttribute("totalPages", pages.getTotalPages());
			model.addAttribute("totalElements", pages.getTotalElements());
			model.addAttribute("pageSize", pageSizee);
			model.addAttribute("sort", sort);
			model.addAttribute("accounts", pages.getContent());

		Account account = new Account();
		account.setGender(true);
		modelMap.put("account", account);
		modelMap.put("roles", roleServiceAdmin.findAllRole());
		// nothing

		return "admin/account/index";
	}
	
	@RequestMapping(value = "search", method = RequestMethod.GET)
	public String search(ModelMap modelMap, Model model, @RequestParam("keyword") String fullname) {

		return searchPagination(1, 25, "account_id", modelMap, model, fullname);
	}
	
	public String searchPagination(int currentPage,int pageSize,String sort, ModelMap modelMap,
			Model model, String keyword) {
		
		int pageSizee = pageSize;

			Page<Account> pages = accountServiceAdmin.searchByFullname2(currentPage, pageSizee, sort, keyword);
			model.addAttribute("currentPage", currentPage);
			model.addAttribute("totalPages", pages.getTotalPages());
			model.addAttribute("totalElements", pages.getTotalElements());
			model.addAttribute("pageSize", pageSizee);
			model.addAttribute("sort", "accountId");
			model.addAttribute("accounts", pages.getContent());

		Account account = new Account();
		account.setGender(true);
		modelMap.put("account", account);
		modelMap.put("roles", roleServiceAdmin.findAllRole());
		// nothing

		return "admin/account/index";
	}
}
