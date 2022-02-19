package com.demo.controllers.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = { "admin", "admin/login"})
public class LoginAdminController {

	@RequestMapping(value = {"", "index" }, method = RequestMethod.GET)
	public String index() {
		
	
		return "admin/login/index";
	}
}
