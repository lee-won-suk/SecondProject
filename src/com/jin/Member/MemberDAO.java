package com.jin.Member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.jin.DTO.Memberdb;


public class MemberDAO {
	private Connection conn ;
	
	public MemberDAO() {
		String url="jdbc:oracle:thin:@localhost:1521:xe";
		String user="c##jin";
		String pass="jin1234";
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn= DriverManager.getConnection(url, user, pass);
		} catch (Exception e) {	e.printStackTrace();	}
	
	}
	

	//유저의 정보 가져오기.
	public Memberdb getMemberInfo(String UsrId){
		//pageNumber = 가져올 페이지의 번호. 1,2,3,4       RowsPerPage= 한페이지에가져올 행(row)의 수.
		String sql="SELECT id, pw, Tel, Userday, UserTime, kcalLimit, budget, genre, Lvl, point, exp, age, gender "
				+ "FROM MemberDB "
				+ "WHERE id = ? ";
		Memberdb memberdb=new Memberdb();
		try {
			PreparedStatement pstmt= conn.prepareStatement(sql);
			pstmt.setString(1, UsrId);
			ResultSet rs=pstmt.executeQuery();
			if(rs.next())
			{
			
				memberdb.setId(rs.getString(1));
				memberdb.setPw(rs.getString(2));
				memberdb.setTel(rs.getInt(3));
				memberdb.setUserday(rs.getString(4));
				memberdb.setUsertime(rs.getString(5));
				memberdb.setKcallimit(rs.getInt(6));
				memberdb.setBudget(rs.getInt(7));
				memberdb.setGenre(rs.getString(8));
				memberdb.setLvl(rs.getInt(9));
				memberdb.setPoint(rs.getInt(10));
				memberdb.setExp(rs.getInt(11));
				memberdb.setAge(rs.getString(12));
				memberdb.setGender(rs.getString(13));
			}
			
			
			
			rs.close();
			pstmt.close();
		} catch (SQLException e) {e.printStackTrace();}
		return memberdb;
	}
	public Memberdb getGenre(String id, String genre){
		Memberdb memberdb = new Memberdb();
		String sql="SELECT id, genre " +
				   "FROM memberDB " +
				   "WHERE id = ?;";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			ResultSet rs = pstmt.executeQuery();
		if(rs.next()) {
			memberdb.getId();
			memberdb.getGenre();
		}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return memberdb;
	}
	
	public void IncreasePoint(String id){
		Memberdb memberdb = new Memberdb();
		String sql="UPDATE MemberDB "
				+ "SET "
				+ "point = point+500 , "
				+ "exp=exp+500     "
				+ "WHERE id =?  ";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.executeUpdate();
	
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		}
	
	public void IncreasePartResPoint(String id){
		Memberdb memberdb = new Memberdb();
		String sql="UPDATE MemberDB "
				+ "SET "
				+ "point = point+200  "
				+ "WHERE id = ?  ";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.executeUpdate();
	
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		}
	public List<String> getId() {
		Memberdb memberdb = new Memberdb();
		String sql=	"select id " +
					"from( " + 
					 	  "select * " +
					 	  "from memberdb " +
					 	  "order by exp desc) " +
					 	  "where rownum <=3 ";
		List<String> lst = new ArrayList<String>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs=pstmt.executeQuery();
			while(rs.next()) {
			lst.add(rs.getString(1));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return lst;
	}
}



















