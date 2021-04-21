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
			<td colspan="2"><img src="<%=request.getContextPath()%>/img/coffee.png" width="150px" height="150px" onclick="confirm('구매하시겠습니까?')"/></td>
			<td colspan="2"><img src="<%=request.getContextPath()%>/img/love3000.png" width="150px" height="150px" onclick="confirm('구매하시겠습니까?')"/></td>
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
			<td colspan="2"><img src="<%=request.getContextPath()%>/img/cake.png" width="150px" height="150px" onclick="confirm('구매하시겠습니까?')"/></td>
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