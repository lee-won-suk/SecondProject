<%@page import="com.jin.DTO.Memberdb"%>
<%@page import="com.jin.DTO.Resinfodb"%>
<%@page import="java.util.List"%>
<%@page import="com.jin.DTO.Userdietdb"%>
<%@page import="com.jin.Member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
String Time=(String)session.getAttribute("Time");//시간대 추가
String DayofWeek=(String)session.getAttribute("DayofWeek");//오늘요일 추가

Userdietdb userdietdb=(Userdietdb)session.getAttribute("userdietdb");

String []Userday=(String[])session.getAttribute("Userday");
int UserdaySize=Userday.length;


List<Integer> UserOneWeekcheck=(List<Integer>)session.getAttribute("UserOneWeekcheck");
Memberdb memberdb=(Memberdb)session.getAttribute("memberdb");

String [] UserTime=memberdb.getUsertime().split(" ");//사용자 시간대 받아와서 처리

//식당의 대표메뉴 가져오기.
List<Resinfodb> TodayResinfo=(List<Resinfodb>)session.getAttribute("TodayResinfo");


float [] starvalue=(float [])request.getAttribute("starvalue");//평균 별점 배열 전달	







%>
<center>
<style>
td {
        margin: 50px;
        padding: 10px;
         border-collapse : collapse;
      }
   
.true{
background-color: red;
}

</style>
<script type="text/javascript">
function getRes(resname)
{
	  window.location.href='<%=request.getContextPath()%>'+"/MapProc/MapProc.jsp?resname="+resname; 
}



</script>


<a href="<%=request.getContextPath()%>/main.jsp?currentPage=StarInput" >[별점 입력]</a>
&nbsp<a href="<%=request.getContextPath()%>/WeeklydietModProc/WeeklydietModProc.jsp">[일주일식단 로테이션]</a><br/>
<!--  
<a href="<%=request.getContextPath()%>/FirstAuthProc/FirstAuthProc.jsp" >[초기식단 버튼 아이디:f1234고정(테스트용)]</a><br/>
<a href="<%=request.getContextPath()%>/main.jsp?currentPage=StarInput" >[별점 입력 버튼(테스트용)]</a>
&nbsp<a href="<%=request.getContextPath()%>/WeeklydietModProc/WeeklydietModProc.jsp">[일주일식단 변경버튼 아이디 :f1234일단고정(테스트)]</a><br/>
-->

<table  width="600px" >
<tr align="center" >
	<%for (int a=0; a<UserdaySize; a++)  
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
</table>




<table class="OneWeekFill"  width="600px" border="1">
<tr align="center" >

<%
for( int item : UserOneWeekcheck){
if( item>= UserTime.length/*사용자가 선택한 시간대의 개수 넣기.*/){	
%>
		<td class="true"></td>
		<%} %> 
<% if(item==0){ %>		
		<td ></td>
		<%} }%>

	</tr>	
</table>

