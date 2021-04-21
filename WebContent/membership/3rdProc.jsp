<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String age = request.getParameter("age");
	
	System.out.println("age : "+ age);
	
	String gender= request.getParameter("gender");
	
	System.out.println("gender : "+ gender);
	
	String budget = request.getParameter("budget");
	
	System.out.println("budget : " + budget);
	
	session.setAttribute("age", age);
	session.setAttribute("gender", gender);
	session.setAttribute("budget", budget);
	
%>
<jsp:forward page="/main.jsp">
<jsp:param value="memberForm4th" name="currentPage"/>
</jsp:forward>