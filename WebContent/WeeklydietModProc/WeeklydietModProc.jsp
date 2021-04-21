<!--사용자 일주일 식단 초기화 및 재생성 페이지. 테스트
WeeklydietModProc/WeeklydietModProc.jsp
  -->

<%@page import="com.jin.OneWeekCheck.OneWeekCheckDAO"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.jin.LikeCheck.UserLikeCheckDAO"%>
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
	UserdietMenuDAO usrDietMenuDao=new UserdietMenuDAO();
	List<Integer> UserOneWeekcheck=(List<Integer>)session.getAttribute("UserOneWeekcheck");

	//String UsrId=(String)session.getAttribute("usrId"); //사용자 아이디 
	

//MemberDB에서 유저정보 받아오기.
MemberDAO memberdao=new MemberDAO();
Memberdb memberdb=new Memberdb();

//사용자가 입력한 요일과 시간대를 받아온다. 임의로 계정생성후 있다고 가정. 사용계정 = 'f1234'
String UsrId="f1234";//임시로 아이디 설정.
memberdb=memberdao.getMemberInfo(UsrId);


// 파싱후 요일, 시간대,선호장르 배열을 만든다.
String [] Userday=memberdb.getUserday().split(" ");//사용자 요일 받아와서 처리
String [] UserTime=memberdb.getUsertime().split(" ");//사용자 시간대 받아와서 처리
String [] Usergenre=memberdb.getGenre().split(" ");//사용자 선호장르 받아와서 처리

for(String item : Userday)
	item = item.replaceAll(" ","");
for(String item : UserTime)
	item = item.replaceAll(" ","");
for(String item : Userday)
	item = item.replaceAll(" ","");



//추가 할 내용 : 달성도랑 사용자의 일주일 식단 초기화
OneWeekCheckDAO oneweekCheckDao=new OneWeekCheckDAO();
int UsrTimeNum= UserTime.length;
boolean isWeekcheck=true;


 for (int item : UserOneWeekcheck)
{
	if(item!=UsrTimeNum)//한번이라도 달성 못하면
	isWeekcheck=false;
}
//달성도를 다 달성하면 포인트 올려주기.
if(isWeekcheck==true)
{
	memberdao.IncreasePoint(UsrId);
}



//달성도 초기화하기.
oneweekCheckDao.resetUsrWeekcheck(UsrId);

//일주일 식단 초기화.
usrDietMenuDao.resetUsrdiet(UsrId);
 
 
 
 
 
 

//사용자 목표 칼로리, 예산 가져오기.
int UsrKcal=memberdb.getKcallimit();
int UsrBudget=memberdb.getBudget();

//(0)	목표 칼로리 및 예산내에 가능하도록 키워드를 뽑고 랜덤하게 키워드 배열을 만든다.
//뽑아야될 키워드 수= 요일수 * 시간대종류수.
//데이터가 부족하기 때문에 일단 예산과 칼로리에 맞는 키워드를 전부 뽑아낸다..
MenuKeywordDAO menukeyDao=new MenuKeywordDAO();
List<String> UsrMenuKeywordlst =menukeyDao.getUsrMenuKeywordInfo(Usergenre, UsrKcal, UsrBudget);//예산과 칼로리에 맞는 키워드 리스트
//사용자의 싫어요 메뉴키워드 제거.
UserLikeCheckDAO likecheckDao=new UserLikeCheckDAO();

//사용자가 싫어하는 메뉴키워드 목록 생성.
List<String>DislikeMenuKeyword=likecheckDao.getKeywordLike(UsrId);


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



UserdietMenuDAO usrdietMenuDao=new UserdietMenuDAO();
//(1) resinfoddb에서	사용자가 선택했던 음식종류와 같은 데이터 목록 생성
//(2)	이 데이터 목록에서 메뉴키워드 별로 랜덤으로 3개 뽑는다.
//(3)	그후 요일 별로 시간대, 메뉴키워드,메뉴키워드 칼로리, 예산, 식당 3개값을 만든다.


ResinfoDAO resDao=new ResinfoDAO();
MenuKeywordDAO menuKeywordDao=new MenuKeywordDAO();




 
  //1. 사용자가 선택한 요일이 1개인 경우;
 if(UserTime.length==1)
{
	for(int i=0;i<Userday.length;i++)//사용자가 선택한 요일만큼 입력.
	{
		String UsrMenuKeyword=UsrMenuKeywordlst.get(i);//사용자의 예산과 칼로리에 맞는 메뉴키워드 1개. 문제없음.
		
		 List<Integer> menuKeywordlst=menuKeywordDao.getMenuKeywordKcalBud(UsrMenuKeyword);	
		int menukeywordKcal=menuKeywordlst.get(0); //메뉴키워드의 칼로리, 예산 받아오기.
		int menukeywordBudget=menuKeywordlst.get(1);		
		List<String> Reslst=resDao.getStarIncluedResInfo(UsrMenuKeyword, UsrId);//사용자의 별점을 반영한
		Collections.shuffle(Reslst);//, shuffle 후 거기서 3개를 insert 한다.	
		if(Reslst.size()==0)
			usrdietMenuDao.InsertUsrdiet(UsrId, Userday[i], UserTime[0], UsrMenuKeyword,"","","", menukeywordKcal, menukeywordBudget);
		else if(Reslst.size()==1)
			usrdietMenuDao.InsertUsrdiet(UsrId, Userday[i], UserTime[0], UsrMenuKeyword, Reslst.get(0),"","", menukeywordKcal, menukeywordBudget);
		else if(Reslst.size()==2)
			usrdietMenuDao.InsertUsrdiet(UsrId, Userday[i], UserTime[0], UsrMenuKeyword, Reslst.get(0),Reslst.get(1),"", menukeywordKcal, menukeywordBudget);
		else 
		usrdietMenuDao.InsertUsrdiet(UsrId, Userday[i], UserTime[0], UsrMenuKeyword, Reslst.get(0),Reslst.get(1),Reslst.get(2), menukeywordKcal, menukeywordBudget);				
		//하나도 안들어갔을 때 문제 해결 필요
	}
	
}   

//2. 사용자가 선택한 요일이 2개인 경우  -> 아직 미구현
//3. 사용자가 선택한 요일이 3개인 경우; - > 쉽지 않을 듯.
 
 
 


%>
 
<jsp:forward page="/main.jsp">
<jsp:param value="TodaydietMenuProc" name="currentPage"/>
</jsp:forward> 