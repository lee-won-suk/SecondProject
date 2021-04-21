<%@page import="com.jin.DTO.Userdietdb"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>

<%

String Time=(String)session.getAttribute("Time");//시간대 추가
//현재 오늘의 식당메뉴 받아오기.
Userdietdb userdietdb=(Userdietdb)session.getAttribute("userdietdb");

String UsrId=(String)session.getAttribute("usrId");//아이디 가져오기

String []Usrdiet=new String[3];
Usrdiet[0]=userdietdb.getResname1();
Usrdiet[1]=userdietdb.getResname2();
Usrdiet[2]=userdietdb.getResname3();

if (Usrdiet.length==0)
	{
	System.out.println("식당 없음");
	return;
	}

%>
<center>
<style>
td {
        margin: 50px;
        padding: 10px;
      }
  table, td {
  border-collapse : collapse;
};    
</style>
<script type="text/javascript" >

function checkOnlyOne(element) {  
	  const checkboxes 
	      = document.getElementsByName("check");
	  
	  checkboxes.forEach((cb) => {
	    cb.checked = false;
	  })
	  
	  element.checked = true;
	}

function ischecked(formid){
	
	  var isChk = false;
	  let form = document.getElementById(formid);
      var checklist = document.getElementsByName("check");
      for(var i=0;i<checklist.length;i++){
          if(checklist[i].checked == true) {
        	  isChk = true;
              break;
          }
      }
  
      if(!isChk){
          alert("선택.");
          return false;
      }
	  form.submit();
}
</script>

<br/>
<form id="form" action="<%=request.getContextPath()%>/StarInput/StarInputProc.jsp" >
<table border="1" width="600px">

	<tr align="center" >
	<td colspan="3" ><%=Time %></td>

	<td    style="border-right: none;border-left: none;"   ><img id="res1" alt="test image" width="50" height="50"     >
	<br/><%=userdietdb.getResname1()%>
	<br/><input name="check" onclick='checkOnlyOne(this)'  value="<%=userdietdb.getResname1()%>" type="checkbox"  />
	</td>

	<td id="res2" onclick="click('res1')"  style="border-right: none;border-left: none;" ><img  alt="test image" width="50" height="50">
	<br/><%=userdietdb.getResname2()%>
	<br/><input name="check"  onclick='checkOnlyOne(this)'  value="<%=userdietdb.getResname2()%>" type="checkbox"/>
	</td>
	
	<td id="res3" onclick="click('res1')"   style="border-right: none;border-left: none;" ><img  alt="test image" width="50" height="50">
	<br/><%=userdietdb.getResname3()%>
	<br/><input name="check"  onclick='checkOnlyOne(this)'  value="<%=userdietdb.getResname3()%>"  type="checkbox"/>
	</td>
	
	</tr>
</table>
<br/><br/><br/><br/>
 <select name = "starvalue"  style="width=200px;"  >
          <option value = "1" selected>1</option>
          <option value = "1.5">1.5</option>
          <option value = "2">2</option>
          <option value = "2.5">2.5</option>
          <option value = "3">3</option>
          <option value = "3.5">3.5</option>
          <option value = "4">4</option>
          <option value = "4.5">4.5</option>
          <option value = "5">5</option>
       </select>
<input type="button" onclick="ischecked('form')" value="별점 선택"/>
</form>
<hr/>
</center>
