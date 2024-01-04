package com.sist.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.RequestMapping;
import com.sist.dao.JJimDAO;

public class JJimModel {

	@RequestMapping("mypage/my_JJim.do")
	public String mypage_jjim(HttpServletRequest request, HttpServletResponse response)
	{
		request.setAttribute("mypage_jsp", "../mypage/my_JJim.jsp");
		request.setAttribute("main_jsp", "../mypage/mypage.jsp");
		return "../main/main.jsp";
	}
	
}
