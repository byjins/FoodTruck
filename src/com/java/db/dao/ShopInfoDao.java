package com.java.db.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.java.db.dto.ShopInfoDto;

public class ShopInfoDao {

	static String driver = "org.mariadb.jdbc.Driver";
	static String url = "jdbc:mariadb://localhost:3306/Hungry";
	static String uid = "Hungry";
	static String pwd = "123456";

	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	public ShopInfoDao() {
		try {
			Class.forName(driver);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public ShopInfoDto shopinfo(String shopnum) {
		
		ShopInfoDto dto = new ShopInfoDto();
        String query = "select A.shop_name, B.shop_areax, B.shop_areay, B.shop_score, B.shop_intro from shop_manager A, shop_info B where A.shop_num = ? and B.shop_num = ?";

		try {
			con = DriverManager.getConnection(url, uid, pwd);
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, shopnum);
			pstmt.setString(2, shopnum);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
					
				
					dto.setShopName(rs.getString("shop_name"));
					dto.setShopAreaX(rs.getDouble("shop_areax"));
					dto.setShopAreaY(rs.getDouble("shop_areay"));
					dto.setShopScore(rs.getDouble("shop_score"));
					dto.setShopIntro(rs.getString("shop_intro"));
					
					System.out.println(dto.getShopNum());
					return dto;
				
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;

	}

}