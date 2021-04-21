<%@page import="com.jin.Resinfodb.ResinfoDAO"%>
<%@page import="java.util.Collections"%>
<%@page import="java.util.Collection"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="com.jin.MenuKeyword.MenuKeywordDAO"%>
<%@page import="com.jin.DTO.Userdietdb"%>
<%@page import="com.jin.Userdiet.UserdietMenuDAO"%>
<%@page import="com.jin.LikeCheck.UserLikeCheckDAO"%>
<%@page import="com.jin.DTO.Memberdb"%>
<%@page import="com.jin.Member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
ResinfoDAO resDao=new ResinfoDAO();
MenuKeywordDAO menuKeywordDao=new MenuKeywordDAO();

String EngDay=(String)session.getAttribute("EngDayofWeek");//현재요일
String engTime=(String)session.getAttribute("engTime");//현재 시간대
Memberdb memberdb=(Memberdb)session.getAttribute("memberdb");
UserdietMenuDAO usrdietDao=new UserdietMenuDAO();

//MemberDB에서 유저정보 받아오기.
MemberDAO memberdao=new MemberDAO();

UserLikeCheckDAO usrlikeDao=new UserLikeCheckDAO();
String value=request.getParameter("value");
String UsrId=(String)session.getAttribute("usrId");//아이디 연결
String menukeyword=request.getParameter("menukeyword");

//사용자 목표 칼로리, 예산 가져오기.
int UsrKcal=memberdb.getKcallimit();
int UsrBudget=memberdb.getBudget();
String [] Usergenre=memberdb.getGenre().split(" ");//사용자 선호장르 받아와서 처리

MenuKeywordDAO menukeyDao=new MenuKeywordDAO();
List<String> UsrMenuKeywordlst =menukeyDao.getUsrMenuKeywordInfo(Usergenre, UsrKcal, UsrBudget);//예산과 칼로리에 맞는 키워드 리스트
//사용자의 싫어요 메뉴키워드 제거.
UserLikeCheckDAO likecheckDao=new UserLikeCheckDAO();
//사용자가 싫어하는 메뉴키워드 목록 생성.
List<String>DislikeMenuKeyword=likecheckDao.getKeywordLike(UsrId);
DislikeMenuKeyword.add(menukeyword);
Iterator iter; //이터레이터로 싫어요 메뉴키워드들을 UsrMenuKeywordlst에서 전부 지운다. 
for( String item : DislikeMenuKeyword)
{
	iter = UsrMenuKeywordlst.iterator(); 
	while(iter.hasNext()) 
	{ 
		if(item.equals(iter.next() )) 
		{ 
			iter.remove(); 
		}
	}
}
Collections.shuffle(UsrMenuKeywordlst); //키워드 랜덤 정렬
for(String item :UsrMenuKeywordlst )
	System.out.println("새로 받은 키워드 :"+ item);





//좋아요 싫어요 반영.
if("good".contentEquals(value)==true)
{
//좋아요값 넣기.
usrlikeDao.insertIsLike(1, UsrId, menukeyword);
}
else if("bad".contentEquals(value)==true)
{
usrlikeDao.insertIsLike(0, UsrId, menukeyword);
//현재 요일과 시간대의 식단 삭제하고 새로 넣어주기
//오늘요일과 시간대 가져오기
usrdietDao.deleteUsrdiet(UsrId, EngDay, engTime);//싫어요를 눌렀을 때 현재 요일과 시간대의 식단 삭제


String UsrMenuKeyword=UsrMenuKeywordlst.get(0);//사용자의 예산과 칼로리에 맞는 메뉴키워드 1개

List<Integer> menuKeywordlst=menuKeywordDao.getMenuKeywordKcalBud(UsrMenuKeyword);	
int menukeywordKcal=menuKeywordlst.get(0); //메뉴키워드의 칼로리, 예산 받아오기.
int menukeywordBudget=menuKeywordlst.get(1);		
List<String> Reslst=resDao.getStarIncluedResInfo(UsrMenuKeyword, UsrId);//사용자의 별점을 반영한 
Collections.shuffle(Reslst);//, shuffle 후 거기서 3개를 insert 한다.	
if(Reslst.size()==0)
	usrdietDao.InsertUsrdiet(UsrId, EngDay,engTime , UsrMenuKeyword,"","","", menukeywordKcal, menukeywordBudget);
else if(Reslst.size()==1)
	usrdietDao.InsertUsrdiet(UsrId, EngDay, engTime, UsrMenuKeyword, Reslst.get(0),"","", menukeywordKcal, menukeywordBudget);
else if(Reslst.size()==2)
	usrdietDao.InsertUsrdiet(UsrId, EngDay,engTime, UsrMenuKeyword, Reslst.get(0),Reslst.get(1),"", menukeywordKcal, menukeywordBudget);
else 
	usrdietDao.InsertUsrdiet(UsrId, EngDay,engTime, UsrMenuKeyword, Reslst.get(0),Reslst.get(1),Reslst.get(2), menukeywordKcal, menukeywordBudget);				
}



%>

 <jsp:forward page="/main.jsp">
<jsp:param value="TodaydietMenuProc" name="currentPage"/>
</jsp:forward>  







