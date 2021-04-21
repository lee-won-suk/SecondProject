<head>
<!-- You can use Open Graph tags to customize link previews.
Learn more: https://developers.facebook.com/docs/sharing/webmasters -->
<meta property="og:url"           content="https://www.your-domain.com/your-page.html" />
<meta property="og:type"          content="website" />
<meta property="og:title"         content="Your Website Title" />
<meta property="og:description"   content="Your description" />
<meta property="og:image"         content="https://www.your-domain.com/path/image.jpg" />
</head>
<style type="text/css">
<!--

a:link{color:black;font-family:sans-serif;text-decoration:none;}
a:visited{color:black;font-family:sans-serif;text-decoration:none;}
a:hover{color:#cc3300; font-weight:bold; }
a:active{color:#ff00cc; text-decoration:underline; }
-->
#header {
	border-top: none; 
	border-bottom: none; 
	border-left: none; 
}
#lgout {
	border: none;
	color:#ffffff;
	background-color: #2E84E1;
	width: 100px;
	height: 25px;
}
</style>
<!-- Load Facebook SDK for JavaScript -->
<div id="fb-root"></div>
<script async defer crossorigin="anonymous" src="https://connect.facebook.net/ko_KR/sdk.js#xfbml=1&version=v10.0&appId=737218386920806&autoLogAppEvents=1" nonce="l3kBCvdV"></script>
<center>
<form action="<%=request.getContextPath()%>/logout/logoutProc.jsp">

<table id="header" style="width:600px" bgcolor="#1cb581">
	<tr>
		<td><img src="<%=request.getContextPath()%>/img/logo.png" width="50px" height="50px"/></td>
		 <td align="right"><input type="submit" id="lgout" value="logout"/><div class="fb-share-button" data-href="https://www.naver.com/" data-layout="button" data-size="large"><a target="_blank" href="https://www.facebook.com/sharer/sharer.php?u=https%3A%2F%2Fdevelopers.facebook.com%2Fdocs%2Fplugins%2F&amp;src=sdkpreparse" class="fb-xfbml-parse-ignore">ê³µì  í  ê¸°</a></div></td>
   </tr>
</table>
</form>
</center>















