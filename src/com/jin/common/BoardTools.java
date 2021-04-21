package com.jin.common;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

public class BoardTools {
	
	
	public static String getEncoder(HttpServletRequest req, String name, String encode) {
		String encodeStr=req.getParameter(name);
		try {
			//return  encodeStr==null?"":URLEncoder.encode(encodeStr,encode);
			if(encodeStr==null)
				encodeStr="";
			else
				encodeStr=URLEncoder.encode(encodeStr,encode);
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return encodeStr;
	}
	
	
	
	
	public static String getNavi(int totalPage,int rowsPerPage,String url,int pageNumber)
	{
		String result="";
		
		int blockCnt=totalPage/rowsPerPage;
		if(totalPage%rowsPerPage>0)blockCnt+=1;

		if(pageNumber!=1)
		result+=("<a href=" +url+(pageNumber-1)+ ">이전</a>");
		for ( int i=1;i<=blockCnt;i++)
		{                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
			if(pageNumber==i)result+=("<b>");
			result+=("<a href="+url+i+">["+i+"]</a>");
			if(pageNumber==i)result+=("</b>");
		}
		
		
		if(pageNumber!=blockCnt)
			result+=("<a href=" +url+(pageNumber+1)+ ">다음</a>");

		
		return result;
	}
	public static String getSearch(List<String> lst, String jsFuncName) {
		String tag="<select name='searchSelect'>";
		
		for(String opt : lst)
		tag+="<option>"+opt+"</option>";
	
		tag+="</select>";
		tag+="<input type=text id='searchText' name='searchWord'/>";
		tag+="<input type='button' onclick="+jsFuncName+" name='searchBtn' value='검색' style='width:80px;'/>" ;

		return tag;
	}
	
}
