<%@page import="com.jin.OneWeekCheck.OneWeekCheckDAO"%>
<%@page import="com.jin.Resinfodb.ResinfoDAO"%>
<%@page import="com.jin.Member.MemberDAO"%>
<%@page import="com.jin.DTO.Memberdb"%>
<%@page import="com.jin.Star.UserStarDAO"%>
<%@page import="com.jin.DTO.Stardb"%>
<%@page import="com.jin.DTO.Userdietdb"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>

<%
MemberDAO memberDao=new MemberDAO();
ResinfoDAO resDao=new ResinfoDAO();
Memberdb memberdb=(Memberdb)session.getAttribute("memberdb");
String Time=(String)session.getAttribute("Time");//시간대 추가
String EngDayofWeek=(String)session.getAttribute("EngDayofWeek");//오늘요일 가져오기
//현재 오늘의 식당메뉴 받아오기.
Userdietdb userdietdb=(Userdietdb)session.getAttribute("userdietdb");

String UsrId=(String)session.getAttribute("usrId");//아이디 가져오기

float starvalue=Float.parseFloat(request.getParameter("starvalue"));
String resname=request.getParameter("check");
String visitDate=(String)session.getAttribute("TodayDate");


//별점 입력 및 제휴식당이면 포인트 추가로 주기 .
UserStarDAO usrstarDao=new UserStarDAO();
usrstarDao.insertStarValue(UsrId, resname, starvalue, visitDate,memberdb.getKcallimit(),memberdb.getBudget());
  
if(resDao.ispartnerRes(resname)==true)//제휴식당이면 점수 추가
{
	memberDao.IncreasePartResPoint(UsrId);
}
//달성도 1개 올려주기.
OneWeekCheckDAO oneweekCheckDao=new OneWeekCheckDAO();
oneweekCheckDao.increaseTodayPer(UsrId,EngDayofWeek);


%>
 <jsp:forward page="/main.jsp">
<jsp:param value="TodaydietMenuProc" name="currentPage"/>
</jsp:forward> 