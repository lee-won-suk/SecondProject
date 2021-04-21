<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	
	String sessionAuthNum = (String)session.getAttribute("authNum");
	String authNum = request.getParameter("authNum");
	
	String pagePath = "memberForm1st";
	if(sessionAuthNum.contentEquals(authNum))
		pagePath = "memberForm2nd";
	
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String tel = request.getParameter("tel");

	if(tel=="")tel="00000000000";
	System.out.println("tel은 : "+tel);
	session.setAttribute("joinId", id);
	session.setAttribute("joinPw", pw);
	session.setAttribute("tel", tel);



%>
<jsp:forward page="/main.jsp">
<jsp:param value="<%= pagePath%>" name="currentPage"/>
</jsp:forward>