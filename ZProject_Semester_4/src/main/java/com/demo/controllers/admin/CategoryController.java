package com.demo.controllers.admin;

import org.mindrot.jbcrypt.BCrypt;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.demo.helpers.UploadHelper;
import com.demo.models.Account;
import com.demo.models.Category;
import com.demo.models.Role;
import com.demo.services.AccountService;
import com.demo.services.admin.CategoryServiceAdmin;
import com.demo.services.admin.RoleServiceAdmin;

@Controller
@RequestMapping(value = {"admin/category"})
public class CategoryController {
	
	@Autowired
	private AccountService accountService;
	
	@Autowired
	private CategoryServiceAdmin categoryServiceAdmin;
	
	@RequestMapping(value = {"", "index"}, method = RequestMethod.GET)
	public String index(ModelMap modelMap, Model model) {
		
		return pagination(1, 25, "categoryId", modelMap, model);
		
	}
	
	@RequestMapping(value = { "create" }, method = RequestMethod.POST)
	public String create(@ModelAttribute("category") Category category, ModelMap modelMap) {
		
		categoryServiceAdmin.create(category);

		return "redirect:/admin/category/index";
	}
	
	@RequestMapping(value = { "delete" }, method = RequestMethod.GET)
	public String delete(@RequestParam("categoryID") int categoryID) {

		categoryServiceAdmin.deleteById(categoryID);

		return "redirect:/admin/category/index";
	}
	
	@RequestMapping(value = { "edit" }, method = RequestMethod.POST)
	public String edit(@ModelAttribute("category") Category category) {
		categoryServiceAdmin.update(category);
		return "redirect:/admin/category/index";
	}
	
	@RequestMapping(value = {"pagination"}, method = RequestMethod.GET)
	public String pagination(@RequestParam(name = "currentPage") int currentPage, @RequestParam(name = "pageSize") int pageSize, @RequestParam(name = "sort") String sort,
			ModelMap modelMap, Model model) {
		int pageSizee = pageSize;

		Page<Category> pages = categoryServiceAdmin.getPage(currentPage, pageSizee, sort);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("totalPages", pages.getTotalPages());
		model.addAttribute("totalElements", pages.getTotalElements());
		model.addAttribute("pageSize", pageSizee);
		model.addAttribute("sort", sort);
		model.addAttribute("categories", pages.getContent());

		Category category = new Category();	
		modelMap.put("category", category);


		return "admin/category/index";
	}
}
