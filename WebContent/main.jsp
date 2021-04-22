<!-- index.jsp -->
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/common/header.jspf" %>
<%
	String currentPage = request.getParameter("currentPage");
	String pageName ="/login/loginForm.jsp";
	if(currentPage==null)
		pageName = "/login/loginForm.jsp";
	else if("TodaydietMenu".contentEquals(currentPage))
		pageName = "/TodaydietMenu/TodaydietMenu.jsp";
	else if("mypage".contentEquals(currentPage))
		pageName = "/form/mypage.jsp";
	else if("profile".contentEquals(currentPage))
		pageName = "/form/profile.jsp";
	else if("AlldietMenu".contentEquals(currentPage))
		pageName = "/AlldietMenu/AlldietMenu.jsp";
	
	else if("ThreeDetailMenu".contentEquals(currentPage))
		pageName = "/ThreeDetailMenu/ThreeDetailMenu.jsp";
	else if("StarInput".contentEquals(currentPage))
		pageName = "/StarInput/StarInput.jsp";
	
	else if("StarInputProc".contentEquals(currentPage))
		pageName = "/StarInput/StarInputProc.jsp";

	
	
	else if("AlldietMenuModify".contentEquals(currentPage))
		pageName = "/AlldietMenuModify/AlldietMenuModify.jsp";
	
	else if("loginForm".contentEquals(currentPage))
		pageName = "/login/loginForm.jsp";
	
	else if("memberForm1st".contentEquals(currentPage))
		pageName = "/membership/memberForm1st.jsp";
	else if("memberForm2nd".contentEquals(currentPage))
		pageName = "/membership/memberForm2nd.jsp";
	else if("memberForm3rd".contentEquals(currentPage))
		pageName = "/membership/memberForm3rd.jsp";
	else if("memberForm4th".contentEquals(currentPage))
		pageName = "/membership/memberForm4th.jsp";
	
	else if("menuEditForm".contentEquals(currentPage))
		pageName = "/AlldietMenuModify/menuEditForm.jsp";
	
	else if("FirstAuthProc".contentEquals(currentPage))
		pageName = "/FirstAuthProc/FirstAuthProc.jsp";
	else if("WeeklydietModProc".contentEquals(currentPage))
		pageName = "/WeeklydietModProc/WeeklydietModProc.jsp";
	else if("AlloneweekProc".contentEquals(currentPage))
		pageName = "/TodaydietMenu/AlloneweekProc.jsp";	
	else if("TodaydietMenuProc".contentEquals(currentPage))
		pageName = "/TodaydietMenu/TodaydietMenuProc.jsp";
%>
<link href="https://fonts.googleapis.com/css2?family=Yeon+Sung&display=swap" rel="stylesheet">
<html>
<body>
 <style type="text/css">
table {font-family: 'Yeon Sung', cursive;}
a {font-family: 'Yeon Sung', cursive;}
</style>
<div align="center">
<table style="width:600px; border:1px solid black;" >
<tr>
	<td style="height:100px;"><%@ include file="/common/head.jsp" %><hr/></td>
</tr>
<tr>
	<td style="height:400px;">
		<jsp:include page="<%=pageName%>"/>
	</td>
</tr>
<tr>
<% if ( (String)session.getAttribute("usrId")!=null )
{
%>
	<td style="height:50px;"><%@ include file="/common/footer.jsp" %></td>
	<%} %>
</tr>
</table>
</div>
</body>
</html>