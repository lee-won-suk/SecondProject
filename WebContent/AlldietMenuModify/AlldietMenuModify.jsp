<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.jin.DTO.Userdietdb"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>

<%
	String contextPath =request.getContextPath();
	String path = contextPath +  "/main.jsp?currentPage=";	
	
	List<Userdietdb> lst=(List<Userdietdb>)session.getAttribute("lst");

	//시간대 별로 분류하기.
		List<Userdietdb> morninglst=(List<Userdietdb>)session.getAttribute("morninglst");
		List<Userdietdb> lunchlst=(List<Userdietdb>)session.getAttribute("lunchlst");
		List<Userdietdb> dinnerlst=(List<Userdietdb>)session.getAttribute("dinnerlst");
		
	String [] Userday=(String [])session.getAttribute("Userday");
	
	
%>
<!--  <script type="text/javascript">
function submit2(){
	var form=document.getElementById("frm");
  	var obj_length = document.getElementsByName("lunchEdit").length;
     
    for (var i=0; i<obj_length; i++) {
        if (document.getElementsByName("lunchEdit")[i].checked == true) {
        var item = document.getElementsByName("lunchEdit")[i].value;
        }
    }
    
    sessionStorage.setItem("lunchEdit",'a');
   
    form.submit();
}
</script>
-->
<center>
<form id="frm" action="<%=contextPath%>/main.jsp" method="post">
<input type="hidden" value="menuEditForm" name="currentPage" />
<table border="1" width="600px"     >
	<tr align="center" >
	<td >시간대</td>
	<%for (int a=0; a<Userday.length; a++)  
	{
	%>
	<%if("a".contentEquals(Userday[a])==true){%>
	<td >월</td>
	<%}%>
	<%if("b".contentEquals(Userday[a])==true){%>
	<td >화</td>
	<%}%>
	<%if("c".contentEquals(Userday[a])==true){%>
	<td >수</td>
	<%}%>
	<%if("d".contentEquals(Userday[a])==true){%>
	<td >목</td>
	<%}%>
	<%if("e".contentEquals(Userday[a])==true){%>
	<td >금</td>
	<%}%>
	<%if("f".contentEquals(Userday[a])==true){%>
	<td >토</td>
	<%}%>
	<%if("g".contentEquals(Userday[a])==true){%>
	<td >일</td>
	<%}%>	
	<%}%>
	</tr>	
	
	<tr align="center" >
	
	<%if(morninglst.size()!=0){ %>
	<td>아침</td>
	<%} %>
	<%
	for( Userdietdb item : morninglst)
	{
	%>
	<td ><a >
	<img src="<%=contextPath%>/img/<%=item.getMenukeyword()%>.jpg" alt="test image" width="50" height="50">
	<br/><%=item.getMenukeyword()%><br/>예산:<%=item.getMenukeywordbudget()%>
	<br/>칼로리:<%=item.getMenukeywordkcal()%></a></td>
	<%} %>
	</tr>
	
	<tr align="center" >
	<%if(lunchlst.size()!=0){ %>
	<td>점심</td>
	<%} %>
	<%
	for( Userdietdb item : lunchlst)
	{
	%>
	<td >
	<img src="<%=contextPath%>/img/<%=item.getMenukeyword()%>.jpg" alt="test image" width="50" height="50">
	<br/><%=item.getMenukeyword()%><br/>예산:<%=item.getMenukeywordbudget()%>
	<br/>칼로리:<%=item.getMenukeywordkcal()%><br/>
	<input type="checkbox" id="lunchEdit" name="lunchEdit" value="<%=item.getDay()%> <%=item.getTime()%>"/></td>
	<%} %>
	</tr>
	
	<tr align="center" >
	
	<%if(dinnerlst.size()!=0){ %>
	<td>저녁</td>
	<%} %>
	
	<%
	for( Userdietdb item : dinnerlst)
	{
	%>
	<td ><a >
	<img src="<%=contextPath%>/img/<%=item.getMenukeyword()%>.jpg" alt="test image" width="50" height="50">
	<br/><%=item.getMenukeyword()%><br/>예산:<%=item.getMenukeywordbudget()%>
	<br/>칼로리:<%=item.getMenukeywordkcal()%></a></td>
	<%} %>
	</tr>
	
</table>
	<br/><br/><br/>
	<input  type="submit" value="식단 수정"/>	
</form>
<hr/>
</center>
