package com.jin.Login;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.jin.DTO.Login;

public class LoginDAO {
	
	public Connection getConn() {
		String url="jdbc:oracle:thin:@localhost:1521:xe";
		String user="c##jin";
		String pass="jin1234";
		Connection conn = null;
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(url, user, pass);
			//System.out.println("connection success");
		} catch (Exception e) {	
			System.out.println("Connection failed");
			e.printStackTrace();	
			}
		
		return conn;
	
	}
	
	public int LoginProc(Connection conn, Login login) {
		String sql= "select count(*) as cnt from memberDB "
				+ "where id=? "
				+ "and pw=? ";
		
		try {
			PreparedStatement pstmt =  conn.prepareStatement(sql);
			
			String id = login.getId();
			String pw = login.getPw();

			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			
			ResultSet rs = pstmt.executeQuery();

			boolean rsNext = rs.next();

			int rsInt = rs.getInt(1);// 리턴받을 순서번호 입력
			
			if(rsNext)
				return rsInt;
			
			pstmt.close();
			
		} catch (SQLException e) {
			System.out.println("LoginDAO : login Failed");
			e.printStackTrace();
		}
		
		return 0;
	}
}
	
