package com.jin.MenuEdit;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class MenuEditDAO {
	
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
	
	public void setPartres(int menukeywordKcal,int menukeywordBudget,Connection conn, String resName, String menuKeyword,String UsrId,String UserChangeDay,
			String UserChangeTime) {
		
		String sql="update userdietdb "
				+ "set resname1=?, "
				+ " resname2=null, "
				+ "resname3=null,"
				+ "menukeywordKcal=?,"
				+ "menukeywordbudget=?, "
				+ "menukeyword=?  "
				+ "where id=? "
				+ "and time=? "
				+ "and day=? ";	
		
	
		 try {
			PreparedStatement pstmt=conn.prepareStatement(sql);
			
			
			pstmt.setString(1, resName);
			pstmt.setInt(2, menukeywordKcal);
			pstmt.setInt(3, menukeywordBudget);
			
			pstmt.setString(4, menuKeyword);
			pstmt.setString(5, UsrId);
			pstmt.setString(6, UserChangeTime);
			pstmt.setString(7, UserChangeDay);
			
			
			
			pstmt.executeUpdate();
			pstmt.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 
		
	}
	

	public void setPartres(int menukeywordKcal,int menukeywordBudget,Connection conn, String resName1 ,String resName2, String resName3, String menuKeyword,String UsrId,String UserChangeDay,
			String UserChangeTime) {
		
		String sql="update userdietdb "
				+ "set resname1=?, "
				+ " resname2=?, "
				+ "resname3=?, "
				+ "menukeywordKcal=?,"
				+ "menukeywordbudget=?, "
				+ "menukeyword=?  "
				+ "where id=? "
				+ "and time=? "
				+ "and day=? ";	
		
	
		 try {
			PreparedStatement pstmt=conn.prepareStatement(sql);
			
			
			pstmt.setString(1, resName1);
			pstmt.setString(2, resName2);
			pstmt.setString(3, resName3);
			pstmt.setInt(4, menukeywordKcal);
			pstmt.setInt(5, menukeywordBudget);
			
			pstmt.setString(6, menuKeyword);
			pstmt.setString(7, UsrId);
			pstmt.setString(8, UserChangeTime);
			pstmt.setString(9, UserChangeDay);
			
			
			
			pstmt.executeUpdate();
			pstmt.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 
		
	}
	
	
	
	
	//占쎌�占쏙옙占쎌벥 燁살눖以덄뵳�딉옙 占쎌굙占쎄텦占쎄땀占쎈퓠 占쎈굶占쎈선占쎌궎占쎈뮉 筌롫뗀�뤀占쎄텕占쎌뜖占쎈굡 筌믩쵐釉섓옙沅→묾占�.
    public List<String> getUsrMenuKeywordInfo(Connection conn, String [] Usergenre, int UsrKcal,int UsrBudget){
       
       int genreSize=Usergenre.length;
       
       String sql="SELECT menukeyword "
             + "FROM  MenuKeywordDB  "
             + "WHERE (";
             for( int i=0;i<genreSize;i++)//占쎄퐨占쎌깈占쎌삢�몴占� 占쎌뿯占쎌젾占쎌뱽 揶쏉옙癰귨옙占쎌읅占쎌몵嚥∽옙 占쎈릭占쎌젻�⑨옙.
             {
                sql+= " genre= ? ";
                if(i==genreSize-1) break;//筌띾뜆占쏙쭕�맩肉됵옙�뮉 or占쎈툧�겫�늿�뵥占쎈뼄.
                sql+= " or ";
             }
           sql+= ") "
             + "and menukeywordKcal<=?  "
             + "and menukeywordbudget<=?";
           int i;
       List<String> lst=new ArrayList<String>();
       try {
          PreparedStatement pstmt= conn.prepareStatement(sql);
          //揶쏉옙癰귨옙占쎌읅占쎌몵嚥∽옙 揶쏉옙 占쏙옙占쎌삢
          for(i=1;i<=genreSize;i++)
          {
             pstmt.setString(i, Usergenre[i-1]);//筌△뫀占쏙옙占썸에占�    獄쏆룇釉섓옙�궔 占쎄퐨占쎌깈占쎌삢�몴占� 占쎌뿯占쎌젾.
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
 // 占쎄텕占쎌뜖占쎈굡占쎈굶占쎈퓠 占쏙옙占쎈립 占쎌젫占쎌몧占쎈뻼占쎈뼣 獄쏆꼹�넎
    public List<String> getPartResInfo(Connection conn ,String menukeyword ){

       String sql="SELECT resname "
             + "FROM  resinfodb  "
             + "WHERE menukeyword=? "
             + "and PARTNERRES= 1 ";
             
           int i;
           List<String> lst=new ArrayList<String>();
           
       try {
          PreparedStatement pstmt= conn.prepareStatement(sql);
       
       
          pstmt.setString(1, menukeyword);            
          ResultSet rs=pstmt.executeQuery();
    
          while(rs.next())
          {
             lst.add(rs.getString(1));
          }
          rs.close();
          pstmt.close();
       } catch (SQLException e) {e.printStackTrace();
       System.out.println("problem in getPartResInfo");}
       return lst;
    }

    
    //���몴硫붾돱 媛��졇�삤湲�
    public String getMenuInfo(Connection conn ,String resname )
    {

        String sql="SELECT menuname "
              + "FROM  resinfodb  "
              + "WHERE resname=? ";
        try {
           PreparedStatement pstmt= conn.prepareStatement(sql);  
           pstmt.setString(1, resname);            
           ResultSet rs=pstmt.executeQuery();
     
           if(rs.next())
           {
             return rs.getString(1);
           }
           rs.close();
           pstmt.close();
        } catch (SQLException e) {e.printStackTrace();
        System.out.println("problem in getMenuInfo");}
        return null;
     }

    
      //사용자가 전부 좋아요 표시한 메뉴키워드 가져오기.
	  public List<String> getOneMenukeyWord(Connection conn ,List<String> starLst ) {
	int starSize=starLst.size();
	 String sql="select  menukeyword ,AVG(islike) "
	 		+ "from likecheckdb "
	 		+ "where ( ";
	 		  for( int i=0;i<starSize;i++)
	             {
	                sql+= " id=? ";
	                if(i==starSize-1) break;
	                sql+= " or ";
	             }
	 		  	sql+= ") group by menukeyword "
	 		  	+"having AVG(islike) =1 "; 
	 		  	int i=0;
	List<String> menukeyLst=new ArrayList<String>();
	 try
	 {
	 			PreparedStatement pstmt= conn.prepareStatement(sql);
	 			 for(i=0;i<starSize;i++)
	 	          {
	 	             pstmt.setString(i+1, starLst.get(i)); 
	 	          }
	 			 
	 			ResultSet rs=pstmt.executeQuery(); 
	 			while(rs.next()) 
	 			{ 
	 				menukeyLst.add(rs.getString(1)); 
	 			} 
		rs.close();
		pstmt.close();
	 	} catch
	 (SQLException e) {
	 e.printStackTrace();
	  System.out.println("problem in getOneMenukeyWord");
	  } 
	 return menukeyLst; 
	 
	 }

	  //�궗�슜�옄�� 痍⑦뼢�씠 留욌뒗 �궗�엺�뱾�쓣 �쟾遺� 紐⑥븘�꽌 蹂꾩젏�씠 3�젏�씠�긽�씤 �떇�떦留� 異쒕젰
	  public List<String> getRes(Connection conn ,List<String>starLst,String menuKeyword )
	  {
		  
	int starSize=starLst.size();
	 String sql="select  resname "
	 		+ "from stardb "
			 
	 		+ "where( ";
	 		for(int i=0;i<starSize;i++)
	 		{
	 		sql+= "id= '"+starLst.get(i)+"' ";
	 			if(i==starSize-1)break;
	 				sql+=" or ";
	 		}
	 		
	 		sql+= ") "
	 		+ "and menukeyword=? "
	 		+ "and starvalue >=3 "
	 		+ "group by resname "; 
	 		 
	List<String> menukeyLst=new ArrayList<String>();
	 try
	 {
	 			PreparedStatement pstmt= conn.prepareStatement(sql);
	 			pstmt.setString(1, menuKeyword);
	 			ResultSet rs=pstmt.executeQuery(); 
	 			if(rs.next()) 
	 			{ 
	 				menukeyLst.add(rs.getString(1)); 
	 			} 
		rs.close();
		pstmt.close();
	 	} catch
	 (SQLException e) {
	 e.printStackTrace();
	  System.out.println("problem in getRes");
	  } 
	 return menukeyLst; 
	 
	 }
    
    
    
    
    
    
    
    
    
    
}
