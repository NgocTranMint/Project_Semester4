package com.demo.entites;

import java.util.Date;

public class CommentAjax {

	private Integer commentId;
	private String fullname;
	private String title;
	private String comment;
	private boolean status;
	private Date createDate;
	
	public Integer getCommentId() {
		return commentId;
	}
	public void setCommentId(Integer commentId) {
		this.commentId = commentId;
	}
	public String getFullname() {
		return fullname;
	}
	public void setFullname(String fullname) {
		this.fullname = fullname;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public boolean isStatus() {
		return status;
	}
	public void setStatus(boolean status) {
		this.status = status;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public CommentAjax(Integer commentId, String fullname, String title, String comment, boolean status,
			Date createDate) {
		super();
		this.commentId = commentId;
		this.fullname = fullname;
		this.title = title;
		this.comment = comment;
		this.status = status;
		this.createDate = createDate;
	}
	public CommentAjax() {
		super();
	}
	
	
}
