package com.java.db.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import com.java.db.dto.MemberSignupDto;

public class MemberSignupDao {
	static String driver = "org.mariadb.jdbc.Driver";
	static String url = "jdbc:mariadb://localhost:3306/Hungry";
	static String uid = "Hungry";
	static String pwd = "123456";
	
	public MemberSignupDao() {
		try {
			Class.forName(driver);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void mInsert(MemberSignupDto insertDTO) {
		String id = insertDTO.getMemberID();
		String pw = insertDTO.getMemberPW();
		String name = insertDTO.getMemberName();
		String age = insertDTO.getAge();
		String Phone = insertDTO.getPhone();
		
		int num = 0;
		int mage = Integer.parseInt(age);
		
		String query = "insert into member_info values(?,?,?,?,?,?)";
	
		Connection con = null;
		PreparedStatement pstmt =null;
		try {
			con = DriverManager.getConnection(url,uid,pwd);
			
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			pstmt.setString(3, name);
			pstmt.setInt(4, mage);
			pstmt.setString(5, Phone);
			pstmt.setInt(6, num);
			
			int resultQuery = pstmt.executeUpdate();
			if (1!=resultQuery)System.out.println("회원등록실패");
			else System.out.println("회원등록성공!");
		}catch (Exception e) {
			e.printStackTrace();
			
		} finally {
			try {
				if (con != null)
					con.close();
				if (pstmt != null)
					pstmt.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}
}
