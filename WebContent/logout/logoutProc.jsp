<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
session.invalidate();
%>
<jsp:forward page="/main.jsp">
<jsp:param value="loginForm" name="currentPage"/>
</jsp:forward>