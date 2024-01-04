package com.sist.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.RequestMapping;

public class LikeModel {
	
	@RequestMapping("mypage/my_like.do")
	public String resList(HttpServletRequest request, HttpServletResponse response)
	{
		request.setAttribute("mypage_jsp", "../mypage/my_like.jsp");
		request.setAttribute("main_jsp", "../mypage/mypage.jsp");
		
		return "../main/main.jsp";
	}
}
