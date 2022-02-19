package com.demo.controllers.faculty;

import java.util.Date;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.security.core.Authentication;
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
import com.demo.models.Category;
import com.demo.models.Quiz;
import com.demo.services.AccountService;
import com.demo.services.admin.CategoryServiceAdmin;
import com.demo.services.faculty.QuizServiceFaculty;

@Controller
@RequestMapping(value = { "faculty/quiz" })
public class QuizFacultyController implements ServletContextAware{

	@Autowired
	private QuizServiceFaculty quizServiceFaculty;

	@Autowired
	private AccountService accountService;

	@Autowired
	private CategoryServiceAdmin categoryServiceAdmin;
	
	private ServletContext servletContext;
	
	@Override
	public void setServletContext(ServletContext servletContext) {

		this.servletContext = servletContext;

	}

	@RequestMapping(value = { "", "index" }, method = RequestMethod.GET)
	public String index(ModelMap modelMap, Model model, Authentication authentication) {
		modelMap.put("categories", categoryServiceAdmin.findAllCategory());
		return pagination(1, 25, "quiz_id", modelMap, model, authentication);
	}

	@RequestMapping(value = { "create" }, method = RequestMethod.POST)
	public String create(@ModelAttribute("quiz") Quiz quiz, @RequestParam("categoryId") int categoryId, 
			ModelMap modelMap, Authentication authentication, @RequestParam(value = "file") MultipartFile file,
			RedirectAttributes redirectAttributes) {
		
		String fileNameUpload = UploadHelper.upload(servletContext, file);
		redirectAttributes.addFlashAttribute("fileName", fileNameUpload);
		
		quiz.setImage(fileNameUpload);
		quiz.setCategory(categoryServiceAdmin.findById(categoryId));
		quiz.setAccount(accountService.findByUsername(authentication.getName()));
		quiz.setDateCreated(new Date());
		
		quizServiceFaculty.create(quiz);

		return "redirect:/faculty/quiz/index";
	}

	@RequestMapping(value = { "edit" }, method = RequestMethod.POST)
	public String edit(@ModelAttribute("quiz") Quiz quiz, Authentication authentication,
			@RequestParam(value = "categoryId") int categoryId, @RequestParam(value = "file") MultipartFile file,
			RedirectAttributes redirectAttributes) {

		Quiz quiz2 = quizServiceFaculty.findById(quiz.getQuizId());
		Account account = accountService.findByUsername(authentication.getName());
		Category category = categoryServiceAdmin.findById(categoryId);
		quiz.setCategory(category);
		quiz.setAccount(account);
		quiz.setDateCreated(quiz2.getDateCreated());
		quiz.setTimer(quiz2.getTimer());
		String fileNameUpload = UploadHelper.upload(servletContext, file);
		if (fileNameUpload != null) {
			redirectAttributes.addFlashAttribute("fileName", fileNameUpload);
			quiz.setImage(fileNameUpload);
		}
		quizServiceFaculty.update(quiz);
		//return pagination(1, 25, "quizId", modelMap, model, authentication);
		return "redirect:/faculty/quiz/index";
	}

	@RequestMapping(value = { "delete" }, method = RequestMethod.GET)
	public String delete(@RequestParam("quizID") int quizID) {

		quizServiceFaculty.deleteById(quizID);

		return "redirect:/faculty/quiz/index";
	}

	@RequestMapping(value = { "pagination" }, method = RequestMethod.GET)
	public String pagination(@RequestParam(name = "currentPage") int currentPage,
			@RequestParam(name = "pageSize") int pageSize, @RequestParam(name = "sort") String sort, ModelMap modelMap,
			Model model, Authentication authentication) {

		Account account = accountService.findByUsername(authentication.getName());
		
		modelMap.put("categories", categoryServiceAdmin.findAllCategory());
		int pageSizee = pageSize;

		Page<Quiz> pages = quizServiceFaculty.getAllQuizByAccountId(currentPage, pageSizee, sort, account.getAccountId());
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("totalPages", pages.getTotalPages());
		model.addAttribute("totalElements", pages.getTotalElements());
		model.addAttribute("pageSize", pageSizee);
		model.addAttribute("sort", sort);
		model.addAttribute("quizs", pages.getContent());

		Quiz quiz = new Quiz();
		modelMap.put("quiz", quiz);

		return "faculty/quiz/index";
	}
	
	@RequestMapping(value = "search", method = RequestMethod.GET)
	public String search(ModelMap modelMap, Model model, @RequestParam("keyword") String fullname) {

		return searchPagination(1, 25, "account_id", modelMap, model, fullname);
	}
	
	public String searchPagination(int currentPage,int pageSize,String sort, ModelMap modelMap,
			Model model, String keyword) {
		
		int pageSizee = pageSize;

			Page<Quiz> pages = quizServiceFaculty.searchByKeyword(currentPage, pageSizee, sort, keyword);
			model.addAttribute("currentPage", currentPage);
			model.addAttribute("totalPages", pages.getTotalPages());
			model.addAttribute("totalElements", pages.getTotalElements());
			model.addAttribute("pageSize", pageSizee);
			model.addAttribute("sort", sort);
			model.addAttribute("quizs", pages.getContent());

			Quiz quiz = new Quiz();		
			modelMap.put("quiz", quiz);

		return "faculty/quiz/index";
	}

}
