package com.jin.Userdiet;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.jin.DTO.Memberdb;
import com.jin.DTO.Userdietdb;


public class UserdietMenuDAO {
	private Connection conn ;
	
	public UserdietMenuDAO() {
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
	   
	   
	   
	   //오버로딩.
	   public List<Userdietdb> getDietmenuInfo(String UsrId,String time){   
			String sql="SELECT id, day, time, menukeyword, resname1, resname2, resname3, menukeywordKcal, menukeywordbudget  "
					+ "FROM UserDietDB "
					+ "WHERE id = ? "
					+ "and time='"+time+"' "
					+ "order by day asc ";		
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
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   
	
	   	   
	//유저의 오늘 요일의 메뉴키워드, 식당3개 추천, 메뉴키워드 칼로리,예산을 반환한다.
	public Userdietdb getTodayMenuInfo(String UsrId,String engTime,String DayofWeek){
		String sql="SELECT  menukeyword, resname1, resname2, resname3, menukeywordKcal, menukeywordbudget  "
				+ "FROM UserDietDB "
				+ "WHERE id = ? "
				+ "and day=? "
				+ "and time=? ";
		Userdietdb userdietdb=new Userdietdb();
		try {
			PreparedStatement pstmt= conn.prepareStatement(sql);
			pstmt.setString(1, UsrId);
			pstmt.setString(2, DayofWeek);
			pstmt.setString(3, engTime);
			ResultSet rs=pstmt.executeQuery();
		
			if(rs.next())
			{
				userdietdb.setMenukeyword(rs.getString(1));
				userdietdb.setResname1(rs.getString(2));
				userdietdb.setResname2(rs.getString(3));
				userdietdb.setResname3(rs.getString(4));
				userdietdb.setMenukeywordkcal(rs.getInt(5));
				userdietdb.setMenukeywordbudget(rs.getInt(6));		
			}
			rs.close();
			pstmt.close();
		} catch (SQLException e) {e.printStackTrace();}
		return userdietdb;
	}
	
	
	public void InsertUsrdiet(String UsrId,String day, String time,
			String menukeyword, String resname1,String resname2,String resname3,int menukeywordKcal,int menukeywordbudget ){
		
		String sql="INSERT INTO UserDietDB(id, day,  "
				+ "    time, menukeyword, resname1, resname2, resname3, menukeywordKcal, menukeywordbudget) "
				+ "VALUES(?,?,?,?,?,?,?,?,?) "; 
		try {
			PreparedStatement pstmt= conn.prepareStatement(sql);
			pstmt.setString(1, UsrId);
			pstmt.setString(2, day);
			pstmt.setString(3, time);
			pstmt.setString(4, menukeyword);
			pstmt.setString(5, resname1);
			pstmt.setString(6, resname2);
			pstmt.setString(7, resname3);
			pstmt.setInt(8, menukeywordKcal);
			pstmt.setInt(9, menukeywordbudget);
			
			pstmt.executeUpdate();
			pstmt.close();
		} catch (SQLException e) {e.printStackTrace();}
	}
	
	public void resetUsrdiet(String UsrId) {
		
	String sql="DELETE FROM UserDietDB "
			+ "WHERE id = ? ";
	
	try {
		PreparedStatement pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, UsrId);
		pstmt.executeUpdate();
		pstmt.close();
		
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}

	}
	
	
	public void deleteUsrdiet(String UsrId,String day,String time) {
		
		String sql="DELETE FROM UserDietDB "
				+ "WHERE id = ? "
				+ "and day=?"
				+ "and time=? ";
		
		try {
			PreparedStatement pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, UsrId);
			pstmt.setString(2, day);
			pstmt.setString(3, time);			
			pstmt.executeUpdate();
			pstmt.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		}
	
	
	
	

	
	
}



















