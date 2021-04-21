<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String age = request.getParameter("age");
	

	
	String gender= request.getParameter("gender");
	

	
	String budget = request.getParameter("budget");
	

	
	session.setAttribute("age", age);
	session.setAttribute("gender", gender);
	session.setAttribute("budget", budget);
	
%>
<jsp:forward page="/main.jsp">
<jsp:param value="memberForm4th" name="currentPage"/>
</jsp:forward>