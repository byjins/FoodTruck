package com.java.db.dto;

public class RoadShopDto {
	String road_num,city_class,city_subclass,road_main,road_sub,road_type;
	
	public RoadShopDto() {
		
	}

	public RoadShopDto(String road_num, String city_class, String city_subclass, String road_main, String road_sub,
			String road_type) {
		super();
		this.road_num = road_num;
		this.city_class = city_class;
		this.city_subclass = city_subclass;
		this.road_main = road_main;
		this.road_sub = road_sub;
		this.road_type = road_type;
	}

	public String getRoad_num() {
		return road_num;
	}

	public void setRoad_num(String road_num) {
		this.road_num = road_num;
	}

	public String getCity_class() {
		return city_class;
	}

	public void setCity_class(String city_class) {
		this.city_class = city_class;
	}

	public String getCity_subclass() {
		return city_subclass;
	}

	public void setCity_subclass(String city_subclass) {
		this.city_subclass = city_subclass;
	}

	public String getRoad_main() {
		return road_main;
	}

	public void setRoad_main(String road_main) {
		this.road_main = road_main;
	}

	public String getRoad_sub() {
		return road_sub;
	}

	public void setRoad_sub(String road_sub) {
		this.road_sub = road_sub;
	}

	public String getRoad_type() {
		return road_type;
	}

	public void setRoad_type(String road_type) {
		this.road_type = road_type;
	}

}
