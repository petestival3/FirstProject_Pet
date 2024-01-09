package com.sist.model;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.sist.controller.RequestMapping;
import com.sist.dao.*; 
import java.util.*;
import com.sist.vo.*;
import java.text.*;
public class ReserveFuneralModel {
	
	@RequestMapping("reserve/reserve_funeral.do")
	public String reserve_funeral(HttpServletRequest request, HttpServletResponse response)
	{
	      // 3. 결과값 모아서 request에 저장
		  request.setAttribute("main_jsp", "../reserve/reserve_funeral.jsp");
		  return "../main/main.jsp";
	}
	 
	  @RequestMapping("reserve/res_f_list.do")
	  public String funeral_list(HttpServletRequest request, HttpServletResponse response)
	  {
		  String no=request.getParameter("no");
		  List<FuneralListVO> list=ReserveFuneralDAO.reserveFuneralListData(Integer.parseInt(no));
		  request.setAttribute("list", list);
		  return "../reserve/res_f_list.jsp";
	  }
	
	 //더 이어서 해야함...
}
