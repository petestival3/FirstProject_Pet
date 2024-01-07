package com.sist.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.RequestMapping;

public class AdminPageModel {
	@RequestMapping("adminPage/ad_page.do")
	public String admin_main(HttpServletRequest request, HttpServletResponse response)
	{
	      // 3. 결과값 모아서 request에 저장
		  request.setAttribute("main_jsp", "../adminPage/ad_page.jsp");
		  request.setAttribute("ad_page_jsp", "../adminPage/ad_main.jsp");
		  return "../main/main.jsp";
	}
	

	@RequestMapping("adminPage/ad_res.do")
	public String admin_res(HttpServletRequest request, HttpServletResponse response)
	{
		request.setAttribute("main_jsp", "../adminPage/ad_page.jsp");
		request.setAttribute("ad_page_jsp", "../adminPage/ad_res.jsp");
		
		return "../main/main.jsp";
	}
	
	@RequestMapping("adminPage/ad_payment.do")
	public String admin_payment(HttpServletRequest request, HttpServletResponse response)
	{
		request.setAttribute("main_jsp", "../adminPage/ad_page.jsp");
		request.setAttribute("ad_page_jsp", "../adminPage/ad_payment.jsp");
		
		return "../main/main.jsp";
	}

}
