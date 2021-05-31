package com.java.db.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.java.db.dto.MenuDto;
import com.java.db.dto.ReviewDto;

public class ReviewDao {

	static String driver = "org.mariadb.jdbc.Driver";
	static String url = "jdbc:mariadb://localhost:3306/Hungry";
	static String uid = "Hungry";
	static String pwd = "123456";

	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	public ReviewDao() {
		try {
			Class.forName(driver);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void insert_review(String memberid, String shopnum,String reviewcomment, Double reviewscore) {
		String query = "insert into review(member_id, shop_num, review_comment, review_score) values(?,?,?,?)";
		try {
			con = DriverManager.getConnection(url, uid, pwd);
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, memberid);
			pstmt.setString(2, shopnum);
			pstmt.setString(3, reviewcomment);
			pstmt.setDouble(4, reviewscore);
			
			int result = pstmt.executeUpdate();
			
			if(1 != result) {
				System.out.println("실패");
			} else {
				System.out.println("성공");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}
	
	
	public ArrayList<ReviewDto> select_review(String shopnum) {
		
		String query = "select B.review_num, B.member_id, B.review_date, B.review_comment, B.review_score from shop_manager A, review B where A.shop_num=? and B.shop_num=?";
		ArrayList<ReviewDto> dtos = new ArrayList<ReviewDto>();
		
		int review_num = 0;
		String review_id = null;
		String review_date = null;
		String review_comment = null;
		Double review_score = null;
		
		try {
			con = DriverManager.getConnection(url, uid, pwd);
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, shopnum);
			pstmt.setString(2, shopnum);
			rs = pstmt.executeQuery();
		
			while(rs.next()) {
				review_id = rs.getString("member_id");
				review_num = rs.getInt("review_num");
				review_date = rs.getString("review_date");
				review_comment = rs.getString("review_comment");
				review_score = rs.getDouble("review_score");
				
				ReviewDto dto = new ReviewDto(review_num, review_date, review_comment, review_score);
				
				dtos.add(dto);
				
				}
				for(int i = 0; i<dtos.size(); i++) {
					System.out.println(dtos.get(i).getMemberId());
					System.out.println(dtos.get(i).getReviewNum());
					System.out.println(dtos.get(i).getReviewDate());
					System.out.println(dtos.get(i).getReviewComment());
					System.out.println(dtos.get(i).getreviewScore());
			}
				return dtos;
				
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null)rs.close();
				if(pstmt != null)pstmt.close();
				if(con != null)con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
				}
		}
		
		return dtos;
		
	}
}
