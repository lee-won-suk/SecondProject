<%@ page contentType="text/html; charset=UTF-8"%>
<%
	String contextPath =request.getContextPath();
	String path = contextPath +  "/main.jsp?currentPage=";	
%>
<center>
<form id="frm" action="4thProc.jsp" method="post">
<table>
	<tr align="center">
		<td colspan="2">선호하는 음식 장르를 선택해주세요</td>
	</tr>
	<tr align="center">
		<td><img src="<%=contextPath%>/img/korean.jpg" alt="test image" width="50" height="50"><br/>
		한식<input type="checkbox" name="korean" value="Korean"/></td>
		<td><img src="<%=contextPath%>/img/chinese.jpg" alt="test image" width="50" height="50"><br/>
		중식<input type="checkbox" name="chinese" value="chinese"/></td>
	</tr>
	<tr align="center">
		<td><img src="<%=contextPath%>/img/japanese.jpg" alt="test image" width="50" height="50"><br/>
		일식<input type="checkbox" name="japanese" value="japanese"/></td>
		<td><img src="<%=contextPath%>/img/western.jpg" alt="test image" width="50" height="50"><br/>
		양식<input type="checkbox" name="western" value="western"/></td>
	</tr>
	<tr align="center">
		<td><img src="<%=contextPath%>/img/asianfood.png"  alt="test image" width="50" height="50"><br/>
		아시안<input type="checkbox" name="asian" value="asian"/></td>
		<td><img src="<%=contextPath%>/img/bunsik.jpg" alt="test image" width="50" height="50"><br/>
		분식<input type="checkbox" name="bunsik" value="bunsik"/></td>
	</tr>
	<tr align="center">
		<td colspan="2">
			<input type=submit value='회원가입 완료' style="width: 200px; height: 30px;"/>
		</td>
	</tr>
</table>
</form>
</center>
