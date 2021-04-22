<!--사용자 초기식단 생성 페이지. 테스트
FirstAuthProc/FirstAuthProc.jsp
  -->

<%@page import="com.jin.LikeCheck.UserLikeCheckDAO"%>
<%@page import="com.jin.OneWeekCheck.OneWeekCheckDAO"%>
<%@page import="com.jin.Star.UserStarDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.jin.Resinfodb.ResinfoDAO"%>
<%@page import="java.util.Collections"%>
<%@page import="com.jin.MenuKeyword.MenuKeywordDAO"%>
<%@page import="com.jin.Member.MemberDAO"%>
<%@page import="java.util.List"%>
<%@page import="com.jin.Userdiet.UserdietMenuDAO"%>
<%@page import="com.jin.DTO.Userdietdb"%>
<%@page import="com.jin.DTO.Memberdb"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	String contextPath =request.getContextPath();
	String path = contextPath +  "/main.jsp";	

	UserLikeCheckDAO usrlikecheckDao=new UserLikeCheckDAO();

//사용자가 입력한 요일과 시간대를 받아온다. 임의로 계정생성후 있다고 가정. 사용계정 = 'f1234'
//MemberDB에서 유저정보 받아오기.
MemberDAO memberdao=new MemberDAO();
Memberdb memberdb=new Memberdb();

//회원가입 연동시 아이디 받아오기로 바꿔주면 된다.
String UsrId=(String)session.getAttribute("usrId");



//String UsrId="f1234";//아이디설정 .  f1234추가 필요
memberdb=memberdao.getMemberInfo(UsrId);

//0.2 파싱후 요일, 시간대,선호장르 배열을 만든다.
String [] Userday=memberdb.getUserday().split(" ");//사용자 요일 받아와서 처리
String [] UserTime=memberdb.getUsertime().split(" ");//사용자 시간대 받아와서 처리
String [] Usergenre=memberdb.getGenre().split(" ");//사용자 선호장르 받아와서 처리


for(String item : Userday)
	item = item.replaceAll(" ","");
for(String item : UserTime)
	item = item.replaceAll(" ","");
for(String item : Userday)
	System.out.println("유저 선택 날 :"+item);



//사용자 목표 칼로리, 예산 가져오기.
int UsrKcal=memberdb.getKcallimit();
int UsrBudget=memberdb.getBudget();
for(String item : Usergenre)
	System.out.println("장르는 :"+item);

System.out.println("목표 칼로리 :"+UsrKcal);
System.out.println("목표 예산 :"+UsrBudget);


//(0)	목표 칼로리 및 예산내에 가능하도록 키워드를 뽑고 랜덤하게 키워드 배열을 만든다.
//뽑아야될 키워드 수= 요일수 * 시간대종류수.
//데이터가 부족하기 때문에 일단 예산과 칼로리에 맞는 키워드를 전부 뽑아낸다.
MenuKeywordDAO menukeyDao=new MenuKeywordDAO();
List<String> UsrMenuKeywordlst =menukeyDao.getUsrMenuKeywordInfo(Usergenre, UsrKcal, UsrBudget);//예산과 칼로리에 맞는 키워드 리스트

Collections.shuffle(UsrMenuKeywordlst); //키워드 랜덤 정렬


UserdietMenuDAO usrdietMenuDao=new UserdietMenuDAO();
//(1) resinfoddb에서	사용자가 선택했던 음식종류와 같은 데이터 목록 생성
//(2)	이 데이터 목록에서 메뉴키워드 별로 랜덤으로 3개 뽑는다.
//(3)	그후 요일 별로 시간대, 메뉴키워드,메뉴키워드 칼로리, 예산, 식당 3개값을 만든다.


ResinfoDAO resDao=new ResinfoDAO();
MenuKeywordDAO menuKeywordDao=new MenuKeywordDAO();





//초기 별점 데이터 전부 0으로 넣어주기
UserStarDAO usrStarDao=new UserStarDAO();
usrStarDao.insertFirstStarInfo( UsrId , UsrKcal,UsrBudget);
 
//달성도 데이터 전부 0으로 넣어주기.
OneWeekCheckDAO oneweekCheckDao=new OneWeekCheckDAO();
oneweekCheckDao.InsertFirstWeekCheck(UsrId, Userday);



//좋아요 데이터 전부 1로 넣어주기.
List <String> menukeywordLst=usrlikecheckDao.getAllMenuKeyword();

usrlikecheckDao.InsertFirstlikeCheck(UsrId, menukeywordLst);


//식단 초기화
usrdietMenuDao.resetUsrdiet(UsrId);
System.out.println("메뉴키워드 print 전");
for(String item : UsrMenuKeywordlst)
System.out.println("사용자 메뉴키워드 : " +item);

System.out.println("날짜 개수"+Userday.length);

 //1. 사용자가 선택한 요일이 1개인 경우;
  if(UserTime.length==1)
{
	for(int i=0;i<Userday.length;i++)//사용자가 선택한 요일만큼 입력.
	{
		if(Userday[i].contentEquals("")!=true){//요일값이 있을 때		
			String UsrMenuKeyword=UsrMenuKeywordlst.get(i);//사용자의 예산과 칼로리에 맞는 메뉴키워드 1개. 문제없음.
			System.out.println("뽑은 메뉴키워드 : "+UsrMenuKeyword);
			 List<Integer> menuKeywordlst=menuKeywordDao.getMenuKeywordKcalBud(UsrMenuKeyword);	
			int menukeywordKcal=menuKeywordlst.get(0); //메뉴키워드의 칼로리, 예산 받아오기.
			int menukeywordBudget=menuKeywordlst.get(1);		
			List<String> Reslst=resDao.getFirstResInfo(UsrMenuKeyword);//메뉴키워드 별로 한개씩 집어넣어서 식당목록을 가져오고
			Collections.shuffle(Reslst);//, shuffle 후 거기서 3개를 insert 한다.	
			usrdietMenuDao.InsertUsrdiet(UsrId, Userday[i], UserTime[0], UsrMenuKeyword, Reslst.get(0),Reslst.get(1),Reslst.get(2), menukeywordKcal, menukeywordBudget);
			
		}
		
	}
	
}  
 
 
 
//2. 사용자가 선택한 요일이 2개인 경우  -> 아직 미구현
//3. 사용자가 선택한 요일이 3개인 경우; - > 쉽지 않을 듯.
 
 
 


%>
<jsp:forward page="/main.jsp">
<jsp:param value="loginForm" name="currentPage"/>
</jsp:forward> 