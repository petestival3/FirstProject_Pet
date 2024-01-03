package com.sist.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.RequestMapping;

public class ReserveModel {
	
	@RequestMapping("reserve/reserve_hotel.do")
	public String reserve_hotel(HttpServletRequest request, HttpServletResponse response)
	{
	      // 3. 결과값 모아서 request에 저장
		  request.setAttribute("main_jsp", "../reserve/reserve_hotel.jsp");
		  return "../main/main.jsp";
	}
	
	@RequestMapping("reserve/reserve_care.do")
	public String reserve_care(HttpServletRequest request, HttpServletResponse response)
	{
	      // 3. 결과값 모아서 request에 저장
		  request.setAttribute("main_jsp", "../reserve/reserve_care.jsp");
		  return "../main/main.jsp";
	}
	
	@RequestMapping("reserve/reserve_funeral.do")
	public String reserve_funeral(HttpServletRequest request, HttpServletResponse response)
	{
	      // 3. 결과값 모아서 request에 저장
		  request.setAttribute("main_jsp", "../reserve/reserve_funeral.jsp");
		  return "../main/main.jsp";
	}
}
