package com.java.db.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.java.db.dto.MapShopInfoDto;
import com.java.db.dto.SManagerInfoDto;
import com.java.db.dto.ShopInfoDto;



public class SearchDao {

	static String driver = "org.mariadb.jdbc.Driver";
	static String url = "jdbc:mariadb://localhost:3306/Hungry";
	static String uid = "Hungry";
	static String pwd = "123456";
	
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	

	public SearchDao() {
		try {
			Class.forName(driver);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	// 검색 -정현
	public MapShopInfoDto SearchTruck(String shopname) {
		String query = "SELECT * FROM shop_info WHERE shop_num IN ( SELECT shop_num FROM shop_manager WHERE shop_name = ?)";
		
	
		try {
			con = DriverManager.getConnection(url, uid, pwd);
			pstmt = con.prepareStatement(query);

			pstmt.setString(1,shopname);

			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				
				String shop_num = rs.getString("shop_num");
				Double shop_score = rs.getDouble("shop_score");
				Double areax = rs.getDouble("shop_areax");
				Double areay = rs.getDouble("shop_areay");
				String shop_intro = rs.getString("shop_intro");
				String shop_stat = rs.getString("shop_stat");

				MapShopInfoDto dto = new MapShopInfoDto(shop_num, shop_score, areax, areay, shop_intro, shop_stat);
				
				return dto;
			
			
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
		return null;
	}
	
	
}
