package com.java.db.dto;

public class ShopInfoDto {
	private String shopNum = null;
	private String shopName = null;
	private Double shopScore = null;
	private Double shopAreaX = null;
	private Double shopAreaY = null;
	private String shopIntro = null;
	private String shopimg = null;
	
	
	public ShopInfoDto() {
		
	}
	
	public ShopInfoDto(String shopNum, Double shopScore, Double shopAreaX, Double shopAreaY, String shopIntro, String shopName) {
		super();
		this.shopNum = shopNum;
		this.shopScore = shopScore;
		this.shopAreaX = shopAreaX;
		this.shopAreaY = shopAreaY;
		this.shopIntro = shopIntro;
		this.shopName = shopName;
	}



	public String getShopNum() {
		return shopNum;
	}
	public void setShopNum(String shopNum) {
		this.shopNum = shopNum;
	}
	public Double getShopScore() {
		return shopScore;
	}
	public void setShopScore(Double shopScore) {
		this.shopScore = shopScore;
	}
	public Double getShopAreaX() {
		return shopAreaX;
	}
	public void setShopAreaX(Double shopAreaX) {
		this.shopAreaX = shopAreaX;
	}
	public Double getShopAreaY() {
		return shopAreaY;
	}
	public void setShopAreaY(Double shopAreaY) {
		this.shopAreaY = shopAreaY;
	}
	public String getShopIntro() {
		return shopIntro;
	}
	public void setShopIntro(String shopIntro) {
		this.shopIntro = shopIntro;
	}
	public String getShopName() {
		return shopName;
	}
	public void setShopName(String shopName) {
		this.shopName = shopName;
	}

	public String getShopimg() {
		return shopimg;
	}

	public void setShopimg(String shopimg) {
		this.shopimg = shopimg;
	}
	
}