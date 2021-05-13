package com.java.db.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.java.db.dto.SManagerInfoDto;

public class SManagerInfoDao {
	static String driver = "org.mariadb.jdbc.Driver";
	static String url = "jdbc:mariadb://localhost:3306/Hungry";
	static String uid = "Hungry";
	static String pwd = "123456";
	
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;


	
	
	public SManagerInfoDao() {
		try {
			Class.forName(driver);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	public SManagerInfoDto info(String shop_id) {

        String query = "select * from shop_manager where shop_id = ?";
       
        try {
        	con = DriverManager.getConnection(url,uid,pwd);
            pstmt = con.prepareStatement(query);
            
            pstmt.setString(1,shop_id);
            
            rs = pstmt.executeQuery();
            
         

            
            if(rs.next()) {
            	String num = rs.getString("shop_num");
            	String val = rs.getString("shop_val");
            	String id = rs.getString("shop_id");
				String pw = rs.getString("shop_pw");
				String sName = rs.getString("shop_name");
				String adress = rs.getString("shop_adress");
				String phone = rs.getString("shop_phone");
				String aName  = rs.getString("admin_name");
				
				
				
				SManagerInfoDto dto = new SManagerInfoDto(num,val,id,pw,sName,adress,phone,aName);
				
				return dto;
				
            }
               
        }catch(Exception e) {
        	
            e.printStackTrace();   

        }finally {
        	try {
        		if (con != null)
					con.close();
				if (pstmt != null)
					pstmt.close();
				if(rs!=null)
					rs.close();
        	}catch(Exception e2) {
        		e2.printStackTrace();
        	}
        }
		return null;



	}

}
