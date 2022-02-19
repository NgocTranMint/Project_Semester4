package com.demo.controllers.admin;

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

import com.demo.models.Account;
import com.demo.models.Comment;
import com.demo.models.Rating;
import com.demo.repositories.admin.RatingRepositoryAdmin;
import com.demo.services.AccountService;
import com.demo.services.admin.CommentServiceAdmin;
import com.demo.services.admin.RatingServiceAdmin;

@Controller
@RequestMapping(value = {"admin/rating"})
public class RatingController {
	
	@Autowired
	private RatingServiceAdmin ratingServiceAdmin;
	
	@RequestMapping(value = {"", "index"}, method = RequestMethod.GET)
	public String index(ModelMap modelMap, Model model) {
		return pagination(1, 25, "ratingId", modelMap, model);
		
	}
	
	@RequestMapping(value = {"pagination"}, method = RequestMethod.GET)
	public String pagination(@RequestParam(name = "currentPage") int currentPage, @RequestParam(name = "pageSize") int pageSize, @RequestParam(name = "sort") String sort,
			ModelMap modelMap, Model model) {
		
		int pageSizee = pageSize;

		Page<Rating> pages = ratingServiceAdmin.getPage(currentPage, pageSizee, sort);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("totalPages", pages.getTotalPages());
		model.addAttribute("totalElements", pages.getTotalElements());
		model.addAttribute("pageSize", pageSizee);
		model.addAttribute("sort", sort);
		model.addAttribute("ratings", pages.getContent());

		Rating rating = new Rating();		
		modelMap.put("rating", rating);


		return "admin/rating/index";
	}
	
	@RequestMapping(value = "search", method = RequestMethod.GET)
	public String search(ModelMap modelMap, Model model, @RequestParam("keyword") String fullname) {

		return searchPagination(1, 25, "rating_id", modelMap, model, fullname);
	}
	
	public String searchPagination(int currentPage,int pageSize,String sort, ModelMap modelMap,
			Model model, String keyword) {
		
		int pageSizee = pageSize;

			Page<Rating> pages = ratingServiceAdmin.searchByKeyword(currentPage, pageSizee, sort, keyword);
			model.addAttribute("currentPage", currentPage);
			model.addAttribute("totalPages", pages.getTotalPages());
			model.addAttribute("totalElements", pages.getTotalElements());
			model.addAttribute("pageSize", pageSizee);
			model.addAttribute("sort", "ratingId");
			model.addAttribute("ratings", pages.getContent());

			Rating rating = new Rating();		
			modelMap.put("rating", rating);

		return "admin/rating/index";
	}
}
