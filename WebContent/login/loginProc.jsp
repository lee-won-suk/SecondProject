<%@page import="java.sql.Connection"%>
<%@page import="com.jin.Login.LoginDAO"%>
<%@page import="com.jin.DTO.Login"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	
	String contextPath =request.getContextPath();
	String usrId = request.getParameter("id");
	String usrPw = request.getParameter("pw");
	Login login = new Login();
	login.setId(request.getParameter("id"));
	login.setPw(request.getParameter("pw"));
	
	LoginDAO loginDao = new LoginDAO();
	Connection conn = loginDao.getConn();
	int result = loginDao.LoginProc(conn, login);
	String pagePath = "loginForm";
	
	
	if(result==1){
		pagePath = "TodaydietMenuProc";
		session.setAttribute("usrId", login.getId());
	}
	else
	{
		System.out.println("loginProc : login Failed");
		pagePath = "loginForm";
	}
%>
<jsp:forward page="/main.jsp">
<jsp:param value="<%=pagePath%>" name="currentPage"/>
</jsp:forward>