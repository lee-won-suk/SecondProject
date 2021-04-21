<%@page import="com.jin.Member.MemberDAO"%>
<%@page import="com.jin.DTO.Memberdb"%>
<%@page import="com.jin.pointshop.PointshopDAO"%>
<%@page import="com.jin.DTO.priceInfodb"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	Memberdb memberdb = new Memberdb();
	MemberDAO memberdao = new MemberDAO();
	PointshopDAO psDAO = new PointshopDAO();
	String userId = (String)session.getAttribute("usrId");
	
	memberdb=memberdao.getMemberInfo(userId);
	
	String contextPath =request.getContextPath();
	String path = contextPath +  "/main.jsp?currentPage=";
	
	List<String> lst = psDAO.priceInfo();
	System.out.println(lst);
%>
<!DOCTYPE HTML>
<html>
<head>
<style type="text/css">
td {
        margin: 20px;
        padding: 10px;
      }
</style>
</head>

<body>
<center>
	<table>
		<tr>
			<td colspan="2"><svg width="150px" height="150px" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-basket2" viewBox="0 0 16 16">
  <path d="M4 10a1 1 0 0 1 2 0v2a1 1 0 0 1-2 0v-2zm3 0a1 1 0 0 1 2 0v2a1 1 0 0 1-2 0v-2zm3 0a1 1 0 1 1 2 0v2a1 1 0 0 1-2 0v-2z"/>
  <path d="M5.757 1.071a.5.5 0 0 1 .172.686L3.383 6h9.234L10.07 1.757a.5.5 0 1 1 .858-.514L13.783 6H15.5a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-.623l-1.844 6.456a.75.75 0 0 1-.722.544H3.69a.75.75 0 0 1-.722-.544L1.123 8H.5a.5.5 0 0 1-.5-.5v-1A.5.5 0 0 1 .5 6h1.717L5.07 1.243a.5.5 0 0 1 .686-.172zM2.163 8l1.714 6h8.246l1.714-6H2.163z"/>
</svg></td>
			<td colspan="2"><svg width="150px" height="150px" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-basket2" viewBox="0 0 16 16">
  <path d="M4 10a1 1 0 0 1 2 0v2a1 1 0 0 1-2 0v-2zm3 0a1 1 0 0 1 2 0v2a1 1 0 0 1-2 0v-2zm3 0a1 1 0 1 1 2 0v2a1 1 0 0 1-2 0v-2z"/>
  <path d="M5.757 1.071a.5.5 0 0 1 .172.686L3.383 6h9.234L10.07 1.757a.5.5 0 1 1 .858-.514L13.783 6H15.5a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-.623l-1.844 6.456a.75.75 0 0 1-.722.544H3.69a.75.75 0 0 1-.722-.544L1.123 8H.5a.5.5 0 0 1-.5-.5v-1A.5.5 0 0 1 .5 6h1.717L5.07 1.243a.5.5 0 0 1 .686-.172zM2.163 8l1.714 6h8.246l1.714-6H2.163z"/>
</svg></td>
		<tr>
			<td><%out.print("상품명"); %></td>
			<td> <%=lst.get(0) %> </td>
			<td><%out.print("상품명"); %></td>
			<td> <%=lst.get(2) %> </td>
		</tr>
		<tr>
			<td>가격</td>
			<td> <%=lst.get(1) %> p</td>
			<td>가격</td>
			<td> <%=lst.get(3) %> p</td>
		</tr>
	</table>
	<table>
		<tr>
			<td colspan="2"><img src="<%=request.getContextPath()%>/img/foodDC.png" width="150px" height="150px" onclick="confirm('구매하시겠습니까?')"/></td>
			<td colspan="2"><svg width="150px" height="150px" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-basket2" viewBox="0 0 16 16">
  <path d="M4 10a1 1 0 0 1 2 0v2a1 1 0 0 1-2 0v-2zm3 0a1 1 0 0 1 2 0v2a1 1 0 0 1-2 0v-2zm3 0a1 1 0 1 1 2 0v2a1 1 0 0 1-2 0v-2z"/>
  <path d="M5.757 1.071a.5.5 0 0 1 .172.686L3.383 6h9.234L10.07 1.757a.5.5 0 1 1 .858-.514L13.783 6H15.5a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-.623l-1.844 6.456a.75.75 0 0 1-.722.544H3.69a.75.75 0 0 1-.722-.544L1.123 8H.5a.5.5 0 0 1-.5-.5v-1A.5.5 0 0 1 .5 6h1.717L5.07 1.243a.5.5 0 0 1 .686-.172zM2.163 8l1.714 6h8.246l1.714-6H2.163z"/>
</svg></td>
		</tr>
		<tr>
			<td><%out.print("상품명"); %></td>
			<td> <%=lst.get(4) %> </td>
			<td><%out.print("상품명"); %></td>
			<td> <%=lst.get(6) %> </td>
		</tr>
		<tr>
			<td>가격</td>
			<td> <%=lst.get(5) %> p</td>
			<td>가격</td>
			<td> <%=lst.get(7) %> p</td>
		</tr>
	</table>

	<table>
	<hr align="center"/>
		<td>보유포인트</td>
		<td><%=memberdb.getPoint() %>p</td>
	</table>
	
</body>
</center>
</html>