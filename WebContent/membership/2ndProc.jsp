<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String mon = request.getParameter("mon"); 
	String tue = request.getParameter("tue"); 
	String wed = request.getParameter("wed"); 
	String thu = request.getParameter("thu"); 
	String fri = request.getParameter("fri"); 
	String sat = request.getParameter("sat"); 
	String sun = request.getParameter("sun"); 
	
	String days = mon+ " " + tue+ " " + wed+ " " + thu+ " " + fri+ " " + sat+ " " + sun ;
	days = days.replaceAll("null", "");
	days=days.trim();
	//String [] Userday=days.split(" ");
	//for( String item : Userday)
	//System.out.println("사용자 요일은 : "+item);
	
	//null값이 아니라면 session.setattribute
	session.setAttribute("days", days);
	
	String breakfast = request.getParameter("breakfast"); 
	String lunch = request.getParameter("lunch"); 
	String dinner = request.getParameter("dinner"); 
	
	String time = breakfast + " " + lunch + " " + dinner + " ";
	time = time.replaceAll("null", "");
	time=time.trim();
	session.setAttribute("time", time);
%>
<jsp:forward page="/main.jsp">
<jsp:param value="memberForm3rd" name="currentPage"/>
</jsp:forward>