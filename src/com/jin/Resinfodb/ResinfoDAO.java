package com.jin.Resinfodb;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.jin.DTO.Memberdb;
import com.jin.DTO.Resinfodb;
import com.jin.DTO.Userdietdb;


public class ResinfoDAO {
	private Connection conn ;
	
	public ResinfoDAO() {
		String url="jdbc:oracle:thin:@localhost:1521:xe";
		String user="c##jin";
		String pass="jin1234";
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn= DriverManager.getConnection(url, user, pass);
		} catch (Exception e) {	e.printStackTrace();	}
	
	}
	

	//������ ���� �Ĵ��� ���ô�� 3���� �Ĵ翡 ���� ���� ��ȯ�ϱ�.
	public Resinfodb getUsrresInfo(String resname){
		String sql="SELECT resname, x, y, menuname, menukeyword, genre, partnerRes, address "
				+ "FROM ResInfoDB "
				+ "WHERE resname = ?  ";

		Resinfodb resinfodb=new Resinfodb();;
		try {
			PreparedStatement pstmt= conn.prepareStatement(sql);
			pstmt.setString(1, resname);
			ResultSet rs=pstmt.executeQuery();
			if(rs.next())
			{
			
				resinfodb.setResname(rs.getString(1));
				resinfodb.setX(rs.getFloat(2));
				resinfodb.setY(rs.getFloat(3));
				resinfodb.setMenuname(rs.getString(4));
				resinfodb.setMenukeyword(rs.getString(5));
				resinfodb.setGenre(rs.getString(6));
				resinfodb.setPartnerres(rs.getInt(7));
				resinfodb.setAddress(rs.getString(8));
			}
			rs.close();
			pstmt.close();
		} catch (SQLException e) {e.printStackTrace();}
		return resinfodb;
	}
	
	//�ʱ� �Ĵ� ������ ������� ���꿡 �´� Ű����鿡 ���� �Ĵ� ��ȯ
	public List<String> getFirstResInfo( String menukeyword ){

		String sql="SELECT resname "
				+ "FROM  resinfodb  "
				+ "WHERE menukeyword=? ";
				
			 int i;
			 List<String> lst=new ArrayList<String>();
			 
		try {
			PreparedStatement pstmt= conn.prepareStatement(sql);
			//���������� �� ����
		
			pstmt.setString(1, menukeyword);				
			ResultSet rs=pstmt.executeQuery();
	
			while(rs.next())
			{
				lst.add(rs.getString(1));
			}
			rs.close();
			pstmt.close();
		} catch (SQLException e) {e.printStackTrace();
		System.out.println("Problem in resinfoDAO");}
		return lst;
	}
	
	
	// �������� �ݿ���  Ű����鿡 ���� �Ĵ� ��ȯ
		public List<String> getStarIncluedResInfo(String menukeyword, String UsrId ){

			String sql="SELECT r.resname  "
					+ "FROM  resinfodb r,stardb s   "
					+ "WHERE r.resname=s.resname "
					+ "and s.menukeyword=? "
					+ "and s.starvalue  not BETWEEN 0.1 and 3.9 "
					+ "and id=? ";
					
				 List<String> lst=new ArrayList<String>();
				 
			try {
				PreparedStatement pstmt= conn.prepareStatement(sql);
			
				pstmt.setString(1, menukeyword);
				pstmt.setString(2, UsrId);
				ResultSet rs=pstmt.executeQuery();
		
				while(rs.next())
				{
					lst.add(rs.getString(1));
				}
				rs.close();
				pstmt.close();
			} catch (SQLException e) {e.printStackTrace();
			System.out.println("resinfoDAO���� �����߻�");}
			
			return lst;
		}
	
	
	
		public boolean ispartnerRes(String resname){
			String sql="select partnerRes "
					+ "from resinfodb  "
					+ "where resname= ? ";
			try {
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setString(1,resname);
				ResultSet rs=pstmt.executeQuery();
				if(rs.next())
				{
					if(rs.getInt(1)==1)
						return true;
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
				return false;
			}
		
	
	
	
	
	
	
	

	
}



















