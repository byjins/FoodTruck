package com.java.db.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class ShopLoginDao {

	static String driver = "org.mariadb.jdbc.Driver";
	static String url = "jdbc:mariadb://localhost:3306/Hungry";
	static String uid = "Hungry";
	static String pwd = "123456";
	
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	

	
	
	public ShopLoginDao() {
		try {
			Class.forName(driver);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	 public int login(String shop_id, String shop_pw) {
		 	

	        String query = "select * from shop_manager where shop_id = ? and shop_pw = ?";


	        try {
	        	con = DriverManager.getConnection(url,uid,pwd);
	            pstmt = con.prepareStatement(query);
	            
	            pstmt.setString(1,shop_id);
	            pstmt.setString(2,shop_pw);
	            	            
	            rs = pstmt.executeQuery();
	            
	         
	        	if(rs.next()) {
	        		return 1; //로그인성공
				}
	       
	               
	        }catch(Exception e) {

	            e.printStackTrace();   

	        }finally {
	        	try {
	        		if(rs!=null)rs.close();
					if(pstmt!=null)pstmt.close();
					if(con!=null)con.close();
	        	}catch(Exception e2){
	        		e2.printStackTrace();
	        	}
	        }

	        return -1; //로그인 실패
	  
	    }

}
