<%@page import="com.jin.DTO.Resinfodb"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
String resname1=(String)request.getAttribute("resname1");//클릭한 메뉴키워드 
String resname2=(String)request.getAttribute("resname2");//클릭한 메뉴키워드 
String resname3=(String)request.getAttribute("resname3");//클릭한 메뉴키워드

String DayofWeek=(String)session.getAttribute("DayofWeek");//요일 추가

List<Resinfodb> ClickResinfo=(List<Resinfodb>)request.getAttribute("ClickResinfo");//클릭한 식당의 정보들 리스트


//클릭한 메뉴키워드의 식당에 대한 평균별점
float [] starvalue=(float [])request.getAttribute("starvalue");

%>
<center>
<style>
td {
        margin: 50px;
        padding: 10px;
      }
</style>
<form>
<table border="1" width="600px"     >
	<tr align="center" >
		<td colspan="2"><%=DayofWeek %></td>
	</tr>	
	
	<tr align="center" >
	<td style="border-right: none;" ><img src="<%=request.getContextPath()%>/img/crazy.png" alt="test image" width="50" height="50"></td>
	<td  style="border-left: none;">
	<br/><%=resname1%>
	<br/>메뉴이름:<%= ClickResinfo.get(0).getMenuname()%>
	<br/>별점 : <%=starvalue[0]%></td>
	</tr>
	
	<tr align="center" >
	<td style="border-right: none;" ><img src="<%=request.getContextPath()%>/img/hyunsun.png" alt="test image" width="50" height="50"></td>
	<td  style="border-left: none;">
	<br/><%=resname2%>
	<br/>메뉴이름:<%= ClickResinfo.get(1).getMenuname()%>
	<br/>별점 : <%=starvalue[1]%></td>
	</tr>
	
	<tr align="center" >
	<td style="border-right: none;" ><img src="<%=request.getContextPath()%>/img/yeopgi.png" alt="test image" width="50" height="50"></td>
	<td  style="border-left: none;">
	<br/><%=resname3%>
	<br/>메뉴이름:<%= ClickResinfo.get(2).getMenuname()%>
	<br/>별점 : <%=starvalue[2]%></td>
	</tr>
	
	
	
</table>
</form>
<hr/>
</center>
