package com.java.db.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.java.db.dto.RoadShopDto;
import com.java.db.dto.ShopInfoDto;

public class RoadShopDao {

	static String driver = "org.mariadb.jdbc.Driver";
	static String url = "jdbc:mariadb://localhost:3306/Hungry";
	static String uid = "Hungry";
	static String pwd = "123456";

	public ArrayList<RoadShopDto> RoadShopSelect() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "select * from roadshop_infonum";
		
		ArrayList<RoadShopDto> dtos = new ArrayList<RoadShopDto>();
		
		try {
        	con = DriverManager.getConnection(url,uid,pwd);
            pstmt = con.prepareStatement(query);

            
            rs = pstmt.executeQuery();

			while (rs.next()) {
				String road_num = rs.getString("road_num");
				Double posx = rs.getDouble("posx");
				Double posy = rs.getDouble("posy");
				String road_type = rs.getString("road_type");
				
				
				RoadShopDto dto = new RoadShopDto(road_num,posx,posy,road_type);
				dtos.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (con != null)
					con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return dtos;
	}
	
}
