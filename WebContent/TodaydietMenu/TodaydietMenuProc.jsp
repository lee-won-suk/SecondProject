<%@page import="com.jin.Star.UserStarDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.jin.DTO.Resinfodb"%>
<%@page import="com.jin.Resinfodb.ResinfoDAO"%>
<%@page import="com.jin.OneWeekCheck.OneWeekCheckDAO"%>
<%@page import="java.util.List"%>
<%@page import="com.jin.Userdiet.UserdietMenuDAO"%>
<%@page import="com.jin.DTO.Userdietdb"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Locale"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.jin.DTO.Memberdb"%>
<%@page import="com.jin.Member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%


Date date = new Date();
SimpleDateFormat sdf = new SimpleDateFormat("HH", Locale.KOREA);
int hour = Integer.parseInt(sdf.format(date));

Date today = new Date();
SimpleDateFormat sd = new SimpleDateFormat("YYYYMMdd",Locale.KOREA);
String TodayDate=sd.format(today);//8자리 오늘날짜



Calendar oCalendar = Calendar.getInstance( );  // 현재 날짜/시간 등의 각종 정보 얻기
final String[] week = { "일", "월", "화", "수", "목", "금", "토" };
String DayofWeek=week[oCalendar.get(Calendar.DAY_OF_WEEK) - 1];

final String[] Engweek = { "g", "a", "b", "c", "d", "e", "f" };
String EngDayofWeek=Engweek[oCalendar.get(Calendar.DAY_OF_WEEK) - 1];


String Time="아침";
String engTime="morning";
if(hour<13 && hour>=8)
{
	Time="점심";
	engTime="lunch";
}
else if(hour<24 && hour>=13)
{
	Time="저녁";
	engTime="dinner";
}


engTime="lunch";								//테스트용 임의설정. 현재 시간대에 값이 없으면 null로 뜬다. 수정필요


//MemberDB에서 유저정보 받아오기.
MemberDAO memberdao=new MemberDAO();
Memberdb memberdb=new Memberdb();




String UsrId=(String)session.getAttribute("usrId");//아이디 연결


memberdb=memberdao.getMemberInfo(UsrId); 

/*현재 로그인 된 유저의 일주일 식단 정보 가져오기.  */
UserdietMenuDAO usrdiet=new UserdietMenuDAO();

//오늘 시간과 요일의 메뉴식단을 일주일 식단 db에서 가져온다.
Userdietdb userdietdb=usrdiet.getTodayMenuInfo(UsrId, engTime, EngDayofWeek);



String [] Userday=memberdb.getUserday().split(" ");//사용자 요일 받아와서 처리
OneWeekCheckDAO oneWeekCheckdao=new OneWeekCheckDAO();

//유저의 일주일 달성도 값을 가져온다.
List<Integer> UserOneWeekcheck=oneWeekCheckdao.getOneWeekCheckInfo(UsrId, Userday.length);



//3개로 각각의 대표메뉴를 얻는다.
//1. 음식 DB로 들어간다.
//2. 식당 이름을 조건으로 대표메뉴를 빼온다.
// 리스트로 3개 한꺼번에 가져온다.
ResinfoDAO resinfoDao=new ResinfoDAO();
List<Resinfodb> TodayResinfo=new ArrayList<Resinfodb>();
TodayResinfo.add ( resinfoDao.getUsrresInfo(userdietdb.getResname1()) );
TodayResinfo.add ( resinfoDao.getUsrresInfo(userdietdb.getResname2()) );
TodayResinfo.add ( resinfoDao.getUsrresInfo(userdietdb.getResname3()) );



//나와 성별과 연령대가 맞는 사용자 받아오기.
UserStarDAO usrStarDao=new UserStarDAO();
List<String>starLst=usrStarDao.getSameUsrInfo(memberdb.getGender(),memberdb.getAge(),UsrId);
//List<String>starLst=usrStarDao.getSameUsrInfo("m","20" , UsrId);

float [] starvalue=new float [3];
//유저 오늘의 식당 3개에 대한 평균별점 가져오기.
 starvalue[0] = usrStarDao.getResStarInfo(UsrId,userdietdb.getResname1(), starLst);
 starvalue[1] = usrStarDao.getResStarInfo(UsrId,userdietdb.getResname2(), starLst);
 starvalue[2] = usrStarDao.getResStarInfo(UsrId,userdietdb.getResname3(), starLst);




session.setAttribute("memberdb", memberdb);
session.setAttribute("DayofWeek", DayofWeek);//오늘요일 추가
session.setAttribute("EngDayofWeek",EngDayofWeek);//오늘 영어요일 추가
session.setAttribute("Time", Time);//시간대 추가
session.setAttribute("engTime", engTime);//시간대 추가	
session.setAttribute("TodayResinfo",TodayResinfo);

session.setAttribute("TodayDate",TodayDate);//오늘 날짜 8자리

session.setAttribute("Userday", Userday);//사용자가 선택한 요일 추가	
session.setAttribute("UserOneWeekcheck", UserOneWeekcheck);//사용자달성도 int 리스트 전달.	
request.setAttribute("starvalue", starvalue);//평균 별점 배열 전달	



session.setAttribute("userdietdb",userdietdb);
%>

 <jsp:forward page="/main.jsp">
<jsp:param value="TodaydietMenu" name="currentPage"/>
</jsp:forward> 







