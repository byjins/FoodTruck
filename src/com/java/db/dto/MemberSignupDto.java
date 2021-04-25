package com.java.db.dto;

public class MemberSignupDto {
	private String memberID;
	private String memberPW;
	private String memberName;
	private String age;
	private String phone;
	
	
	public MemberSignupDto(String memberID, String memberPW, String memberName, String age, String phone) {
		super();
		this.memberID = memberID;
		this.memberPW = memberPW;
		this.memberName = memberName;
		this.age = age;
		this.phone = phone;
	}
	
	public MemberSignupDto() {
		
	}
	
	
	public String getMemberID() {
		return memberID;
	}
	public void setMemberID(String memberID) {
		this.memberID = memberID;
	}
	public String getMemberPW() {
		return memberPW;
	}
	public void setMemberPW(String memberPW) {
		this.memberPW = memberPW;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	
}
