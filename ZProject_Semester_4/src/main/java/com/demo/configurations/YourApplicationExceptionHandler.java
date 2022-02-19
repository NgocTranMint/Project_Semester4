package com.demo.configurations;


import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.NoHandlerFoundException;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@ControllerAdvice
public class YourApplicationExceptionHandler {

	@ExceptionHandler(value = NoHandlerFoundException.class)
    public String exception(NoHandlerFoundException e, HttpServletRequest request, RedirectAttributes redirectAttributes) {
        return "404/index";
    }
	
}
