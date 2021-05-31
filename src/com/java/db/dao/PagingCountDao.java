package com.java.db.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.java.db.dto.PaginationDto;

public class PagingCountDao {

	
	static String driver = "org.mariadb.jdbc.Driver";
	static String url = "jdbc:mariadb://localhost:3306/Hungry";
	static String uid = "Hungry";
	static String pwd = "123456";

	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	
	public PagingCountDao() {
		try {
			Class.forName(driver);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public int pagingcount(String shop_num) {
		String query = "select count(*) as count from review where shop_num=?";
		PaginationDto dto = new PaginationDto();
		int listcount = 0;
		
		try {
			con = DriverManager.getConnection(url, uid, pwd);
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, shop_num);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				listcount = rs.getInt("count");	
			}
			
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		try {
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(con != null) con.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
		return listcount;
	
	}	
}
