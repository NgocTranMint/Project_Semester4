package com.demo.services.faculty;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.demo.entites.QuestionAjax;
import com.demo.entites.QuizAjax;
import com.demo.models.Question;
import com.demo.models.Quiz;
import com.demo.repositories.admin.QuizRepositoryAdmin;
import com.demo.repositories.faculty.QuestionRepositoryFaculty;

@Service
public class QuestionSeviceFacultyImpl implements QuestionServiceFaculty{

	@Autowired
	private QuestionRepositoryFaculty questionRepositoryFaculty;

	@Override
	public Question findById(int id) {
		return questionRepositoryFaculty.findById(id).get();
	}
	
	// this method was not be completed!
	@Override
	public Question create(Question question) {
		try {
			return questionRepositoryFaculty.save(question);
		} catch (Exception e) {
			return null;
		}
		
	}
	
	// this method was not be completed!
	@Override
	public Question update(Question question) {
		
		return questionRepositoryFaculty.save(question);
		
	}

	@Override
	public void deleteById(int id) {
		questionRepositoryFaculty.deleteById(id);
	}

	@Override
	public List<Question> findAllQuestion() {
		
		return (List<Question>) questionRepositoryFaculty.findAll();

	}

	@Override
	public QuestionAjax findByIdAjax(int questionId) {
		return questionRepositoryFaculty.findByIdAjax(questionId);
	}
	
	 public Page<Question> getPage(int currentPage, int pageSize, String sort){
		 Pageable pageable = PageRequest.of(currentPage - 1, pageSize, Sort.by(sort).descending());
			return this.questionRepositoryFaculty.findAll(pageable);
	    }

	@Override
	public Page<Question> getAllQuestionByQuizId(int currentPage, int pageSize, String sort, int quizId) {
		Pageable pageable = PageRequest.of(currentPage - 1, pageSize, Sort.by(sort).descending());
		return this.questionRepositoryFaculty.getAllQuestionByQuizId(quizId, pageable);
	}
	 
	 
}
