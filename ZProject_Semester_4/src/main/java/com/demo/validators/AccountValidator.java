package com.demo.validators;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.demo.models.Account;
import com.demo.services.AccountService;

@Component
public class AccountValidator implements Validator {
	@Autowired
	private AccountService accountService;
	@Override
	public boolean supports(Class<?> clazz) {
		// TODO Auto-generated method stub
		return Account.class.equals(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		// TODO Auto-generated method stub
		Account account = (Account) target;
		if (accountService.findByUsername(account.getUsername())!=null) {
			errors.rejectValue("username", "account.username.exists");
		}
		if (account.getFullname()==null) {
			errors.rejectValue("fullname", "NotEmpty");
		}
		if (account.getPassword()==null) {
			errors.rejectValue("password", "NotEmpty");
		}
		if (account.getAddr()==null) {
			errors.rejectValue("addr", "NotEmpty");
		}
		if (account.getPhone()==null) {
			errors.rejectValue("phone", "NotEmpty");
		}
		if (account.getAvatar()==null) {
			errors.rejectValue("avatar", "NotEmpty");
		}
		if (account.getEmail()==null) {
			errors.rejectValue("email", "NotEmpty");
		}
	}

}
