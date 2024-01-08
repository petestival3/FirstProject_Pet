package com.sist.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.RequestMapping;

public class ReserveModel {
	
	@RequestMapping("reserve/reserve.do")
	public String reserve_funeral(HttpServletRequest request, HttpServletResponse response)
	{
	      // 3. 결과값 모아서 request에 저장
		  request.setAttribute("main_jsp", "../reserve/reserve.jsp");
		  return "../main/main.jsp";
	}
}
