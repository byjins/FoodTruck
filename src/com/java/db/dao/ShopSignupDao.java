package com.java.db.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.java.db.dto.ShopInfoDto;

public class ShopSignupDao {
	public Connection con;
	
	public ShopSignupDao() {
			try {
				String driver = "org.mariadb.jdbc.Driver";
				String url = "jdbc:mariadb://localhost:3306/Hungry";
				String uid = "Hungry";
				String pwd = "123456";
				Class.forName(driver);
				con = DriverManager.getConnection(url,uid,pwd);
			} catch (Exception e) {
				e.printStackTrace();
			}
	}
	
	
	public int shopmanagerInsert(String num, String val, String shopid, String shoppw, String shopname, String shopadress, String shopphone, String managename) {
		PreparedStatement pstmt = null;
		// ResultSet rs =null;

		String query = "insert into shop_manager values(?,?,?,?,?,?,?,?)";

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, num);
			pstmt.setString(2, val);
			pstmt.setString(3, shopid);
			pstmt.setString(4, shoppw);
			pstmt.setString(5, shopname);
			pstmt.setString(6, null);
			pstmt.setString(7, shopphone);
			pstmt.setString(8, managename);

			return pstmt.executeUpdate();
		} catch (Exception e) {
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
		return -1;

	}

	
	public int shoppinfoInsert(String snum) {
		PreparedStatement pstmt = null;
		// ResultSet rs =null;

		String query = "insert into shop_info values(?,?,?,?,?,?,?)";

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, snum);
			pstmt.setDouble(2, 0);
			pstmt.setDouble(3, 0);
			pstmt.setDouble(4, 0);
			pstmt.setString(5, "가게소개없음");
			pstmt.setString(6, null);
			pstmt.setInt(7, 2);

			return pstmt.executeUpdate();
		} catch (Exception e) {
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
		return -1;

	}
	
	public int shopIdCheck(String id) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "select * from shop_manager where shop_id = ?";
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next() || id.equals("")) {
				return 0; //이용자가 있는경우
			}else {
				return 1; //이용자가 없을경우
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
	
	public int shopPhoneCheck(String phonenum) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "select * from shop_manager where shop_phone = ?";
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, phonenum);
			rs = pstmt.executeQuery();
			if(rs.next() || phonenum.equals("")) {
				return 0; //있는 번호일경우
			}else {
				return 1; //없는 번호일경우
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
	
	public int shopNumCheck(String shopnum) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "select * from shop_manager where shop_num = ?";
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, shopnum);
			rs = pstmt.executeQuery();
			if(rs.next() || shopnum.equals("")) {
				return 0; //사용중인 번호일경우
			}else {
				return 1; //사용없은 번호일경우
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
	
	public int shopinfoNumCheck(String shopnum) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "select * from shop_infonum where shop_num = ?";
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, shopnum);
			rs = pstmt.executeQuery();
			if(rs.next() || shopnum.equals("")) {
				return 1; //있는 번호일경우(데이터에 있는 번호일경우)
			}else {
				return 0; //없는 번호일경우
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
	
	public String shopinfoName(String shopnum) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "SELECT shop_name FROM shop_infonum WHERE shop_num = ?";
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, shopnum);
			rs = pstmt.executeQuery();
			if(rs.next() || shopnum.equals("")) {
				return rs.getString("shop_name"); //있는 번호일경우(데이터에 있는 번호일경우)
			}else {
				return null; //없는 번호일경우
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
		return null; //오류
	}
}
