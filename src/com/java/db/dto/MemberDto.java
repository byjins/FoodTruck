package com.java.db.dto;

public class MemberDto {
	private String id,pw,name,phone;
	int age;
	public MemberDto(String id, String pw, String name, int age, String phone) {
		super();
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.age = age;
		this.phone = phone;

	}
	public MemberDto() {}

	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}

	
}
