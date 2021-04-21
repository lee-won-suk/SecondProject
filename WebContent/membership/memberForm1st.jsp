<%@page import="java.util.Random"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	String contextPath = request.getContextPath();
	String path = contextPath + "/main.jsp?currentPage=";
	
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String tel = request.getParameter("tel");
	
	if(id==null)id="";
	if(pw==null)pw="";
	if(tel==null)tel="";
	
	Random rand = new Random();
	int randNum = rand.nextInt(10000);
	String authNum = String.format("%04d", randNum);
	session.setAttribute("authNum", authNum);
	
%>
<script  src='<%=request.getContextPath()%>/js/common.js' type="text/javascript"></script>
<script  src='<%=request.getContextPath()%>/js/memberForm1st.js' type="text/javascript"></script>
<%= session.getAttribute("authNum") %>
<center>
<form id="frm" action="membership/1stProc.jsp" method="post">
	<h2>회원가입</h2>
<table>
	<tr>
		<td colspan="2">아이디</td>
	</tr>
	<tr>
		<td colspan="2"><input type=text id='id' name='id' placeholder='아이디를 입력하세요' style="width: 200px; height: 30px;"/></td>
	</tr>
	<tr>
		<td colspan="2">비밀번호</td>
	</tr>
	<tr>
		<td colspan="2"><input type=password id="pw" name='pw' placeholder='비밀번호를 입력하세요' style="width: 200px; height: 30px;"/></td>
	</tr>
	<tr>
		<td colspan="2">핸드폰 번호</td>
	</tr>
	<tr>
		<td><input type=text id='tel' name='tel' placeholder='핸드폰번호를 입력하세요' style="width: 150px; height: 30px;"/></td>
		<td><input type="button" onclick="chkTel();" value="전송" style="width: 40px; height: 30px;"/></td>
	</tr>
	<tr>
		<td colspan="2">인증번호</td>
	</tr>
	<tr>
		<td colspan="2"><input type=password id='authNum' name='authNum' placeholder='인증번호를 입력하세요' style="width: 200px; height: 30px;"/></td>
	</tr>
	<tr>
		<td colspan="2">
			<input type=button onclick="sendMember();" value='다음' style="width: 200px; height: 30px;"/>
		</td>
	</tr>
</table>
</form>
</center>
