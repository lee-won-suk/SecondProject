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
	
	session.setAttribute("joinId", id);
	session.setAttribute("joinPw", pw);
	session.setAttribute("tel", tel);

	System.out.println(id);
	System.out.println(pw);
	System.out.println(tel);

%>
<jsp:forward page="/main.jsp">
<jsp:param value="<%= pagePath%>" name="currentPage"/>
</jsp:forward>