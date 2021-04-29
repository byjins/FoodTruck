package com.java.db.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.java.db.dto.MemberDto;



public class MemberInfoDao {
	static String driver = "org.mariadb.jdbc.Driver";
	static String url = "jdbc:mariadb://localhost:3306/Hungry";
	static String uid = "Hungry";
	static String pwd = "123456";
	
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;


	
	
	public MemberInfoDao() {
		try {
			Class.forName(driver);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public MemberDto info(String member_id) {

        String query = "select * from member_info where member_id = ?";


        try {
        	con = DriverManager.getConnection(url,uid,pwd);
            pstmt = con.prepareStatement(query);
            
            pstmt.setString(1,member_id);
            
            rs = pstmt.executeQuery();
            
         

            
            if(rs.next()) {
            	String id = rs.getString("member_id");
				String pw = rs.getString("member_pw");
				String name = rs.getString("member_name");
				String phone = rs.getString("member_phone");
				int age = rs.getInt("member_age");
				int num = rs.getInt("member_num");
				
				
				MemberDto dto = new MemberDto(id,pw,name,age,phone,num);
				return dto;
            }
               
        }catch(Exception e) {

            e.printStackTrace();   

        }
		return null;



	}

}
