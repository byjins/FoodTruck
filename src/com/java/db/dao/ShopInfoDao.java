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

				System.out.println("getShopNum가게 번호:"+dto.getShopNum());
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
	
	public ArrayList<ShopInfoDto> shopReviewSelect(double userX, double userY) {
		ArrayList<ShopInfoDto> dtos = new ArrayList<ShopInfoDto>();
		
		String query = "SELECT \r\n"
		  		+ "	ifnull(a.shop_num,'0000000-000-0000-00000') AS non \r\n"
		  		+ "	,b.shop_num\r\n"
		  		+ "	,b.shop_score\r\n"
		  		+ "	,b.shop_areax\r\n"
		  		+ "	,b.shop_areay\r\n"
		  		+ "	,b.shop_intro\r\n"
		  		+ "	,b.shop_img\r\n"
		  		+ "	,b.shop_stat\r\n"
		  		+ "	,c.shop_name\r\n"
		  		+ "FROM review a   RIGHT OUTER JOIN (\r\n"
		  		+ "	SELECT *,\r\n"
		  		+ "		(6371*acos(cos(radians(?))*cos(radians(shop_areax))\r\n"
		  		+ "		*cos(radians(shop_areay)-radians(?))\r\n"
		  		+ "		+sin(radians(?))*sin(radians(shop_areax))))\r\n"
		  		+ "		AS distance\r\n"
		  		+ "	FROM shop_info\r\n"
		  		+ "	HAVING DISTANCE <= 3\r\n"
		  		+ "	ORDER BY distance   \r\n"
		  		+ "	LIMIT 0,3\r\n"
		  		+ ")  b\r\n"
		  		+ "ON a.shop_num =  b.shop_num JOIN shop_manager c\r\n"
		  		+ "ON c.shop_num = b.shop_num\r\n"
		  		+ "GROUP BY a.shop_num\r\n"
		  		+ "ORDER BY count(a.shop_num) DESC";
		
		Connection con = null;
		ResultSet rs = null;
		try {
			con = DriverManager.getConnection(url, uid, pwd);
			pstmt = con.prepareStatement(query);
			pstmt.setDouble(1, userX);
			pstmt.setDouble(2, userY);
			pstmt.setDouble(3, userX);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				String shop_num = rs.getString("shop_num");
				Double shop_score = rs.getDouble("shop_score");
				Double areax = rs.getDouble("shop_areax");
				Double areay = rs.getDouble("shop_areay");
				String shop_intro = rs.getString("shop_intro");
				String shop_img = rs.getString("shop_img");
				String shop_name = rs.getString("shop_name");

				ShopInfoDto dto = new ShopInfoDto(shop_num, shop_score, areax, areay, shop_intro, shop_img, shop_name);
				dtos.add(dto);
			}
			while(dtos.size()<6) {
				ShopInfoDto dto = new ShopInfoDto(null,0.0,0.0,0.0,"가게정보없음",null,"가게이름");
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
	
	public ArrayList<ShopInfoDto> shopScoreSelect(double userX, double userY) {
		ArrayList<ShopInfoDto> dtos = new ArrayList<ShopInfoDto>();
		
		String query = "SELECT b.*, shop_manager.shop_name FROM (\r\n"
				+ "	SELECT *,\r\n"
				+ "		(6371*acos(cos(radians(?))*cos(radians(shop_areax))\r\n"
				+ "		*cos(radians(shop_areay)-radians(?))\r\n"
				+ "		+sin(radians(?))*sin(radians(shop_areax))))\r\n"
				+ "		AS distance\r\n"
				+ "	FROM shop_info\r\n"
				+ "	HAVING DISTANCE <= 3\r\n"
				+ "	ORDER BY distance   \r\n"
				+ "	LIMIT 0,3\r\n"
				+ ") AS b, shop_manager\r\n"
				+ "WHERE b.shop_num = shop_manager.shop_num\r\n"
				+ "ORDER BY shop_score DESC";
		
		Connection con = null;
		ResultSet rs = null;
		try {
			con = DriverManager.getConnection(url, uid, pwd);
			pstmt = con.prepareStatement(query);
			pstmt.setDouble(1, userX);
			pstmt.setDouble(2, userY);
			pstmt.setDouble(3, userX);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				String shop_num = rs.getString("shop_num");
				Double shop_score = rs.getDouble("shop_score");
				Double areax = rs.getDouble("shop_areax");
				Double areay = rs.getDouble("shop_areay");
				String shop_intro = rs.getString("shop_intro");
				String shop_img = rs.getString("shop_img");
				String shop_name = rs.getString("shop_name");

				ShopInfoDto dto = new ShopInfoDto(shop_num, shop_score, areax, areay, shop_intro, shop_img, shop_name);
				dtos.add(dto);
			}
			while(dtos.size()<6) {
				ShopInfoDto dto = new ShopInfoDto(null,0.0,0.0,0.0,"가게정보없음",null,"가게이름");
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
	
	
	public void shop_update(String shopnum, String intro) {
		String query = "update shop_info set shop_intro=? where shop_num=?";
		
		try {
			con = DriverManager.getConnection(url, uid, pwd);
			pstmt = con.prepareStatement(query);

			pstmt.setString(1, intro);
			pstmt.setString(2, shopnum);
			int result = pstmt.executeUpdate();
			
			if(1 == result) {
				System.out.println("가게정보 수정 완료");
			} else {
				System.out.println("가게정보 수정 실패");
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

	}
	
	public ArrayList<ShopInfoDto> shop_score(String shopnum) {
		
		ArrayList<ShopInfoDto> dtos = new ArrayList<ShopInfoDto>();
		String query = "select round(avg(review_score),1) as avg_score from review where shop_num=?";
		
		Double score = null;
		
		try {
			con = DriverManager.getConnection(url, uid, pwd);
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, shopnum);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				score = rs.getDouble("avg_score");
				
				ShopInfoDto dto = new ShopInfoDto(score);
				dtos.add(dto);
			}
			
			for(int i = 0; i<dtos.size(); i++) {
				System.out.println(dtos.get(i).getShopScore());
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

			return dtos;

		}

	}
	
	public void score_update(Double score, String shopnum) {
		String query = "update shop_info set shop_score=? where shop_num=?";
		
		try {
			con = DriverManager.getConnection(url, uid, pwd);
			pstmt = con.prepareStatement(query);
			pstmt.setDouble(1, score);
			pstmt.setString(2, shopnum);
			int result = pstmt.executeUpdate();
			
			if(1 == result) {
				System.out.println("평점 수정 성공");
			} else {
				System.out.println("평점 수정 실패");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (con != null)
					con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}
	
}