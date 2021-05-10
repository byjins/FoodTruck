package com.java.db.dto;

public class ShopGeolocationDto {

	private double posx , posy;
	private String shop_num;

	
	public ShopGeolocationDto() {}
	
	public ShopGeolocationDto(double posx, double posy, String shop_num) {
		super();
		this.posx = posx;
		this.posy = posy;
		this.shop_num = shop_num;
	}

	public double getPosx() {
		return posx;
	}

	public void setPosx(double posx) {
		this.posx = posx;
	}

	public double getPosy() {
		return posy;
	}

	public void setPosy(double posy) {
		this.posy = posy;
	}

	public String getShop_num() {
		return shop_num;
	}

	public void setShop_num(String shop_num) {
		this.shop_num = shop_num;
	}

	
	
	
	
}
