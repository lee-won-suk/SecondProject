<%@page import="com.jin.DTO.Leveldb"%>
<%@page import="com.jin.DTO.Memberdb"%>
<%@page import="com.jin.Member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%

	String contextPath =request.getContextPath();
	String path = contextPath +  "/main.jsp?currentPage=";

%>
 
<jsp:forward page="/main.jsp">
<jsp:param value="profile" name="currentPage"/>
</jsp:forward>

