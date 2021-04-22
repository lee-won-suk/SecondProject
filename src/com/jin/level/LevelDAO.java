package com.jin.level;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;

import com.jin.DTO.Leveldb;
import com.jin.DTO.Userdietdb;

public class LevelDAO {
	private Connection conn ;
	
	public LevelDAO() {
		String url="jdbc:oracle:thin:@localhost:1521:xe";
		String user="c##jin";
		String pass="jin1234";
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn= DriverManager.getConnection(url, user, pass);
		} catch (Exception e) {	e.printStackTrace();	}
	}

//레벨업에 필요한 경험치 정보 가져오기
	public Integer getLeveldb(int Lvl){
		String sql="SELECT Lvmaxexp " +
				   "FROM LevelDB " +
				   "WHERE Lvl = ? ";
		int maxexp = 0;
		try {
			PreparedStatement pstmt= conn.prepareStatement(sql);
			pstmt.setInt(1, Lvl);
			ResultSet rs=pstmt.executeQuery();
		
			while(rs.next())
			{
				maxexp=rs.getInt(1);
			}
			rs.close();
			pstmt.close();
		} catch (SQLException e) {e.printStackTrace();}
		return maxexp;
	}
	
	//경험치 및 레벨값 변경
	public void UpdateLevel(int exp, String id){
		String sql="Update MemberDB " +
				   "set "
				   + " Lvl = Lvl+1 "
				   + "exp = ? "
				   + "where id= ? ";
		try {
			PreparedStatement pstmt= conn.prepareStatement(sql);
			pstmt.setInt(1, exp);
			pstmt.setString(2, id);
			pstmt.executeUpdate();
			pstmt.close();
		} catch (SQLException e) {e.printStackTrace();}
	}
	
}
