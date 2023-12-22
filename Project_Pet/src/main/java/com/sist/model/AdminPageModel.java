package com.sist.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.RequestMapping;

public class AdminPageModel {
	@RequestMapping("adminPage/ad_reserve.do")
	public String admin_reserve(HttpServletRequest request, HttpServletResponse response)
	{
	      // 3. 결과값 모아서 request에 저장
		  request.setAttribute("main_jsp", "../adminPage/ad_reserve.jsp");
		  return "../main/main.jsp";
	}
}
