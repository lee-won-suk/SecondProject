<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.jin.level.LevelDAO"%>
<%@page import="com.jin.DTO.Leveldb"%>
<%@page contentType="text/html; charset=UTF-8"%>
<%@page import="com.jin.DTO.Memberdb"%>
<%@page import="com.jin.Member.MemberDAO"%>
<%
	MemberDAO memberdao=new MemberDAO();

	Memberdb memberdb=new Memberdb();
	
	LevelDAO leveldao = new LevelDAO();
	Leveldb leveldb = new Leveldb();
	//추후 로그인 후 session으로 값을 받아와서 해당 유저정보를 표시
	
	String userId = (String)session.getAttribute("usrId");
	
	memberdb=memberdao.getMemberInfo(userId);
	List<String> lst = memberdao.getId();
	
	int usrlvl = memberdb.getLvl();
	int maxexp = leveldao.getLeveldb(usrlvl);
	
	String [] usrgenre = memberdb.getGenre().split(" ");
	
	String contextPath =request.getContextPath();
	String path = contextPath +  "/main.jsp?currentPage=";
	
	//null 방지..
	String testing = "kingkang";
	//db로 추후 이미지 파일 가져오기
	if(memberdb.getLvl()>=5 && memberdb.getLvl()<10) {
		testing = "tomato";
		out.print("<script>alert('5레벨');</script>");
	}
	else if(memberdb.getLvl()>=10 && memberdb.getLvl()<15) {
		testing = "apple";
		out.print("<script>alert('10레벨');</script>");}
	else if(memberdb.getLvl()>=15 && memberdb.getLvl()<20) {
		testing = "pear";
		out.print("<script>alert('15레벨');</script>");}
	else if(memberdb.getLvl()>=20 && memberdb.getLvl()<25) {
		out.print("<script>alert('20레벨');</script>");
		testing = "shortpumpkin";}
	else if(memberdb.getLvl()>=25 && memberdb.getLvl()<30) {
		out.print("<script>alert('25레벨');</script>");
		testing = "melon";}
	else if(memberdb.getLvl()>=30) {
		out.print("<script>alert('30레벨');</script>");
		testing = "watermelon";}
	
%>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.6/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>
<center>
<style>
td {
        margin: 20px;
        padding: 10px;
      }
</style>
<table>




	<tr>														<!-- 유저레벨 이미지 갖고오기 -->
		<td rowspan="2"><img src="<%=request.getContextPath()%>/img/<%=testing %>.jpg"  alt="test image" width="100px" height="100px"></td>






		<td colspan="2">id  <%=memberdb.getId() %></td>
	</tr>
	<tr>
		<td colspan="2">Lv. <%=memberdb.getLvl() %></td>
	</tr>
	<tr>
		<td colspan="2"><div class="container">현재 경험치
		<div class="progress" style="height:15px" >
				<div class="progress-bar bg-success progress-bar-striped progress-bar-animated">
						<progress style=height:20px;width:250px; value="<%=memberdb.getExp() %>" max="<%=maxexp%>"></progress> 
				</div>
		</div>
		</div>
			</td>
	</tr>
	<tr>
		<td>보유 포인트 <%=memberdb.getPoint() %></td>
		<td><a href="<%=path %>mypage"><svg xmlns="http://www.w3.org/2000/svg" width="30px" height="30px" fill="currentColor" class="bi bi-handbag" viewBox="0 0 16 16">
  <path d="M8 1a2 2 0 0 1 2 2v2H6V3a2 2 0 0 1 2-2zm3 4V3a3 3 0 1 0-6 0v2H3.36a1.5 1.5 0 0 0-1.483 1.277L.85 13.13A2.5 2.5 0 0 0 3.322 16h9.355a2.5 2.5 0 0 0 2.473-2.87l-1.028-6.853A1.5 1.5 0 0 0 12.64 5H11zm-1 1v1.5a.5.5 0 0 0 1 0V6h1.639a.5.5 0 0 1 .494.426l1.028 6.851A1.5 1.5 0 0 1 12.678 15H3.322a1.5 1.5 0 0 1-1.483-1.723l1.028-6.851A.5.5 0 0 1 3.36 6H5v1.5a.5.5 0 1 0 1 0V6h4z"/>
</svg>포인트샵 이동</a></td>
	</tr>
</table>
<table>
	<tr>
		<td colspan="2">선호음식 장르</td>
		<td colspan="2">지역 내 랭킹 Top 3</td>
	</tr>
	<tr>
		<td colspan="2">1. <%=usrgenre[0] %></td>
		<td colspan="2">1위 <%=lst.get(0) %></td>
	</tr>
	<tr>
		<td colspan="2">2. <%=usrgenre[1] %></td>
		<td colspan="2">2위 <%=lst.get(1) %></td>
	</tr>
	<tr>
		<td colspan="2">3. <%=usrgenre[2] %></td>
		<td colspan="2">3위 <%=lst.get(2) %></td>
	</tr> 
	<tr>
		<td colspan="2">칼로리 <%=memberdb.getKcallimit() + "Kcal" %>
		<td colspan="2">예산 <%=memberdb.getBudget() + "원" %>
	</tr>
</table>
<table>
	<tr>
		<td><svg xmlns="http://www.w3.org/2000/svg" width="50px" height="50px" fill="currentColor" class="bi bi-chat-square-fill" viewBox="0 0 16 16">
  <path d="M2 0a2 2 0 0 0-2 2v8a2 2 0 0 0 2 2h2.5a1 1 0 0 1 .8.4l1.9 2.533a1 1 0 0 0 1.6 0l1.9-2.533a1 1 0 0 1 .8-.4H14a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"/>
</svg></td>
		<td><svg xmlns="http://www.w3.org/2000/svg" width="50px" height="50px" fill="currentColor" class="bi bi-chat-square-fill" viewBox="0 0 16 16">
  <path d="M2 0a2 2 0 0 0-2 2v8a2 2 0 0 0 2 2h2.5a1 1 0 0 1 .8.4l1.9 2.533a1 1 0 0 0 1.6 0l1.9-2.533a1 1 0 0 1 .8-.4H14a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"/>
</svg></td>
		<td><svg xmlns="http://www.w3.org/2000/svg" width="50px" height="50px" fill="currentColor" class="bi bi-chat-square-fill" viewBox="0 0 16 16">
  <path d="M2 0a2 2 0 0 0-2 2v8a2 2 0 0 0 2 2h2.5a1 1 0 0 1 .8.4l1.9 2.533a1 1 0 0 0 1.6 0l1.9-2.533a1 1 0 0 1 .8-.4H14a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"/>
</svg></td>
	</tr>
	<tr>
		<td>상품명 <% out.print(" 붉닭볶음탕");%></td>
		<td>상품명 <% out.print(" 문화상품권");%></td>
		<td>상품명 <% out.print(" 음식할인권");%></td>
	</tr>
	<tr>
		<td>가격 <% out.print(" 2,000" + "p"); %></td>
		<td>가격 <% out.print(" 3,000" + "p"); %></td>
		<td>가격 <% out.print(" 5,000" + "p"); %></td>
	</tr>
</table>
<hr/>
</center>
