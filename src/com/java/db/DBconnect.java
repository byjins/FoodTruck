package com.java.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DBconnect {
	static String driver = "org.mariadb.jdbc.Driver";
	static String url = "jdbc:mariadb://localhost:3306/Hungry";
	static String uid = "Hungry";
	static String pwd = "123456";

	public static void main(String[] args) {
		Connection con = null; //연결
		Statement stmt = null; //쿼리, 질의
		ResultSet rs = null;   //결과집합
		
		/*
		 * String sql = "SELECT / FROM MEMBER"; // SQL문
		 * 
		 * stmt = con.createStatement(); 
		 * SQL문 실행. SELECT문일 경우 executeQuery() 호출해서 
		 * ResultSet 타입의 테이블 형식으로 결과를 가져옴
		 * 
		 * stmt.executeQuery(sql);      // executeUpdate =  Insert, update, delete 등 사용할떄(DB값이 문자열일 경우 ' ' 사용)
		 * rs = stmt.executeQuery(sql); // executeQuery = select 사용할 때
		 * 
		 * select로 가져온 값 보여주는 법
		 * while(rs.next()){
		 * System.out.print(rs.getInt(1));
		 * System.out.print(rs.getStrung(2));
		 * }
		 * con.close();
		 * stmt.close();
		 * rs.close();
		 * 
		 */
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, uid, pwd);
			System.out.println("접속성공");
		} catch (ClassNotFoundException e1) {
			System.out.println("드라이버 로드 실패");
		} catch (SQLException e2) {
			System.out.println(e2);
		} finally {

		}
	}
}
