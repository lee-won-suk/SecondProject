<%@ page contentType="text/html; charset=UTF-8"%>
<center>
<form id="frm" action="3rdProc.jsp" method="post">
<table>
	<tr>
		<td>연령</td>
		<td>
		<select id="age" name = "age">
          <option name="a" value = "10">10대</option>
          <option name="b" value = "20">20대 </option>
          <option name="c" value = "30">30대</option>
          <option name="d" value = "40">40대</option>
          <option name="e" value = "50">50대</option>
          <option name="f" value = "60">60대</option>
       </select>
       </td>
       <td>성별</td>
       <td>남<input type="radio" name="gender" value="m"/></td>
       <td>여<input type="radio" name="gender" value="f"/></td>
	</tr>
</table>
<br/>
<table>
	<tr><td>한 끼 예산</td>
	<td><input id="budget" name="budget" type="text" placeholder="예산을 입력하세요" style="width: 100%"></td></tr>
	<tr><td><br/></td></tr>
	<tr>
		<td colspan="2" align="center">
			<input type=submit value='다음' style="width: 200px; height: 30px;"/>
		</td>
	</tr>
</table>
</form>
</center>
