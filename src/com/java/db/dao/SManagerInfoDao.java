package com.java.db.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

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
	
	
	//아이디찾기
	public String sfindID(String name, String phone) {

        String query = "select shop_id from shop_manager where admin_name = ? and shop_phone = ?";
       
        try {
        	con = DriverManager.getConnection(url,uid,pwd);
            pstmt = con.prepareStatement(query);
            
            pstmt.setString(1,name);
            pstmt.setString(2,phone);
            
            rs = pstmt.executeQuery();
            
            
            if(rs.next()) {
            	String id = rs.getString("shop_id");

				return id;
				
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
	
	
	public int accountCheck(String id, String name, String phone) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "select * from shop_manager where shop_id = ? and admin_name = ? and shop_phone=?";
		try {
			con = DriverManager.getConnection(url,uid,pwd);
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, id);
			pstmt.setString(2, name);
			pstmt.setString(3, phone);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return 1; //이용자가 있는경우
			}else {
				return 0; //이용자가 없을경우
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		return -1; //오류
	}
	
	//비밀번호 변경
		public int update(String id, String pw) {
			Connection con = null;
			PreparedStatement pstmt = null;
			
	        String query = "UPDATE shop_manager SET shop_pw = ? WHERE shop_id = ?";


	        try {
	        	con = DriverManager.getConnection(url,uid,pwd);
	            pstmt = con.prepareStatement(query);
	            
	            pstmt.setString(1,pw);
	            pstmt.setString(2,id);
	            
	            return pstmt.executeUpdate();
	 
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
			return -1;

		}

		// 지도 가게들 출력할때 사용 - 정현
		public ArrayList<SManagerInfoDto> infoAll(String s_num) {

			String query = "select * from shop_manager where shop_num = ?";
			ArrayList<SManagerInfoDto> dtos = new ArrayList<SManagerInfoDto>();
			try {
				con = DriverManager.getConnection(url, uid, pwd);
				pstmt = con.prepareStatement(query);

				pstmt.setString(1, s_num);
				rs = pstmt.executeQuery();
				while (rs.next()) {
					String num = rs.getString("shop_num");
					String val = rs.getString("shop_val");
					String id = rs.getString("shop_id");
					String pw = rs.getString("shop_pw");
					String sName = rs.getString("shop_name");
					String adress = rs.getString("shop_adress");
					String phone = rs.getString("shop_phone");
					String aName = rs.getString("admin_name");

					SManagerInfoDto dto = new SManagerInfoDto(num, val, id, pw, sName, adress, phone, aName);

					dtos.add(dto);
				}

			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {

					if (rs != null)
						rs.close();
					if (pstmt != null)
						rs.close();
					if (con != null)
						rs.close();

				} catch (Exception e2) {
					e2.printStackTrace();
				}
			}
			return dtos;

		}
}
