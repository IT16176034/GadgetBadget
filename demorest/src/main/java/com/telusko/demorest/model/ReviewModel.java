package com.telusko.demorest.model;

import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
public class ReviewModel {
	
	private int review_id;
	private int project_id;
	private String review;
	public int getReview_id() {
		return review_id;
	}
	public void setReview_id(int review_id) {
		this.review_id = review_id;
	}
	public int getProject_id() {
		return project_id;
	}
	public void setProject_id(int project_id) {
		this.project_id = project_id;
	}
	public String getReview() {
		return review;
	}
	public void setReview(String review) {
		this.review = review;
	}
	
	

}
