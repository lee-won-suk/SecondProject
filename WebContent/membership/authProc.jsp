<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Random rand = new Random();
	int randNum = rand.nextInt(10000);
	String authNum = String.format("%04d", randNum);
	session.setAttribute("authNum", authNum);
%>
<jsp:forward page="/main.jsp">
<jsp:param value="memberForm1st" name="currentPage"/>
</jsp:forward>