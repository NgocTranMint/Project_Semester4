package com.demo.services.user;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.demo.models.History;
import com.demo.repositories.user.HistoryRepository;

@Service
public class HistoryServiceImpl implements HistoryService{

	@Autowired
	private HistoryRepository historyRepository;

	@Override
	public History findById(int id) {
		return historyRepository.findById(id).get();
	}
	
	// this method was not be completed!
	@Override
	public History create(History history) {
		return historyRepository.save(history);
	}
	
	// this method was not be completed!
	@Override
	public History update(History history) {
		
		return historyRepository.save(history);
		
	}


	 public Page<History> getAllHistoryByAccountId(int currentPage, int pageSize, String sort, int accountId){
		 Pageable pageable = PageRequest.of(currentPage - 1, pageSize, Sort.by(sort).descending());
			return this.historyRepository.getAllQuizByAccountId(accountId, pageable);
	    }

	@Override
	public List<History> findAllByAccountId(int accountId) {
		return historyRepository.findAllByAccountId(accountId);
	}

	@Override
	public History findHistoryByAccounIdAndQuizId(int accountId, int quizId) {
		return historyRepository.findHistoryByAccounIdAndQuizId(accountId, quizId);
	}

	

	@Override
	public List<History> findAll() {
		// TODO Auto-generated method stub
		return (List<History>) historyRepository.findAll();
	}

	@Override
	public List<History> findByQuizId(int quizId) {
		// TODO Auto-generated method stub
		return historyRepository.findByQuizId(quizId);
	}

}
