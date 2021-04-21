package com.jin.MenuKeyword;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.jin.DTO.Memberdb;
import com.jin.DTO.Userdietdb;


public class MenuKeywordDAO {
	private Connection conn ;
	
	public MenuKeywordDAO() {
		String url="jdbc:oracle:thin:@localhost:1521:xe";
		String user="c##jin";
		String pass="jin1234";
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn= DriverManager.getConnection(url, user, pass);
		} catch (Exception e) {	e.printStackTrace();	}
	
	}
	

	//유저의 칼로리와 예산내에 들어오는 메뉴키워드 뽑아내기.
	public List<String> getUsrMenuKeywordInfo(String [] Usergenre,int UsrKcal,int UsrBudget){
		
		int genreSize=Usergenre.length;
		
		String sql="SELECT menukeyword "
				+ "FROM  MenuKeywordDB  "
				+ "WHERE (";
				for( int i=0;i<genreSize;i++)//선호장르 입력을 가변적으로 하려고.
				{
					sql+= " genre= ? ";
					if(i==genreSize-1) break;//마지막에는 or안붙인다.
					sql+= " or ";
				}
			 sql+= ") "
				+ "and menukeywordKcal<=?  "
				+ "and menukeywordbudget<=?";
			 int i;
		List<String> lst=new ArrayList<String>();
		try {
			PreparedStatement pstmt= conn.prepareStatement(sql);
			//가변적으로 값 저장
			for(i=1;i<=genreSize;i++)
			{
				pstmt.setString(i, Usergenre[i-1]);//차례대로 	받아온 선호장르 입력.
			}
			pstmt.setInt(i, UsrKcal);
			pstmt.setInt(i+1, UsrBudget);
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
		
		
	
	
//메뉴 키워드의 칼로리와 예산 가져오기.	
public List<Integer> getMenuKeywordKcalBud(String menukeyword){

		
		String sql="SELECT menukeywordKcal , menukeywordbudget "
				+ "FROM  MenuKeywordDB  "
				+ "WHERE menukeyword=?";
			 int i;
		List<Integer> lst=new ArrayList<Integer>();
		try {
			PreparedStatement pstmt= conn.prepareStatement(sql);
			//가변적으로 값 저장
	
			pstmt.setString(1, menukeyword);
			ResultSet rs=pstmt.executeQuery();
		
			if(rs.next())
			{
			 lst.add(rs.getInt(1));
			 lst.add(rs.getInt(2));
			}		
			rs.close();
			pstmt.close();
		} catch (SQLException e) {e.printStackTrace();}
		return lst;
	}
	
	
	
	

	
}



















