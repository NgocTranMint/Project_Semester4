package com.demo.controllers.user;

import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.demo.models.Account;
import com.demo.models.Comment;
import com.demo.models.Quiz;
import com.demo.services.admin.CategoryServiceAdmin;
import com.demo.services.faculty.QuizServiceFaculty;
import com.demo.services.user.CommentServiceUser;


@Controller
@RequestMapping(value = {"user/ratingcomment"})
public class RatingCommentController {
	
	@Autowired
	private CategoryServiceAdmin categoryServiceAdmin;
	
	@Autowired
	private CommentServiceUser commentService;
	
	@Autowired
	private QuizServiceFaculty quizServiceFaculty;
	
	@RequestMapping(value = "sendComment", method = RequestMethod.POST)
	public String sendComment(ModelMap modelMap,HttpSession session, @RequestParam("message") String message,
			@RequestParam("quizIdComment") int quizIdComment) {

		modelMap.put("categories", categoryServiceAdmin.findAllCategory());
		Account account = new Account();
		modelMap.put("account", account);
		modelMap.put("course", true);
		
		// Xu li send Comment
		Comment comment = new Comment();
		Account accountComment = (Account) session.getAttribute("account");
		Quiz quiz = quizServiceFaculty.findById(quizIdComment);
		comment.setAccount(accountComment);
		comment.setQuiz(quiz);
		comment.setComment(message);
		comment.setCreateDate(new Date());
		commentService.save(comment);
		
		return "redirect:/user/course/quizdetails?quizId=" + quiz.getQuizId();
	}


}
