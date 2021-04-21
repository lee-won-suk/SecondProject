<%@ page contentType="text/html; charset=UTF-8"%>
<%
	String contextPath = request.getContextPath();
	String path = contextPath + "/main.jsp?currentPage=";
%>

<script src='<%=contextPath%>/js/common.js' type="text/javascript"></script>
<script src='<%=contextPath%>/js/loginForm.js' type="text/javascript"></script>

<center>
<form id="frm" action="<%=contextPath%>/login/loginProc.jsp" method="post">
<input type="hidden" name="currentPage" value="loginForm"/>
	<h2>로그인</h2>
<table>
	<tr>
		<td>아이디</td>
	</tr>
	<tr>
		<td><input type=text id="id" name='id' placeholder='아이디를 입력하세요' style="width: 200px; height: 30px;"/></td>
	</tr>
	<tr>
		<td>비밀번호</td>
	</tr>
	<tr>
		<td ><input type=password id="pw" name='pw' placeholder='비밀번호를 입력하세요' style="width: 200px; height: 30px;"/></td>
	</tr>
	<tr>
		<td align="right">아이디 찾기 | 비밀번호 찾기</td>
	</tr>
	<tr>
		<td colspan=2 align='center'>
			<input type=button onclick="checkEmpty();" value='로그인' style="width: 200px; height: 30px;"/>
		</td>
	</tr>
		<tr>
		<td colspan=2 align='center'>
			<input type=button onclick="location='<%=path%>memberForm1st'" value='회원가입' style="width: 200px; height: 30px;"/>
		</td>
	</tr>
</table>
</form>
</center>
