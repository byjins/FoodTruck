package com.java.db.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;

import com.java.db.dto.MenuDto;

public class MenuDao {

	static String driver = "org.mariadb.jdbc.Driver";
	static String url = "jdbc:mariadb://localhost:3306/Hungry";
	static String uid = "Hungry";
	static String pwd = "123456";

	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	int m_num = 0, m_price = 0;
	String m_name = null, m_intro = null;
	
	public MenuDao() {
		try {
			Class.forName(driver);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<MenuDto> menuinfo(String shopnum) {
		
		String query = "select B.menu_num, B.menu_name, B.menu_price, B.menu_intro from shop_manager A, menu B where A.shop_num=? and B.shop_num=?";
		ArrayList<MenuDto> dtos = new ArrayList<MenuDto>();
		
		try {
			con = DriverManager.getConnection(url, uid, pwd);
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, shopnum);
			pstmt.setString(2, shopnum);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				m_num = rs.getInt("menu_num");
				m_name = rs.getString("menu_name");
				m_price = rs.getInt("menu_price");
				m_intro = rs.getString("menu_intro");
				
				MenuDto dto = new MenuDto(m_num, m_name, m_price, m_intro);
				
				dtos.add(dto);
				
			}
			for (int i = 0; i < dtos.size(); i++) {
				System.out.println(dtos.get(i).getMenuNum());
				System.out.println(dtos.get(i).getMenuName());
				System.out.println(dtos.get(i).getMenuPrice());
				System.out.println(dtos.get(i).getMenuIntro());
			}
				return dtos;
			
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
		
		return dtos;
		
		
	}
	
}
