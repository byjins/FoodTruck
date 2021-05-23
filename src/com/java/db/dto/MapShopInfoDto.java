package com.java.db.dto;

public class MapShopInfoDto {
	private String shopNum = null;
	private Double shopScore = null;
	private Double shopAreaX = null;
	private Double shopAreaY = null;
	private String shopIntro = null;
	private String shopStat = null;
	
	public MapShopInfoDto() {}
	
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
	public String getShopStat() {
		return shopStat;
	}
	public void setShopStat(String shopStat) {
		this.shopStat = shopStat;
	}
	public MapShopInfoDto(String shopNum, Double shopScore, Double shopAreaX, Double shopAreaY, String shopIntro,
			String shopStat) {
		super();
		this.shopNum = shopNum;
		this.shopScore = shopScore;
		this.shopAreaX = shopAreaX;
		this.shopAreaY = shopAreaY;
		this.shopIntro = shopIntro;
		this.shopStat = shopStat;
	}
	
}
