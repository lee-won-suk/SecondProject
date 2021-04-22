<%@page import="com.jin.OneWeekCheck.OneWeekCheckDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//달성도 전부 채우기

String usrid=(String)session.getAttribute("usrId");
OneWeekCheckDAO oneDao=new OneWeekCheckDAO();
oneDao.increaseAllPer(usrid);
%>
<jsp:forward page="/main.jsp">
<jsp:param value="TodaydietMenuProc" name="currentPage"/>
</jsp:forward>