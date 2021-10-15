package com.java.db.dto;

public class RoadShopDto {
	private String road_num;
	private Double posx;
	private Double posy;
	private String road_type;
	
	public RoadShopDto() {
		
	}

	
	public RoadShopDto(String road_num, Double posx, Double posy, String road_type) {
		super();
		this.road_num = road_num;
		this.posx = posx;
		this.posy = posy;
		this.road_type = road_type;
	}


	public String getRoad_num() {
		return road_num;
	}

	public void setRoad_num(String road_num) {
		this.road_num = road_num;
	}

	public Double getPosx() {
		return posx;
	}

	public void setPosx(Double posx) {
		this.posx = posx;
	}

	public Double getPosy() {
		return posy;
	}

	public void setPosy(Double posy) {
		this.posy = posy;
	}

	public String getRoad_type() {
		return road_type;
	}

	public void setRoad_type(String road_type) {
		this.road_type = road_type;
	}
	
	


}
