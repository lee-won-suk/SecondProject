<%@page import="com.jin.Star.UserStarDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.jin.DTO.Resinfodb"%>
<%@page import="com.jin.Resinfodb.ResinfoDAO"%>
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
	

	String resname1=request.getParameter("resname1");//클릭한 메뉴키워드의 사용자식당 
	String resname2=request.getParameter("resname2");//클릭한 메뉴키워드의 사용자식당 
	String resname3=request.getParameter("resname3");//클릭한 메뉴키워드의 사용자식당 

	ResinfoDAO resinfoDao=new ResinfoDAO();
	List<Resinfodb> ClickResinfo=new ArrayList<Resinfodb>();
	ClickResinfo.add ( resinfoDao.getUsrresInfo(resname1) );
	ClickResinfo.add ( resinfoDao.getUsrresInfo(resname2) );
	ClickResinfo.add ( resinfoDao.getUsrresInfo(resname3) );
	
	
	
	
	//현재 로그인 된 유저의 정보 가져오기.
	Memberdb memberdb=(Memberdb)session.getAttribute("memberdb");	
	String UsrId=memberdb.getId();
	/*
	현재 로그인 된 유저의 일주일 식단 정보 가져오기.  
	Userdietdb userdietdb=new Userdietdb();
	UserdietMenuDAO usrdiet=new UserdietMenuDAO();
	List<Userdietdb> lst=usrdiet.getDietmenuInfo(UsrId);
	*/
	
	
	//나와 성별과 연령대가 맞는 사용자 받아오기.
	UserStarDAO usrStarDao=new UserStarDAO();
	List<String>starLst=usrStarDao.getSameUsrInfo(memberdb.getGender(),memberdb.getAge(),UsrId);
	
	float [] starvalue=new float [3];
	//클릭한 메뉴의  식당 3개에 대한 평균별점 가져오기.
	 starvalue[0] = usrStarDao.getResStarInfo(UsrId,resname1, starLst);
	 starvalue[1] = usrStarDao.getResStarInfo(UsrId,resname2, starLst);
	 starvalue[2] = usrStarDao.getResStarInfo(UsrId,resname3, starLst);



	
	
	
	
	
	
	request.setAttribute("resname1", resname1);
	request.setAttribute("resname2", resname2);
	request.setAttribute("resname3", resname3);
	request.setAttribute("ClickResinfo", ClickResinfo);
	request.setAttribute("starvalue", starvalue);
	%>
 
<jsp:forward page="/main.jsp">
<jsp:param value="ThreeDetailMenu" name="currentPage"/>
</jsp:forward>