<br/>
<form>
<table border="1" width="600px">

	
	
	<tr align="center" >
		<td  style="border-right: none;" ><%=DayofWeek %></td>
		<td  style="border-left: none;" ><%=Time %></td>		
	</tr>	
	
	<tr align="center" >
	<td style="border-right: none;" >
	<img src="<%=request.getContextPath()%>/img/<%=userdietdb.getMenukeyword()%>.jpg"  alt="test image" width="100px" height="100px"></td>
	<td  style="border-left: none;">
	<br/><%=userdietdb.getMenukeyword()%>
	<br/>칼로리:<%=userdietdb.getMenukeywordkcal()%>
	<br/>
	<a href="<%=request.getContextPath()%>/LikeCheck/LikeCheckProc.jsp?value=good&menukeyword=<%=userdietdb.getMenukeyword()%>">
	<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-hand-thumbs-up" viewBox="0 0 16 16">
  <path d="M8.864.046C7.908-.193 7.02.53 6.956 1.466c-.072 1.051-.23 2.016-.428 2.59-.125.36-.479 1.013-1.04 1.639-.557.623-1.282 1.178-2.131 1.41C2.685 7.288 2 7.87 2 8.72v4.001c0 .845.682 1.464 1.448 1.545 1.07.114 1.564.415 2.068.723l.048.03c.272.165.578.348.97.484.397.136.861.217 1.466.217h3.5c.937 0 1.599-.477 1.934-1.064a1.86 1.86 0 0 0 .254-.912c0-.152-.023-.312-.077-.464.201-.263.38-.578.488-.901.11-.33.172-.762.004-1.149.069-.13.12-.269.159-.403.077-.27.113-.568.113-.857 0-.288-.036-.585-.113-.856a2.144 2.144 0 0 0-.138-.362 1.9 1.9 0 0 0 .234-1.734c-.206-.592-.682-1.1-1.2-1.272-.847-.282-1.803-.276-2.516-.211a9.84 9.84 0 0 0-.443.05 9.365 9.365 0 0 0-.062-4.509A1.38 1.38 0 0 0 9.125.111L8.864.046zM11.5 14.721H8c-.51 0-.863-.069-1.14-.164-.281-.097-.506-.228-.776-.393l-.04-.024c-.555-.339-1.198-.731-2.49-.868-.333-.036-.554-.29-.554-.55V8.72c0-.254.226-.543.62-.65 1.095-.3 1.977-.996 2.614-1.708.635-.71 1.064-1.475 1.238-1.978.243-.7.407-1.768.482-2.85.025-.362.36-.594.667-.518l.262.066c.16.04.258.143.288.255a8.34 8.34 0 0 1-.145 4.725.5.5 0 0 0 .595.644l.003-.001.014-.003.058-.014a8.908 8.908 0 0 1 1.036-.157c.663-.06 1.457-.054 2.11.164.175.058.45.3.57.65.107.308.087.67-.266 1.022l-.353.353.353.354c.043.043.105.141.154.315.048.167.075.37.075.581 0 .212-.027.414-.075.582-.05.174-.111.272-.154.315l-.353.353.353.354c.047.047.109.177.005.488a2.224 2.224 0 0 1-.505.805l-.353.353.353.354c.006.005.041.05.041.17a.866.866 0 0 1-.121.416c-.165.288-.503.56-1.066.56z"/>
	</svg></a>
	&nbsp
	<a href="<%=request.getContextPath()%>/LikeCheck/LikeCheckProc.jsp?value=bad&menukeyword=<%=userdietdb.getMenukeyword()%>"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-hand-thumbs-down-fill" viewBox="0 0 16 16">
  <path d="M6.956 14.534c.065.936.952 1.659 1.908 1.42l.261-.065a1.378 1.378 0 0 0 1.012-.965c.22-.816.533-2.512.062-4.51.136.02.285.037.443.051.713.065 1.669.071 2.516-.211.518-.173.994-.68 1.2-1.272a1.896 1.896 0 0 0-.234-1.734c.058-.118.103-.242.138-.362.077-.27.113-.568.113-.856 0-.29-.036-.586-.113-.857a2.094 2.094 0 0 0-.16-.403c.169-.387.107-.82-.003-1.149a3.162 3.162 0 0 0-.488-.9c.054-.153.076-.313.076-.465a1.86 1.86 0 0 0-.253-.912C13.1.757 12.437.28 11.5.28H8c-.605 0-1.07.08-1.466.217a4.823 4.823 0 0 0-.97.485l-.048.029c-.504.308-.999.61-2.068.723C2.682 1.815 2 2.434 2 3.279v4c0 .851.685 1.433 1.357 1.616.849.232 1.574.787 2.132 1.41.56.626.914 1.28 1.039 1.638.199.575.356 1.54.428 2.591z"/>
</svg></a>
	</td>
	
	</tr>
	
	
	
	
	<tr>
	<td colspan="2"></td>
	</tr>
	<tr align="center" >
	<td style="border-right: none;" ><img src="<%=request.getContextPath()%>/img/crazy.png" alt="test image" width="100px" height="100px"></td>
	<td  style="border-left: none;">
	<br/><%=userdietdb.getResname1()%>
	<br/>메뉴이름:<%= TodayResinfo.get(0).getMenuname() %>
	<br/>별점 : <%=starvalue[0]%><br/>
	<button type="button" onclick="location.href='https://map.kakao.com'">길찾기</button>
	</td>
	</tr>
	
	<tr align="center" >
	<td style="border-right: none;"><img src="<%=request.getContextPath()%>/img/hyunsun.png" alt="test image" width="100px" height="100px"></td>
	<td  style="border-left: none;">
	<br/><%=userdietdb.getResname2()%>
	<br/>메뉴이름:<%=TodayResinfo.get(1).getMenuname() %>
	<br/>별점 : <%=starvalue[1]%><br/>
	<input id="res2" type="button" onclick="getRes('<%=userdietdb.getResname2()%>')"   value="길찾기"  />
	</td>
	</tr>
	
	<tr align="center" >
	<td style="border-right: none;" ><img src="<%=request.getContextPath()%>/img/yeopgi.png" alt="test image" width="100px" height="100px"></td>
	<td  style="border-left: none;">
	<br/><%=userdietdb.getResname3()%>
	<br/>메뉴이름:<%=TodayResinfo.get(2).getMenuname() %>
	<br/>별점 : <%=starvalue[2]%><br/>
	<input id="res3" type="button"  onclick="getRes('<%=userdietdb.getResname3()%>')"  value="길찾기"  />
	</td>
	
	</tr>
	
	
	
</table>
</form>
<hr/>
</center>
