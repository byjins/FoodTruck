package com.java.db.dto;

public class SManagerInfoDto {
	private String num,val,id,pw,shopName,adress,phone,adminName;

	

	
	public SManagerInfoDto(String num, String val, String id, String pw, String shopName, String adress, String phone,
			String adminName) {
		super();
		this.num = num;
		this.val = val;
		this.id = id;
		this.pw = pw;
		this.shopName = shopName;
		this.adress = adress;
		this.phone = phone;
		this.adminName = adminName;
	}
	
	public SManagerInfoDto() {}
	
	public String getNum() {
		return num;
	}

	public void setNum(String num) {
		this.num = num;
	}

	public String getVal() {
		return val;
	}

	public void setVal(String val) {
		this.val = val;
	}

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

	public String getShopName() {
		return shopName;
	}

	public void setShopName(String shopName) {
		this.shopName = shopName;
	}

	public String getAdress() {
		return adress;
	}

	public void setAdress(String adress) {
		this.adress = adress;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAdminName() {
		return adminName;
	}

	public void setAdminName(String adminName) {
		this.adminName = adminName;
	}

}
