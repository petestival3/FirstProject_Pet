package com.sist.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.RequestMapping;

public class ReserveModel {
	
	//여긴 header에서 각각 reserve jsp로 이동용 model
	//각자 모델 필요하면 따로 파일 만들어서 쓰기
	
	@RequestMapping("reserve/reserve_hotel.do")
	public String reserve_hotel(HttpServletRequest request, HttpServletResponse response)
	{
	      // 3. 결과값 모아서 request에 저장
		  request.setAttribute("main_jsp", "../reserve/reserve_hotel.jsp");
		  commonsModel.commonsHeaderData(request);
		  return "../main/main.jsp";
	}
	
	@RequestMapping("reserve/reserve_care.do")
	public String reserve_care(HttpServletRequest request, HttpServletResponse response)
	{
	      // 3. 결과값 모아서 request에 저장
		  request.setAttribute("main_jsp", "../reserve/reserve_care.jsp");
		  commonsModel.commonsHeaderData(request);
		  return "../main/main.jsp";
	}
}
