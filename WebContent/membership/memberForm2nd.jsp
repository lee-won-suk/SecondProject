<%@ page contentType="text/html; charset=UTF-8"%>
<%
	String contextPath = request.getContextPath();
	String path = contextPath + "/main.jsp?currentPage=";
%>
<center>
<form id="frm" action="2ndProc.jsp" method="post">
<table>
	<tr>
		<td colspan="7" align="center">식단을 제공받을 요일을 선택하세요</td>
	</tr>
	<tr><td>월</td><td>화</td><td>수</td><td>목</td><td>금</td><td>토</td><td>일</td></tr>
	<tr>
		<td><input type="checkbox" name="mon" value="a" /></td>
		<td><input type="checkbox" name="tue" value="b" /></td>
		<td><input type="checkbox" name="wed" value="c" /></td>
		<td><input type="checkbox" name="thu" value="d" /></td>
		<td><input type="checkbox" name="fri" value="e" /></td>
		<td><input type="checkbox" name="sat" value="f"/></td>
		<td><input type="checkbox" name="sun" value="g"/></td>
	</tr>
	</table>
	<table>
	<tr>
		<td colspan="7" align="center">식단을 제공받을 시간을 선택하세요</td>
	</tr>
	<tr>
		<td align="center">아침</td>
		<td align="center">점심</td>
		<td align="center">저녁</td>
	</tr>
	<tr>
		<td align="center"><input type="checkbox" name="breakfast" value="breakfast"/></td>
		<td align="center"><input type="checkbox" name="lunch" value="lunch" checked/></td>
		<td align="center"><input type="checkbox" name="dinner" value="dinner"/></td>
	</tr>
	<tr>
		<td colspan="7" align="center">
			<input type=submit value='다음' style="width: 200px; height: 30px;"/>
		</td>
	</tr>
</table>
</form>
</center>
