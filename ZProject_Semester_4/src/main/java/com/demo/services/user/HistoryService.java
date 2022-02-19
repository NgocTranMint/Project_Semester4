package com.demo.services.user;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.repository.query.Param;

import com.demo.models.History;

public interface HistoryService {

	public History findById(int id);

	public History findHistoryByAccounIdAndQuizId(int accountId, int quizId);

	public History create(History history);

	public History update(History history);

	public Page<History> getAllHistoryByAccountId(int currentPage, int pageSize, String sort, int accountId);

	public List<History> findAllByAccountId(int accountId);

	public List<History> findByQuizId(int quizId);

	public List<History> findAll();
}
