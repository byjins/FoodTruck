package com.java.db.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.java.db.dto.MapShopInfoDto;
import com.java.db.dto.MemberDto;
import com.java.db.dto.SManagerInfoDto;
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
		String query = "select A.shop_name, B.shop_areax, B.shop_areay, B.shop_score, B.shop_intro, B.shop_img from shop_manager A, shop_info B where A.shop_num = ? and B.shop_num = ?";

		try {
			con = DriverManager.getConnection(url, uid, pwd);
			pstmt = con.prepareStatement(query);

			pstmt.setString(1, shopnum);
			pstmt.setString(2, shopnum);
			rs = pstmt.executeQuery();

			if (rs.next()) {

				dto.setShopName(rs.getString("shop_name"));
				dto.setShopAreaX(rs.getDouble("shop_areax"));
				dto.setShopAreaY(rs.getDouble("shop_areay"));
				dto.setShopScore(rs.getDouble("shop_score"));
				dto.setShopIntro(rs.getString("shop_intro"));
				dto.setShopimg(rs.getString("shop_img"));

				System.out.println(dto.getShopNum());
				return dto;

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;

	}

	public ArrayList<ShopInfoDto> shopSelect() {
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		String query = "select * from shop_info";
		ArrayList<ShopInfoDto> dtos = new ArrayList<ShopInfoDto>();
		try {
			con = DriverManager.getConnection(url, uid, pwd);
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);

			while (rs.next()) {
				String shop_num = rs.getString("shop_num");
				Double shop_score = rs.getDouble("shop_score");
				Double areax = rs.getDouble("shop_areax");
				Double areay = rs.getDouble("shop_areay");
				String shop_intro = rs.getString("shop_intro");
				String shop_img = rs.getString("shop_img");

				ShopInfoDto dto = new ShopInfoDto(shop_num, shop_score, areax, areay, shop_intro, null,shop_img);
				dtos.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (stmt != null)
					stmt.close();
				if (con != null)
					con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return dtos;
	}

	public ShopInfoDto indexShopinfo(String shopnum) {

		ShopInfoDto dto = new ShopInfoDto();
		String query = "select A.shop_intro,A.shop_img, B.shop_name,B.shop_num from shop_manager B, shop_info A where A.shop_num = ? AND B.shop_num=?";

		try {
			con = DriverManager.getConnection(url, uid, pwd);
			pstmt = con.prepareStatement(query);

			pstmt.setString(1, shopnum);
			pstmt.setString(2, shopnum);
			rs = pstmt.executeQuery();

			if (rs.next()) {

				dto.setShopName(rs.getString("shop_name"));
				dto.setShopNum(rs.getString("shop_num"));
				dto.setShopIntro(rs.getString("shop_intro"));
				dto.setShopimg(rs.getString("shop_img"));

				return dto;

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;

	}

	// 가게 영업중인지 검색.
	public ArrayList<MapShopInfoDto> shopStatSelect(String s_stat) {

		String query = "select * from shop_info where shop_stat = ?";
		ArrayList<MapShopInfoDto> dtos = new ArrayList<MapShopInfoDto>();
		try {
			con = DriverManager.getConnection(url, uid, pwd);
			pstmt = con.prepareStatement(query);

			pstmt.setString(1, s_stat);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				String shop_num = rs.getString("shop_num");
				Double shop_score = rs.getDouble("shop_score");
				Double areax = rs.getDouble("shop_areax");
				Double areay = rs.getDouble("shop_areay");
				String shop_intro = rs.getString("shop_intro");
				String shop_stat = rs.getString("shop_stat");

				MapShopInfoDto dto = new MapShopInfoDto(shop_num, shop_score, areax, areay, shop_intro, shop_stat);
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

	public int imgUpdate(String shopnum) {
		String query = "UPDATE shop_info set shop_img = 'img/"+shopnum+".jpg' where shop_num = ?";

		try {
			con = DriverManager.getConnection(url, uid, pwd);
			pstmt = con.prepareStatement(query);

			pstmt.setString(1, shopnum);
			pstmt.executeUpdate();


		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;

	}
	
	public ArrayList<ShopInfoDto> shopvalSelect(String val) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query;
		
		if(val.equals("shop_score")) {
			query = "SELECT * FROM shop_info ORDER BY "+val+ " DESC";
		}else if(val.equals("review")){
			query = "SELECT * FROM shop_info, review WHERE shop_info.shop_num = review.shop_num  GROUP BY  review.shop_num ORDER BY COUNT(*) desc";
		}else {
			query = "SELECT * FROM shop_info where shop_stat=1";
		}
		
		ArrayList<ShopInfoDto> dtos = new ArrayList<ShopInfoDto>();
		try {
			con = DriverManager.getConnection(url, uid, pwd);
			pstmt = con.prepareStatement(query);
			//pstmt.setString(1, "val");
			
			rs = pstmt.executeQuery(query);

			while (rs.next()) {
				String shop_num = rs.getString("shop_num");
				Double shop_score = rs.getDouble("shop_score");
				Double areax = rs.getDouble("shop_areax");
				Double areay = rs.getDouble("shop_areay");
				String shop_intro = rs.getString("shop_intro");
				String shop_img = rs.getString("shop_img");

				ShopInfoDto dto = new ShopInfoDto(shop_num, shop_score, areax, areay, shop_intro, shop_img, null);
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