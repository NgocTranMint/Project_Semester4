package com.demo.services.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.demo.entites.PayAjax;
import com.demo.models.Pay;
import com.demo.models.Salary;
import com.demo.repositories.admin.PayRepositoryAdmin;

@Service
public class PaySeviceAdminImpl implements PayServiceAdmin{

	@Autowired
	private PayRepositoryAdmin payRepositoryAdmin;

	@Override
	public Pay findById(int id) {
		return payRepositoryAdmin.findById(id).get();
	}
	
	// this method was not be completed!
	@Override
	public Pay create(Pay Pay) {
		Pay.setPayStatus(true);
		return payRepositoryAdmin.save(Pay);
	}
	
	// this method was not be completed!
	@Override
	public Pay update(Pay Pay) {
		
		return payRepositoryAdmin.save(Pay);
		
	}

	@Override
	public void deleteById(int id) {
		payRepositoryAdmin.deleteById(id);
	}

	@Override
	public List<Pay> findAllPay() {
		
		return (List<Pay>) payRepositoryAdmin.findAll();

	}


	@Override
	public PayAjax findByIdAjax(int PayId) {
		return payRepositoryAdmin.findByIdAjax(PayId);
	}

	 public Page<Pay> getPage(int currentPage, int pageSize, String sort){
		 Pageable pageable = PageRequest.of(currentPage - 1, pageSize, Sort.by(sort).descending());
			return this.payRepositoryAdmin.findAll(pageable);
	    }

	@Override
	public List<PayAjax> findThisYear(int year, int month) {
		// TODO Auto-generated method stub
		return payRepositoryAdmin.findThisYear(year, month);
	}

	@Override
	public double sumadminsalarybyyearandmonth(int year, int month) {
		// TODO Auto-generated method stub
		return payRepositoryAdmin.sumadminsalarybyyearandmonth(year, month);
	}
	public Page<Pay> searchByUsername(int currentPage, int pageSize, String sort, String username) {
		Pageable pageable = PageRequest.of(currentPage - 1, pageSize, Sort.by(sort).descending());
		return this.payRepositoryAdmin.searchByUsername(username, pageable);
	}

	
	
	

}
