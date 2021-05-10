package com.java.db.dto;

public class MenuDto {
	
	private String menuName = null;
	private int menuPrice = 0;
	private String shopName = null;
	private int menuNum = 0;
	private String shopNum = null;
	private String menuIntro = null;
	
	
	public MenuDto(int menuNum, String menuName, int menuPrice, String menuIntro) {
		this.menuNum = menuNum;
		this.menuName = menuName;
		this.menuPrice = menuPrice;
		this.menuIntro = menuIntro;
	}


	public MenuDto(int menuNum, String menuName, int menuPrice, String menuIntro, String shopName, String shopNum) {
		super();
		this.menuName = menuName;
		this.menuPrice = menuPrice;
		this.shopName = shopName;
		this.menuNum = menuNum;
		this.shopNum = shopNum;
		this.menuIntro = menuIntro;
	}


	public String getMenuName() {
		return menuName;
	}
	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}
	public int getMenuPrice() {
		return menuPrice;
	}
	public void setMenuPrice(int menuPrice) {
		this.menuPrice = menuPrice;
	}
	public String getShopName() {
		return shopName;
	}
	public void setShopName(String shopName) {
		this.shopName = shopName;
	}
	public int getMenuNum() {
		return menuNum;
	}
	public void setMenuNum(int menuNum) {
		this.menuNum = menuNum;
	}
	public String getShopNum() {
		return shopNum;
	}
	public void setShopNum(String shopNum) {
		this.shopNum = shopNum;
	}
	public String getMenuIntro() {
		return menuIntro;
	}
	public void setMenuIntro(String menuIntro) {
		this.menuIntro = menuIntro;
	}
	
	
	
	
	
}