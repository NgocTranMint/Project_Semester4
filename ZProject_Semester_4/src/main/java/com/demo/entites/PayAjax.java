package com.demo.entites;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.demo.models.Account;

public class PayAjax {


	private Integer payId;
	private Integer accountId;
	private String username;
	private String payment;
	private String title;
	private float fee;
	
	@DateTimeFormat( pattern = "MM/dd/yyyy hh:mm:ss")
	private Date datePaid;
	private boolean payStatus;
	public Integer getPayId() {
		return payId;
	}
	public void setPayId(Integer payId) {
		this.payId = payId;
	}
	public Integer getAccountId() {
		return accountId;
	}
	public void setAccountId(Integer accountId) {
		this.accountId = accountId;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPayment() {
		return payment;
	}
	public void setPayment(String payment) {
		this.payment = payment;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public float getFee() {
		return fee;
	}
	public void setFee(float fee) {
		this.fee = fee;
	}
	public Date getDatePaid() {
		return datePaid;
	}
	public void setDatePaid(Date datePaid) {
		this.datePaid = datePaid;
	}
	public boolean isPayStatus() {
		return payStatus;
	}
	public void setPayStatus(boolean payStatus) {
		this.payStatus = payStatus;
	}
	public PayAjax(Integer payId, Integer accountId, String username, String payment, String title, float fee,
			Date datePaid, boolean payStatus) {
		super();
		this.payId = payId;
		this.accountId = accountId;
		this.username = username;
		this.payment = payment;
		this.title = title;
		this.fee = fee;
		this.datePaid = datePaid;
		this.payStatus = payStatus;
	}
	public PayAjax() {
		super();
	}
	
	
	
	
	
	
}
