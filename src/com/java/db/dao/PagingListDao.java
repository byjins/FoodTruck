package com.java.db.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.java.db.dto.PaginationDto;
import com.java.db.dto.ReviewDto;

public class PagingListDao {
	
	static String driver = "org.mariadb.jdbc.Driver";
	static String url = "jdbc:mariadb://localhost:3306/Hungry";
	static String uid = "Hungry";
	static String pwd = "123456";

	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	
	public PagingListDao() {
		try {
			Class.forName(driver);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<ReviewDto> paginglist(String shopnum, int start, int end) {
		String query = "select member_id, review_comment, review_score, review_date from review where shop_num=? order by review_num LIMIT ?,?" ;
		ArrayList<ReviewDto> dtos = new ArrayList<ReviewDto>();
		String review_id = null;
		String review_comment = null;
		Double review_score = null;
		String review_date = null;
		
		try {
			con = DriverManager.getConnection(url, uid, pwd);
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, shopnum);
			pstmt.setInt(2, start);
			pstmt.setInt(3, end);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				review_id = rs.getString("member_id");
				review_comment = rs.getString("review_comment");
				review_score = rs.getDouble("review_score");
				review_date = rs.getString("review_date");
				
				ReviewDto dto = new ReviewDto(review_id, review_date, review_comment, review_score);
				dtos.add(dto);
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return dtos;
	}

}


