package com.jin.LikeCheck;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.jin.DTO.Memberdb;
import com.jin.DTO.Userdietdb;


public class UserLikeCheckDAO {
	private Connection conn ;
	
	public UserLikeCheckDAO() {
		String url="jdbc:oracle:thin:@localhost:1521:xe";
		String user="c##jin";
		String pass="jin1234";
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn= DriverManager.getConnection(url, user, pass);
		} catch (Exception e) {	e.printStackTrace();	}
	
	}
	

	   
	   public List<Userdietdb> getDietmenuInfo(String UsrId){
	   
		String sql="SELECT id, day, time, menukeyword, resname1, resname2, resname3, menukeywordKcal, menukeywordbudget  "
				+ "FROM UserDietDB "
				+ "WHERE id = ?";
		
		List<Userdietdb> lst=new ArrayList<Userdietdb>();
		try {
			PreparedStatement pstmt= conn.prepareStatement(sql);
			pstmt.setString(1, UsrId);
			ResultSet rs=pstmt.executeQuery();
		
			while(rs.next())
			{
				Userdietdb userdietdb=new Userdietdb();
				userdietdb.setId(rs.getString(1));
				userdietdb.setDay(rs.getString(2));
				userdietdb.setTime(rs.getString(3));
				userdietdb.setMenukeyword(rs.getString(4));
				userdietdb.setResname1(rs.getString(5));
				userdietdb.setResname2(rs.getString(6));
				userdietdb.setResname3(rs.getString(7));
				userdietdb.setMenukeywordkcal(rs.getInt(8));
				userdietdb.setMenukeywordbudget(rs.getInt(9));		
				lst.add(userdietdb);
			}
			rs.close();
			pstmt.close();
		} catch (SQLException e) {e.printStackTrace();}
		return lst;
	}   
	   
	//아이디의 싫어요 메뉴키워드 목록 가져오기.
	public List<String> getKeywordLike(String UsrId ){
		String sql="SELECT menukeyword "
				+ "FROM LikeCheckDB "
				+ "WHERE islike=0"
				+ "and id=? ";

		List<String> lst=new ArrayList<String>();
		try {
			PreparedStatement pstmt= conn.prepareStatement(sql);
			pstmt.setString(1, UsrId);
			
			ResultSet rs=pstmt.executeQuery();
		
			while(rs.next())
			{
			lst.add(rs.getString(1));
			}
			rs.close();
			pstmt.close();
		} catch (SQLException e) {e.printStackTrace();}
		return lst;
	}
	
	//메뉴키워드에 대한 좋아요 갱신
		public void insertIsLike(int value,String usrId,String menukeyword){
			String sql="delete  "
					+ "FROM LikeCheckDB "
					+ "WHERE menukeyword=? "
					+ "and id=? ";
			
			String insertsql="INSERT INTO LikeCheckDB "
					+ "(id,menukeyword,islike) "
					+ "VALUES (?,?,?)";
			try {
				PreparedStatement pstmt= conn.prepareStatement(sql);
				pstmt.setString(1, menukeyword);
				pstmt.setString(2, usrId);
				pstmt.executeUpdate();
				pstmt.close();
				
				pstmt=conn.prepareStatement(insertsql);

				pstmt.setString(1, usrId);
				pstmt.setString(2, menukeyword);
				pstmt.setInt(3,value);
				pstmt.executeUpdate();
				pstmt.close();

			} catch (SQLException e) {e.printStackTrace();}
		}
	
	
	
	
}



















