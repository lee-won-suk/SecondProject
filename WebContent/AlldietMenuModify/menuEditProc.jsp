<%@page import="com.jin.MenuKeyword.MenuKeywordDAO"%>
<%@page import="java.util.Collections"%>
<%@page import="java.util.List"%>
<%@page import="com.jin.MenuEdit.MenuEditDAO"%>
<%@page import="com.jin.DTO.Memberdb"%>
<%@page import="com.jin.DTO.Userdietdb"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String usrId=(String)session.getAttribute("usrId");

	String menuKeyword2=(String)session.getAttribute("menuKeyword2");
	
	List<String> starLst =(List<String>)session.getAttribute("starLst");
	MenuEditDAO menuEditDao = new MenuEditDAO();	
	String UserChangeDay = request.getParameter("UserChangeDay");
	String UserChangeTime = request.getParameter("UserChangeTime");
	
	String value=request.getParameter("check");

	System.out.println("value값은 : " + value);

	if("partres".contentEquals(value)==true)
	{
		//제휴식당을 선택 했으면 
	
		//2.조건에 맞는 제휴식당 1개 가져오기
		
		
		//UserChangeDay(바꿀 요일) , UserChangeTime(바꿀 시간대)의 메뉴키워드 및 식당값을 지우고 제휴식당으로 변경한다.
		//사용자의 선호 장르이면서 비용/칼로리 범위가 부합하는 식당을 선정
		
		String menuKeyword = (String)session.getAttribute("menuKeyword");
		String resName = (String)session.getAttribute("resName");
		
		MenuKeywordDAO menuKeywordDao=new MenuKeywordDAO();
		List<Integer> menuKeywordlst=menuKeywordDao.getMenuKeywordKcalBud(menuKeyword);	
		int menukeywordKcal=menuKeywordlst.get(0); //메뉴키워드의 칼로리, 예산 받아오기.
		int menukeywordBudget=menuKeywordlst.get(1);		
		menuEditDao.setPartres(menukeywordKcal,menukeywordBudget,menuEditDao.getConn(), resName, menuKeyword, usrId, UserChangeDay, UserChangeTime);
		
		
		
	}
	else if("menu".contentEquals(value)==true)
	{
	
		//2.사용자와 메뉴키워드를 입력해서 식당을3개 뽑는다.
		List<String> resNameLst = menuEditDao.getRes(menuEditDao.getConn(),starLst,menuKeyword2);
		
		//3.데이터를 넣고 수정한다.
		
		MenuKeywordDAO menuKeywordDao=new MenuKeywordDAO();
		List<Integer> menuKeywordlst=menuKeywordDao.getMenuKeywordKcalBud(menuKeyword2);	
		int menukeywordKcal=menuKeywordlst.get(0); //메뉴키워드의 칼로리, 예산 받아오기.
		int menukeywordBudget=menuKeywordlst.get(1);		
		if(resNameLst.size()==0){
			menuEditDao.setPartres(menukeywordKcal,menukeywordBudget,menuEditDao.getConn(), "", menuKeyword2, usrId, UserChangeDay, UserChangeTime);
		} else if(resNameLst.size()==1){
			menuEditDao.setPartres(menukeywordKcal,menukeywordBudget,menuEditDao.getConn(), resNameLst.get(0),"","", menuKeyword2, usrId, UserChangeDay, UserChangeTime);
		} else if(resNameLst.size()==2){
			menuEditDao.setPartres(menukeywordKcal,menukeywordBudget,menuEditDao.getConn(), resNameLst.get(0),resNameLst.get(1),"", menuKeyword2, usrId, UserChangeDay, UserChangeTime);
		} else 
			menuEditDao.setPartres(menukeywordKcal,menukeywordBudget,menuEditDao.getConn(), resNameLst.get(0),resNameLst.get(1),resNameLst.get(2), menuKeyword2, usrId, UserChangeDay, UserChangeTime);
	}
	
	
%>


<jsp:forward page="/main.jsp">
<jsp:param value="AlldietMenuModify" name="currentPage"/>
</jsp:forward>