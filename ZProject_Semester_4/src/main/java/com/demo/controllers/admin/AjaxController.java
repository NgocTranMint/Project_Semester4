package com.demo.controllers.admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.MimeTypeUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.demo.entites.AccountAjax;
import com.demo.entites.CategoryAjax;
import com.demo.entites.EmailAjax;
import com.demo.entites.PackAjax;
import com.demo.entites.PayAjax;
import com.demo.entites.QuizAjax;
import com.demo.entites.RoleAjax;
import com.demo.models.Account;
import com.demo.models.Category;
import com.demo.models.Pack;
import com.demo.models.Quiz;
import com.demo.models.Role;
import com.demo.services.admin.AccountServiceAdmin;
import com.demo.services.admin.CategoryServiceAdmin;
import com.demo.services.admin.EmailServiceAdmin;
import com.demo.services.admin.PackServiceAdmin;
import com.demo.services.admin.PayServiceAdmin;
import com.demo.services.admin.QuizServiceAdmin;
import com.demo.services.admin.RoleServiceAdmin;

@RestController
@RequestMapping("admin/ajax")
public class AjaxController {

	@Autowired
	private AccountServiceAdmin accountServiceAdmin;
	
	@Autowired
	private RoleServiceAdmin roleServiceAdmin;
	
	@Autowired
	private PayServiceAdmin payServiceAdmin;
		
	@Autowired
	private EmailServiceAdmin emailServiceAdmin;
	
	@Autowired
	private PackServiceAdmin packServiceAdmin;
	
	@Autowired
	private CategoryServiceAdmin categoryServiceAdmin;
	
	@Autowired
	private QuizServiceAdmin quizServiceAdmin;
	
	
	@RequestMapping(value = {"findaccountbyid"}, method = RequestMethod.GET, produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
	public AccountAjax findAccountById(@RequestParam("accountId") int accountId) {
		
		return accountServiceAdmin.findByIdAjax(accountId);
		
	}

	@RequestMapping(value = {"findrolebyid"}, method = RequestMethod.GET, produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
	public RoleAjax findRoleById(@RequestParam("roleId") int roleId) {
		
		return roleServiceAdmin.findByIdAjax(roleId);
		
	}
	
	@RequestMapping(value = {"findpaybyid"}, method = RequestMethod.GET, produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
	public PayAjax findPayById(@RequestParam("payId") int payId) {
		
		return payServiceAdmin.findByIdAjax(payId);
		
	}
	
	@RequestMapping(value = {"findemailbyid"}, method = RequestMethod.GET, produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
	public EmailAjax findEmailById(@RequestParam("emailId") int emailId) {
		
		return emailServiceAdmin.findByIdAjax(emailId);
		
	}

	@RequestMapping(value = {"findpackbyid"}, method = RequestMethod.GET, produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
	public PackAjax findPackById(@RequestParam("packId") int packId) {
		
		return packServiceAdmin.findByIdAjax(packId);
		
	}
	
	@RequestMapping(value = {"findcategorybyid"}, method = RequestMethod.GET, produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
	public CategoryAjax findCategoryById(@RequestParam("categoryId") int categoryId) {
		
		return categoryServiceAdmin.findByIdAjax(categoryId);
		
	}
	
	@RequestMapping(value = {"checkStatusAccount"}, method = RequestMethod.GET, produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
	public AccountAjax checkStatusAccount(@RequestParam("accountId") int accountId) {
		
		Account account = accountServiceAdmin.findById(accountId);
		account.setStatus(!account.isStatus());
		
		account = accountServiceAdmin.update(account);
		AccountAjax accountAjax = new AccountAjax();
		accountAjax.setAccountId(account.getAccountId());
		accountAjax.setUsername(account.getUsername());
		accountAjax.setFullname(account.getFullname());
		accountAjax.setPassword(account.getPassword());
		accountAjax.setEmail(account.getEmail());
		accountAjax.setDob(account.getDob());
		accountAjax.setAddr(account.getAddr());
		accountAjax.setGender(account.isGender());
		accountAjax.setPhone(account.getPhone());
		accountAjax.setAvatar(account.getAvatar());
		accountAjax.setStatus(account.isStatus());
		return accountAjax;
		
	}
	
	@RequestMapping(value = {"checkStatusRole"}, method = RequestMethod.GET, produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
	public Role checkStatusRole(@RequestParam("roleId") int roleId) {
		
		Role role = roleServiceAdmin.findById(roleId);
		role.setStatus(!role.isStatus());
		return roleServiceAdmin.update(role);
		
	}

	@RequestMapping(value = {"checkStatusPack"}, method = RequestMethod.GET, produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
	public Pack checkStatusPack(@RequestParam("packId") int packId) {
		
		Pack pack = packServiceAdmin.findById(packId);
		pack.setStatus(!pack.isStatus());
		return packServiceAdmin.update(pack);
		
	}
	
	@RequestMapping(value = {"checkStatusCategory"}, method = RequestMethod.GET, produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
	public Category checkStatusCategory(@RequestParam("categoryId") int categoryId) {
		
		Category category = categoryServiceAdmin.findById(categoryId);
		category.setStatus(!category.isStatus());
		return categoryServiceAdmin.update(category);
		
	}
	
	@RequestMapping(value = {"checkStatusQuiz"}, method = RequestMethod.GET, produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
	public Quiz checkStatusQuiz(@RequestParam("quizId") int quizId) {
		
		Quiz quiz = quizServiceAdmin.findById(quizId);
		quiz.setStatus(!quiz.isStatus());
		return quizServiceAdmin.update(quiz);
		
	}
	
	@RequestMapping(value = "findAllQuizWithCategory", method = RequestMethod.GET, produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
	public List<QuizAjax> findAllQuizWithCategory(){
		return quizServiceAdmin.findAllAjaxByCategoryId();
	}
	
	@RequestMapping(value = "findByCategoryIdWithQuiz", method = RequestMethod.GET, produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
	public List<QuizAjax> findByCategoryIdWithQuiz(@RequestParam("categoryId") int categoryId){
		return quizServiceAdmin.findAjaxByCategoryId(categoryId);
	}
}
