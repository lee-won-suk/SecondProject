package com.jin.OneWeekCheck;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.jin.DTO.Memberdb;


public class OneWeekCheckDAO {
	private Connection conn ;
	
	public OneWeekCheckDAO() {
		String url="jdbc:oracle:thin:@localhost:1521:xe";
		String user="c##jin";
		String pass="jin1234";
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn= DriverManager.getConnection(url, user, pass);
		} catch (Exception e) {	e.printStackTrace();	}
	
	}
	

	public List<Integer> getOneWeekCheckInfo(String UsrId, int daySize){
		String sql="select percent "
				+ "from oneweekcheckdb "
				+ "where id=? "
				+ "order by day asc ";
		List<Integer> UsrWeekArr=new ArrayList<Integer>();
		
		int i=1;
		try {
			PreparedStatement pstmt= conn.prepareStatement(sql);
			pstmt.setString(1, UsrId);
			ResultSet rs=pstmt.executeQuery();
			while(rs.next())
			{
				UsrWeekArr.add(rs.getInt(i));
			}
			
			
			
			rs.close();
			pstmt.close();
		} catch (SQLException e) {e.printStackTrace();
		System.out.println("OneWeekCheckDaoï¿½ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½ï¿½ß»ï¿½.");}
		return UsrWeekArr;
	}
	
	//ÃÊ±â½Ä´Ü ´Þ¼ºµµ µ¥ÀÌÅÍ ¸¸µé±â.
	public void InsertFirstWeekCheck(String UsrId, String [] Userday){
		String deletesql="delete from OneWeekCheckDB "
				+ "where id=? ";
		
		String sql="INSERT INTO OneWeekCheckDB (id,day, percent) "
				+ "VALUES(?,?,0)  ";
	
		try {
			PreparedStatement pstmt= conn.prepareStatement(deletesql);
		
			pstmt.setString(1, UsrId);	
			pstmt.executeUpdate();		
			pstmt.close();
			
					
			pstmt= conn.prepareStatement(sql);
			for (String item : Userday )
			{
			pstmt.setString(1, UsrId);
			pstmt.setString(2, item);	
			pstmt.executeUpdate();
			}
			pstmt.close();
		} catch (SQLException e) {e.printStackTrace();
		System.out.println("OneWeekCheckDaoï¿½ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½ï¿½ß»ï¿½.");}
		
	}
	
	
	
	
	public void resetUsrWeekcheck(String UsrId){
		String sql="UPDATE OneWeekCheckDB "
				+ "SET "
				+ "percent = 0 "
				+ "WHERE id =? ";
		try {
			PreparedStatement pstmt= conn.prepareStatement(sql);
			pstmt.setString(1, UsrId);
			pstmt.executeUpdate();
			
			pstmt.close();
		} catch (SQLException e) {e.printStackTrace();
		System.out.println("OneWeekCheckDao¿¡¼­ ¹®Á¦¹ß»ý.");}	
	}
	public void increaseTodayPer(String UsrId,String DayofWeek){
		String sql="UPDATE OneWeekCheckDB "
				+ "SET "
				+ "percent = percent+1 "
				+ "WHERE id =? "
				+" and day=? ";
		try {
			PreparedStatement pstmt= conn.prepareStatement(sql);
			pstmt.setString(1, UsrId);
			pstmt.setString(2, DayofWeek);
			pstmt.executeUpdate();
			pstmt.close();
		} catch (SQLException e) {e.printStackTrace();
		System.out.println("OneWeekCheckDao¿¡¼­ ¹®Á¦¹ß»ý.");}	
	}
	
	/*
	 * public void increaseTodayPer(String UsrId,String DayofWeek){ String
	 * sql="UPDATE OneWeekCheckDB " + "SET " + "percent = percent+1 " +
	 * "WHERE id =? " +" and day=? "; try { PreparedStatement pstmt=
	 * conn.prepareStatement(sql); pstmt.setString(1, UsrId); pstmt.setString(2,
	 * DayofWeek); pstmt.executeUpdate(); pstmt.close(); } catch (SQLException e)
	 * {e.printStackTrace(); System.out.println("OneWeekCheckDao¿¡¼­ ¹®Á¦¹ß»ý.");} }
	 */
	
	
	
	
}



















