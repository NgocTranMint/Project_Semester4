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

import com.demo.models.Pack;
import com.demo.services.AccountService;
import com.demo.services.admin.PackServiceAdmin;

@Controller
@RequestMapping(value = { "admin/pack" })
public class PackAdminController {

	@Autowired
	private PackServiceAdmin packServiceAdmin;

	@Autowired
	private AccountService accountService;

	@RequestMapping(value = { "", "index" }, method = RequestMethod.GET)
	public String index(ModelMap modelMap, Model model) {

		return pagination(1, 25, "packId", modelMap, model);

	}

	@RequestMapping(value = { "create" }, method = RequestMethod.POST)
	public String create(@ModelAttribute("pack") Pack pack, ModelMap modelMap) {

		packServiceAdmin.create(pack);

		return "redirect:/admin/pack/index";
	}

	@RequestMapping(value = { "update" }, method = RequestMethod.POST)
	public String edit(@ModelAttribute("pack") Pack pack) {
		System.out.println(pack.getPackId());
		if (pack.getTitle() == "") {
			pack.setTitle(packServiceAdmin.findById(pack.getPackId()).getTitle());
		}

		packServiceAdmin.update(pack);

		return "redirect:/admin/pack/index";
	}

	@RequestMapping(value = { "delete" }, method = RequestMethod.GET)
	public String delete(@RequestParam("packID") int packID) {

		packServiceAdmin.deleteById(packID);

		return "redirect:/admin/pack/index";
	}

	@RequestMapping(value = { "pagination" }, method = RequestMethod.GET)
	public String pagination(@RequestParam(name = "currentPage") int currentPage,
			@RequestParam(name = "pageSize") int pageSize, @RequestParam(name = "sort") String sort, ModelMap modelMap,
			Model model) {

		int pageSizee = pageSize;

		Page<Pack> pages = packServiceAdmin.getPage(currentPage, pageSizee, sort);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("totalPages", pages.getTotalPages());
		model.addAttribute("totalElements", pages.getTotalElements());
		model.addAttribute("pageSize", pageSizee);
		model.addAttribute("sort", sort);
		model.addAttribute("packs", pages.getContent());

		Pack pack = new Pack();
		modelMap.put("pack", pack);

		return "admin/pack/index";
	}

}
