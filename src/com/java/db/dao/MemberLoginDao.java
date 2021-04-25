package com.java.db.dao;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


public class MemberLoginDao {
	
	static String driver = "org.mariadb.jdbc.Driver";
	static String url = "jdbc:mariadb://localhost:3306/Hungry";
	static String uid = "Hungry";
	static String pwd = "123456";
	
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	

	
	
	public MemberLoginDao() {
		try {
			Class.forName(driver);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	 public int login(String member_id, String member_pw) {
		 	

	        String query = "select * from member_info where member_id = ?";


	        try {
	        	con = DriverManager.getConnection(url,uid,pwd);
	            pstmt = con.prepareStatement(query);
	            
	            pstmt.setString(1,member_id);
	            
	            rs = pstmt.executeQuery();
	            
	         

	            
	            if(rs.next()) {
	              
	            	System.out.println("디비  값 확인"+member_id+"/"+member_pw);
	            	
	            	
	            	if(rs.getString("member_pw").equals(member_pw)) {
	            		
	            		if(rs.getInt("member_num")==1) {
	            			return 1;  //사업자
	            		}else if(rs.getInt("member_num")==0) {
	            			return 2; //회원
	            		}
	            		
	            	}	
	            }
	               
	        }catch(Exception e) {

	            e.printStackTrace();    // 예외처리

	        }

	        return -1; //아이디,비번오류
	  
	    }
	

}
