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
	

	//������ Į�θ��� ���곻�� ������ �޴�Ű���� �̾Ƴ���.
	public List<String> getUsrMenuKeywordInfo(String [] Usergenre,int UsrKcal,int UsrBudget){
		
		int genreSize=Usergenre.length;
		
		String sql="SELECT menukeyword "
				+ "FROM  MenuKeywordDB  "
				+ "WHERE (";
				for( int i=0;i<genreSize;i++)//��ȣ�帣 �Է��� ���������� �Ϸ���.
				{
					sql+= " genre= ? ";
					if(i==genreSize-1) break;//���������� or�Ⱥ��δ�.
					sql+= " or ";
				}
			 sql+= ") "
				+ "and menukeywordKcal<=?  "
				+ "and menukeywordbudget<=?";
			 int i;
		List<String> lst=new ArrayList<String>();
		try {
			PreparedStatement pstmt= conn.prepareStatement(sql);
			//���������� �� ����
			for(i=1;i<=genreSize;i++)
			{
				pstmt.setString(i, Usergenre[i-1]);//���ʴ�� 	�޾ƿ� ��ȣ�帣 �Է�.
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
		
		
	
	
//�޴� Ű������ Į�θ��� ���� ��������.	
public List<Integer> getMenuKeywordKcalBud(String menukeyword){

		
		String sql="SELECT menukeywordKcal , menukeywordbudget "
				+ "FROM  MenuKeywordDB  "
				+ "WHERE menukeyword=?";
			 int i;
		List<Integer> lst=new ArrayList<Integer>();
		try {
			PreparedStatement pstmt= conn.prepareStatement(sql);
			//���������� �� ����
	
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



















