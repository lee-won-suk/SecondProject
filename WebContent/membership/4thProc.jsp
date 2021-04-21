<%@page import="com.jin.DTO.JoinMember"%>
<%@page import="com.jin.Membership.JoinMemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String korean = request.getParameter("korean");
	String chinese = request.getParameter("chinese");
	String japanese = request.getParameter("japanese");
	String western = request.getParameter("western");
	String asian = request.getParameter("asian");
	String bunsik = request.getParameter("bunsik");
	
	JoinMemberDAO joinMemberDao = new JoinMemberDAO();
	
	String genre = korean + " " + chinese + " " + japanese + " " + western + " " + asian + " " + bunsik ;
	genre = genre.replaceAll("null", "");
	genre=genre.trim();

	
	String id = (String)session.getAttribute("joinId");
	String pw = (String)session.getAttribute("joinPw");
	String tel = (String)session.getAttribute("tel");
	String days = (String)session.getAttribute("days");
	String time = (String)session.getAttribute("time");
	String age = (String)session.getAttribute("age");
	String gender = (String)session.getAttribute("gender");
	String budget = (String)session.getAttribute("budget");
	
	
	
	
	int intTel=0;
	int intAge=0;
	int intBudget=0;
	try{
		 intTel = Integer.parseInt(tel);
		intAge = Integer.parseInt(age);
		intBudget = Integer.parseInt(budget);
	}
	catch(Exception e) {e.printStackTrace();}

	System.out.println("예산은 : "+intBudget);
	
	int malekcallimit = 2600;
	int femalekcallimit = 2100;
	
	if(gender=="m"){
		if(intAge<50&&intAge>=30){
			malekcallimit = 2400;
		}else malekcallimit = 2200;
	}
	else if(gender=="f"){
		if(intAge<30){
			femalekcallimit = 1900;
		}else femalekcallimit = 1800;
	}
	
	if(gender.contentEquals("m")){
		joinMemberDao.Insert(joinMemberDao.getConn(), id, pw, intTel, days, time, intAge, gender, intBudget, malekcallimit, genre);
	}
	else if(gender.contentEquals("f")){
		joinMemberDao.Insert(joinMemberDao.getConn(), id, pw, intTel, days, time, intAge, gender, intBudget, femalekcallimit, genre);
	}

	session.setAttribute("usrId", id);
%>
<jsp:forward page="../FirstAuthProc/FirstAuthProc.jsp">
<jsp:param value="" name=""/>
</jsp:forward>


