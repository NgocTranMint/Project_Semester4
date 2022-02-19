package com.demo.controllers.user;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.MimeTypeUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.demo.entites.AccountAjax;
import com.demo.entites.RatingAjax;
import com.demo.models.Account;
import com.demo.models.Quiz;
import com.demo.models.Rating;
import com.demo.services.AccountService;
import com.demo.services.faculty.QuizServiceFaculty;
import com.demo.services.user.AccountServiceUser;
import com.demo.services.user.RatingServiceUser;

@RestController
@RequestMapping("user/ajax")
public class AjaxUserController {
	
	@Autowired
	private AccountServiceUser accountServiceUser;
	
	@Autowired
	private RatingServiceUser ratingServiceUser;
	
	@Autowired
	private QuizServiceFaculty quizServiceFaculty;
	
	@Autowired
	private AccountService accountService;

	@RequestMapping(value = {"sessionpackid"}, method = RequestMethod.GET, produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
	public void sessionPackId(@RequestParam("packId") int packId, HttpServletRequest request) {
		
		HttpSession httpSession = request.getSession();
		httpSession.setAttribute("packId", packId);
		
	}
	
	@RequestMapping(value = {"findaccountbyid"}, method = RequestMethod.GET, produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
	public AccountAjax findAccountById(@RequestParam("accountId") int accountId) {
		
		return accountServiceUser.findByIdAjax(accountId);
		
	}
	
	@RequestMapping(value = {"sendRating"}, method = RequestMethod.GET, produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
	public RatingAjax sendRating(@RequestParam("numberRating") String numberRating) {
		
		String[] number = numberRating.split("_", -1);
		Rating rating = new Rating();
		Quiz quiz = quizServiceFaculty.findById(Integer.parseInt(number[1]));
		Account account = accountService.findById(Integer.parseInt(number[2]));
		
		Rating ratingPresent = ratingServiceUser.findByAccountIdAndQuizId(Integer.parseInt(number[2]), Integer.parseInt(number[1]));
		if(ratingPresent != null) {
			rating.setRatingId(ratingPresent.getRatingId());
			rating.setAccount(account);
			rating.setQuiz(quiz);
			rating.setStar(Integer.parseInt(number[0]));
			rating.setCreateDate(new Date());
			rating.setStatus(true);
		} else {
			rating.setAccount(account);
			rating.setQuiz(quiz);
			rating.setStar(Integer.parseInt(number[0]));
			rating.setCreateDate(new Date());
			rating.setStatus(true);
			
		}
		
		rating = ratingServiceUser.save(rating);
		RatingAjax ratingAjax = new RatingAjax();
		ratingAjax.setRatingId(rating.getRatingId());
		ratingAjax.setAccountId(rating.getAccount().getAccountId());
		ratingAjax.setQuizId(rating.getQuiz().getQuizId());
		ratingAjax.setStar(rating.getStar());
		ratingAjax.setCreateDate(rating.getCreateDate());
		ratingAjax.setStatus(rating.isStatus());
		return ratingAjax;
	}
}
