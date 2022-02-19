package com.demo.controllers.user;

import java.util.Date;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.ServletContextAware;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.demo.helpers.UploadHelper;
import com.demo.models.Account;
import com.demo.services.AccountService;
import com.demo.services.admin.CategoryServiceAdmin;

@Controller
@RequestMapping(value = {"user/profile"})
public class ProfileController implements ServletContextAware{

	@Autowired
	private CategoryServiceAdmin categoryServiceAdmin;
	
	@Autowired
	private AccountService accountService;
	
	private ServletContext servletContext;
	
	@Override
	public void setServletContext(ServletContext servletContext) {
		this.servletContext = servletContext;
	}
	
	@RequestMapping(value = "index", method = RequestMethod.GET)
	public String register(ModelMap modelMap, @RequestParam("accountId") int id) {
		modelMap.put("categories", categoryServiceAdmin.findAllCategory());
		Account account = new Account();
		
		modelMap.put("account", account);
		
		// Page Profile
		Account accountProfile = accountService.findById(id);
		modelMap.put("accountProfile", accountProfile);
		
		return "user/profile/index";
	}
	
	@RequestMapping(value = "editProfileUsername", method = RequestMethod.POST)
	public String editProfileUsername(ModelMap modelMap, HttpSession session, @RequestParam("username") String username) {
		
		Account account = (Account) session.getAttribute("account");
		Account accountNew = accountService.findById(account.getAccountId());
		accountNew.setUsername(username);
		accountService.update(accountNew);
		return "redirect:/user/profile/index?accountId=" + account.getAccountId();
	}
	
	@RequestMapping(value = "editProfileFullname", method = RequestMethod.POST)
	public String editProfileFullname(ModelMap modelMap, HttpSession session, @RequestParam("fullname") String fullname) {
		
		Account account = (Account) session.getAttribute("account");
		Account accountNew = accountService.findById(account.getAccountId());
		accountNew.setFullname(fullname);
		accountService.update(accountNew);
		return "redirect:/user/profile/index?accountId=" + account.getAccountId();
	}
	
	@RequestMapping(value = "editProfileEmail", method = RequestMethod.POST)
	public String editProfileEmail(ModelMap modelMap, HttpSession session, @RequestParam("email") String email) {
		
		Account account = (Account) session.getAttribute("account");
		Account accountNew = accountService.findById(account.getAccountId());
		accountNew.setEmail(email);
		accountService.update(accountNew);
		return "redirect:/user/profile/index?accountId=" + account.getAccountId();
	}
	
	@RequestMapping(value = "editProfileBirthday", method = RequestMethod.POST)
	public String editProfileBirthday(ModelMap modelMap, HttpSession session, @RequestParam("birthday") Date birthday) {
		
		Account account = (Account) session.getAttribute("account");
		Account accountNew = accountService.findById(account.getAccountId());
		accountNew.setDob(birthday);
		accountService.update(accountNew);
		return "redirect:/user/profile/index?accountId=" + account.getAccountId();
	}
	
	@RequestMapping(value = "editProfileAddress", method = RequestMethod.POST)
	public String editProfileAddress(ModelMap modelMap, HttpSession session, @RequestParam("address") String address) {
		
		Account account = (Account) session.getAttribute("account");
		Account accountNew = accountService.findById(account.getAccountId());
		accountNew.setAddr(address);
		accountService.update(accountNew);
		return "redirect:/user/profile/index?accountId=" + account.getAccountId();
	}
	
	@RequestMapping(value = "editProfilePhone", method = RequestMethod.POST)
	public String editProfilePhone(ModelMap modelMap, HttpSession session, @RequestParam("phone") String phone) {
		
		Account account = (Account) session.getAttribute("account");
		Account accountNew = accountService.findById(account.getAccountId());
		accountNew.setPhone(phone);
		accountService.update(accountNew);
		return "redirect:/user/profile/index?accountId=" + account.getAccountId();
	}
	
	@RequestMapping(value = "editPassword", method = RequestMethod.POST)
	public String editPassword(ModelMap modelMap, HttpSession httpSession, @RequestParam("currentPassword") String currentPassword,
			@RequestParam("newPassword") String newPassword, @RequestParam("confirmPassword") String confirmPassword) {
		
		Account account = (Account) httpSession.getAttribute("account");
		
		boolean valuate = BCrypt.checkpw(currentPassword, account.getPassword());
		if(valuate) {
			if(newPassword.equalsIgnoreCase(confirmPassword)) {
				String hash = BCrypt.hashpw(newPassword, BCrypt.gensalt(4));
				account.setPassword(hash);
				accountService.update(account);
				modelMap.put("msg", "<script>alert('Change password successfully')</script>");
				System.out.println("Cap nhat thanh cong " + hash);
				//return "redirect:/user/profile/index?accountId=" + account.getAccountId();
			}else {
				modelMap.put("msg", "<script>alert('Confirm Password is wrong!!!')</script>");
				System.out.println("Nhap lai mat khau khong chinh xac");
				//return "redirect:/user/profile/index?accountId=" + account.getAccountId();
			}
		}else {
			modelMap.put("msg", "<script>alert('Current Password is wrong!!!')</script>");
			System.out.println("Mat khau hien tai khong dung");
			//return "redirect:/user/profile/index?accountId=" + account.getAccountId();
		}
		Account accountt = new Account();
		modelMap.put("account", accountt);
		
		// Page Profile
		Account accountProfile = accountService.findById(account.getAccountId());
		modelMap.put("accountProfile", accountProfile);
		return "user/profile/index";
	}
	
//	@RequestMapping(value = "editPassword", method = RequestMethod.GET)
//	public String editPassword(HttpSession httpSession) {
//		Account account = (Account) httpSession.getAttribute("account");
//		return "redirect:/user/profile/index?accountId=" + account.getAccountId();
//	}
	
	@RequestMapping(value = "changeImage", method = RequestMethod.POST)
	public String changeImage(ModelMap modelMap, HttpSession session, @RequestParam(value = "file") MultipartFile file,
			RedirectAttributes redirectAttributes) {
		Account account = (Account) session.getAttribute("account");
		String fileNameUpload = UploadHelper.upload(servletContext, file);
		if (fileNameUpload != null) {
			redirectAttributes.addFlashAttribute("fileName", fileNameUpload);
			account.setAvatar(fileNameUpload);
		}
		System.out.println(fileNameUpload);
		accountService.update(account);
		return "redirect:/user/profile/index?accountId=" + account.getAccountId();
	}
}
