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
	/*현재 로그인 된 유저의 정보 가져오기.  */
	Memberdb memberdb=(Memberdb)session.getAttribute("memberdb");	
	String UsrId=memberdb.getId();
	
	
	/*현재 로그인 된 유저의 일주일 식단 정보 가져오기.  */
	Userdietdb userdietdb=new Userdietdb();
	UserdietMenuDAO usrdiet=new UserdietMenuDAO();
	//List<Userdietdb> lst=usrdiet.getDietmenuInfo(UsrId);
	
	
	List<Userdietdb> morninglst=usrdiet.getDietmenuInfo(UsrId,"morning");
	List<Userdietdb> lunchlst=usrdiet.getDietmenuInfo(UsrId,"lunch");
	List<Userdietdb> dinnerlst=usrdiet.getDietmenuInfo(UsrId,"dinner");
	
	//session.setAttribute("lst",lst);
	session.setAttribute("morninglst",morninglst);
	session.setAttribute("lunchlst",lunchlst);
	session.setAttribute("dinnerlst",dinnerlst);
%>

<jsp:forward page="/main.jsp">
<jsp:param value="AlldietMenu" name="currentPage"/>
</jsp:forward>