package com.jin.Membership;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.jin.DTO.JoinMember;

public class JoinMemberDAO {
	
	public Connection getConn(){
		String url="jdbc:oracle:thin:@localhost:1521:xe";
		String user="c##jin";
		String pass="jin1234";
		Connection conn = null;
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn= DriverManager.getConnection(url, user, pass);
		} catch (Exception e) {	e.printStackTrace(); }
		return conn;
	}
	public void Insert(Connection conn,
			String id, String pw, Integer tel, String days, String time, Integer age, String gender, Integer budget, int kcallimit, String genre) {
		String sql="INSERT INTO MemberDB(id, pw, Tel, Userday, UserTime, kcalLimit, budget, genre, Lvl, point, exp, age, gender) "
				+ "VALUES (?,?,?,?,?,?,?,?,"+1+","+0+","+0+",?,?)";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			pstmt.setInt(3, tel);
			pstmt.setString(4, days);
			pstmt.setString(5, time);
			pstmt.setInt(6, kcallimit);
			pstmt.setInt(7, budget);
			pstmt.setString(8, genre);
			pstmt.setInt(9, age);
			pstmt.setString(10, gender);	
			
			pstmt.executeUpdate();
			pstmt.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
