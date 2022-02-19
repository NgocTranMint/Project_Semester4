package com.demo.entites;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.demo.models.Account;

public class PackAjax {


	private Integer packId;
	private String title;
	private int expiry;
	private float fee;
	private String description;
	private boolean status;
	
	public Integer getPackId() {
		return packId;
	}
	public void setPackId(Integer packId) {
		this.packId = packId;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getExpiry() {
		return expiry;
	}
	public void setExpiry(int expiry) {
		this.expiry = expiry;
	}
	public float getFee() {
		return fee;
	}
	public void setFee(float fee) {
		this.fee = fee;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public boolean isStatus() {
		return status;
	}
	public void setStatus(boolean status) {
		this.status = status;
	}
	public PackAjax(Integer packId, String title, int expiry, float fee, String description, boolean status) {
		super();
		this.packId = packId;
		this.title = title;
		this.expiry = expiry;
		this.fee = fee;
		this.description = description;
		this.status = status;
	}
	public PackAjax() {
		super();
	}
	
	
	
	
}
