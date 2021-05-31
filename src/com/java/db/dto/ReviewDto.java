package com.java.db.dto;

public class ReviewDto {
	private int reviewNum = 0;
	private Double reviewScore = null;
	private String reviewDate = null;
	private String memberId = null;
	private String shopNum = null;
	private String reviewComment = null;

	public ReviewDto( int reviewNum, String reviewDate, String reviewComment, Double reviewScore) {

		this.reviewNum = reviewNum;
		this.reviewDate = reviewDate;
		this.reviewComment = reviewComment;
		this.reviewScore = reviewScore;
	}
	
	public ReviewDto(String memberid, String reviewDate, String reviewComment, Double reviewScore) {
		this.memberId = memberid;
		this.reviewDate = reviewDate;
		this.reviewComment = reviewComment;
		this.reviewScore = reviewScore;
	}
	
	public ReviewDto(int reviewNum, Double reviewScore, String memberId, String shopNum, String reviewComment, String reviewDate) {
		this.reviewNum = reviewNum;
		this.reviewScore = reviewScore;
		this.memberId = memberId;
		this.shopNum = shopNum;
		this.reviewComment = reviewComment;
		this.reviewDate = reviewDate;
	}

	
	
	public String getReviewDate() {
		return reviewDate;
	}

	public void setReviewDate(String reviewDate) {
		this.reviewDate = reviewDate;
	}

	public int getReviewNum() {
		return reviewNum;
	}

	public void setReviewNum(int reviewNum) {
		this.reviewNum = reviewNum;
	}

	public Double getreviewScore() {
		return reviewScore;
	}

	public void setreviewScore(Double reviewScore) {
		this.reviewScore = reviewScore;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getShopNum() {
		return shopNum;
	}

	public void setShopNum(String shopNum) {
		this.shopNum = shopNum;
	}

	public String getReviewComment() {
		return reviewComment;
	}

	public void setReviewComment(String reviewComment) {
		this.reviewComment = reviewComment;
	}
	
	
	
}
