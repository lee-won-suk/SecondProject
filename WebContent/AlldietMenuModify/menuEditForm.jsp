<%@page import="com.jin.MenuKeyword.MenuKeywordDAO"%>
<%@page import="com.jin.Star.UserStarDAO"%>
<%@page import="java.util.Collections"%>
<%@page import="java.util.List"%>
<%@page import="com.jin.MenuEdit.MenuEditDAO"%>
<%@page import="com.jin.DTO.Memberdb"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = (String)session.getAttribute("usrId");
String text=request.getParameter("lunchEdit");
String [] data=text.split(" ");

String UserChangeDay=data[0];
UserChangeDay=UserChangeDay.replaceAll(" ","");
String UserChangeTime=data[1];
UserChangeTime=UserChangeTime.replaceAll(" ","");


//사용자의 선호 장르이면서 비용/칼로리 범위가 부합하는 식당을 선정
UserStarDAO usrStarDao=new UserStarDAO();

Memberdb memDB = (Memberdb)session.getAttribute("memberdb");
String [] Usergenre = memDB.getGenre().split(" ");
int usrBudget = memDB.getBudget();
int usrKcal = memDB.getKcallimit();
List<String>starLst=usrStarDao.getSameUsrInfo(memDB.getGender(),memDB.getAge(),id,Usergenre);//취향이 맞는 사용자들 



MenuEditDAO menuEditDao = new MenuEditDAO();	
List<String> menuEditKeyword = menuEditDao.getUsrMenuKeywordInfo(menuEditDao.getConn(), Usergenre, usrKcal, usrBudget);

Collections.shuffle(menuEditKeyword);
String menuKeyword = menuEditKeyword.get(0);
session.setAttribute("menuKeyword", menuKeyword);

List<String> ResInfo = menuEditDao.getPartResInfo(menuEditDao.getConn(), menuKeyword);
String resName = ResInfo.get(0);
session.setAttribute("resName", resName);


//대표메뉴 가져오기 MenuEditDAO
String bestMenu = menuEditDao.getMenuInfo(menuEditDao.getConn(), resName);


//별점 가져오기
float PartResStarvalue = usrStarDao.getResStarInfo(id, resName , starLst);//제휴식당용


//사용자 선호하는 메뉴 관련 데이터 
//성별, 선호장르, 연령이 같은 사용자 가져오기.-> starLst

//사용자 좋아요가 1인 메뉴키워드 가져오기.
List<String>  lst = menuEditDao.getOneMenukeyWord(menuEditDao.getConn(), starLst);
Collections.shuffle(lst);
String menuKeyword2 = lst.get(0);
MenuKeywordDAO menuKeywordDao=new MenuKeywordDAO();
List<Integer> menuKeywordlst=menuKeywordDao.getMenuKeywordKcalBud(menuKeyword2);	
int menukeywordBudget=menuKeywordlst.get(1);
session.setAttribute("starLst", starLst);
session.setAttribute("menuKeyword2", menuKeyword2);


%>
<style type="text/css">
.bottom{border-bottom:1px solid;}
.left{border-left:1px solid;}
.right{border-right:1px solid;}
</style>
<center>
<form  id="frm" action="<%=request.getContextPath()%>/AlldietMenuModify/menuEditProc.jsp">
<input type="hidden" name="UserChangeDay" value="<%=UserChangeDay %>"	/>
<input type="hidden" name="UserChangeTime" value="<%=UserChangeTime %>"	/>
<table border="0" width="600px">

	<tr >
		<td colspan="3" align="right">
		<input type="text" id="searchKeyword" placeholder="메뉴명을 입력하세요" style="width: 100px;"/>
		<input type="button" value="검색"/></td>
	</tr>

	<tr align="left" >
	<td class="bottom" colspan="3" >포인트가 추가로 쌓이는 제휴식당</td>
	</tr>

	<tr align="center">
	<td class="left bottom" rowspan="2" ><img alt="test image" width="150" height="100">
	</td>
	<td><%=resName%></td>
	<td class="right bottom" rowspan="2"><%= bestMenu%></td>
	</tr>
	<tr class="bottom" align="center"><td><%= PartResStarvalue%>
	<br/><br/>선택<input type="checkbox" id="check" name="check" value="partres"/></td></tr>
	
	<tr align="left" >
	<td class="bottom" colspan="3"><%= id%>님과 취향이 비슷한 분들이 선호하는 메뉴</td>
	</tr>

	<tr align="center">
	<td class="left bottom" rowspan="2"><img  alt="test image" width="150" height="100">
	</td>
	<td class="bottom" rowspan="2"><%=menuKeyword2 %>
	<br/><br/>선택<input type="checkbox" id="check" name="check" value="menu"/></td>
	<td class="right"><%=menukeywordBudget %></td>
	</tr>
	<tr class="right bottom" align="center"><td>별점</td></tr>
	
	<tr>
		<td align="right"><input type="submit" value="수정 완료"/></td>
		<td><input type="reset" value="취소"/></td>
	</tr>
</table>
</form>
</center>