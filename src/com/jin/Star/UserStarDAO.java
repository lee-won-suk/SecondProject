package com.jin.Star;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.jin.DTO.Memberdb;
import com.jin.DTO.Stardb;
import com.jin.DTO.Userdietdb;


public class UserStarDAO {
	private Connection conn ;
	
	public UserStarDAO() {
		String url="jdbc:oracle:thin:@localhost:1521:xe";
		String user="c##jin";
		String pass="jin1234";
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn= DriverManager.getConnection(url, user, pass);
		} catch (Exception e) {	e.printStackTrace();	}
	
	}
	

	//사용자와 연령대, 성별대가 맞는 사람들 반환
	public List<String> getSameUsrInfo(String Usrgender,String Usrage,String UsrId){
		String sql="SELECT id "
				+ "from memberdb "
				+ "where gender=? "
				+ "and age= ? "
				+ "and id!= '"+UsrId+"'";
		List<String>lst=new ArrayList<String>();
		try {
			PreparedStatement pstmt= conn.prepareStatement(sql);
			pstmt.setString(1, Usrgender);
			pstmt.setString(2, Usrage);
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
	
	
	//사용자와 연령대, 성별대+선호장르 맞는 사람들 반환
		public List<String> getSameUsrInfo(String Usrgender,String Usrage,String UsrId, String [] genre){
			int genreSize=genre.length;
			
			String sql="SELECT id  "
					+ "from memberdb  "
					+ "where gender= ? "
					+ "and ( ";
					for(int i=0; i<genreSize ; i++)
					{
					sql +="genre like '%"+genre[i]+"%' ";
					if(i==genreSize-1)break;
					
					sql+= " or ";
					}
					sql+=  " ) "
					+ "and age= ? ";
					int i=0;
			List<String>lst=new ArrayList<String>();
			try {
				PreparedStatement pstmt= conn.prepareStatement(sql);
				pstmt.setString(1, Usrgender);		
				pstmt.setString(2, Usrage);
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
	
		
		
	
	
		
		
	//사용자와 연령대, 성별대가 맞는 사람들의 평균 별점
		public float getResStarInfo(String UsrId,String resname, List<String>starLst){
			
			int strLstSize=starLst.size();
			
			String sql="select avg(starvalue) "
					+ "from stardb "
					+ "where starvalue!=0 "
					+ "and ( id= ? "
					+ "and resname= ? ";
			for( int i=0; i<strLstSize;i++) {		
					sql+= "or id=? "
					+ "and resname=? ";
			}
			sql+= ") ";
			
		
			int i=3;
			int a=0;
			float starvalue=0;
			try {
				PreparedStatement pstmt= conn.prepareStatement(sql);
				pstmt.setString(1, UsrId);
				pstmt.setString(2, resname);
				while( a<starLst.size() )
				{
					pstmt.setString(i, starLst.get(a));
					i++;
					a++;
					pstmt.setString(i, resname);	
					i++;
				}
				ResultSet rs=pstmt.executeQuery();
				if(rs.next())
				{
					starvalue=rs.getFloat(1);
				}
				rs.close();
				pstmt.close();
			} catch (SQLException e) {e.printStackTrace();}
			return starvalue;
		}
	
	
		
		//사용자의 초기 별점 전부 0점 넣어주기.
		public void insertFirstStarInfo(String id,int kcalLimit,int budget) 
		{
			
			//1. 식당명 전부 가져오기.
			
			String sql="SELECT resname,menukeyword "
					+ "FROM ResInfoDB  ";
			
			String deletesql="delete from stardb "
					+ "where id=? ";
			
			String insertsql="INSERT INTO StarDB"
					+ "  (id, resname, starValue,lastVisit,kcalLimit,budget, menukeyword) "
					+ "VALUES( ? , ? , ? , ? , ? , ? , ? )  ";	
			List<Stardb>lst=new ArrayList<Stardb>();//all resname and menukeyword save List
			try {
				PreparedStatement pstmt= conn.prepareStatement(sql);
				ResultSet rs=pstmt.executeQuery();
				while(rs.next())
				{
					Stardb stardb=new Stardb();
					stardb.setResname(rs.getString(1));
					stardb.setMenukeyword(rs.getString(2));	
					lst.add(stardb);			
				}	
				rs.close();
				pstmt.close();
				
				
				pstmt=conn.prepareStatement(deletesql);
				pstmt.setString(1,id);
				pstmt.executeUpdate();
				pstmt.close();
				
				
				
				
				
				pstmt=conn.prepareStatement(insertsql);
				for( Stardb item : lst)
				{	
				pstmt.setString(1, id );
				pstmt.setString(2 ,item.getResname());
				pstmt.setFloat(3,0);
				pstmt.setString(4,"00000000");
				pstmt.setInt(5, kcalLimit);
				pstmt.setInt(6,budget );
				pstmt.setString(7,item.getMenukeyword());
				pstmt.executeUpdate();
				}
				pstmt.close();
				
				
			} catch (SQLException e) {e.printStackTrace();}
			return ;
		}
	
		//별점 입력하기.
		
		  public void insertStarValue(String Usrid,String resname, float starValue,String
		  lastVisit,int kcalLimit,int budget)
		  {
					//1. 식당명 전부 가져오기.
					String getmenukeysql="SELECT menukeyword "
							+ "FROM ResInfoDB "
							+ "where resname=?  ";
					
					String deletesql="delete from StarDB "
							+ "where id= ? "
							+ "and resname=? ";
					
					String sql="INSERT INTO StarDB(id,resname,starValue,lastVisit,kcalLimit, "
						+"budget,menukeyword) "
						+ "VALUES(?,?,?,?,?,?,?)  ";
					String menukeyword="";
					try {
						PreparedStatement pstmt= conn.prepareStatement(getmenukeysql);
						pstmt.setString(1,resname);
						ResultSet rs=pstmt.executeQuery();
						if(rs.next())
						{
						 menukeyword = rs.getString(1);
						}
						rs.close();
						pstmt.close();
				
						pstmt= conn.prepareStatement(deletesql);
						pstmt.setString(1,Usrid);
						pstmt.setString(2,resname);
						pstmt.executeUpdate();
						pstmt.close();
						
						
						pstmt= conn.prepareStatement(sql);
						pstmt.setString(1,Usrid);
						pstmt.setString(2,resname);
						pstmt.setFloat(3,starValue);
						pstmt.setString(4,lastVisit);
						pstmt.setInt(5,kcalLimit);
						pstmt.setInt(6,budget);
						pstmt.setString(7, menukeyword);
						pstmt.executeUpdate();
						pstmt.close();
					} catch (SQLException e) {e.printStackTrace();}
					return ;
				}
	
	
}



















