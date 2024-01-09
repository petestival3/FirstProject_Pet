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
	 @RequestMapping("reserve/res_f_list.do")
	  public String funeral_list(HttpServletRequest request,
			  HttpServletResponse response)
	  {
		  String rf_no=request.getParameter("rf_no");
		  List<FuneralListVO> list=ReserveFuneralDAO.reserveFuneralListData(Integer.parseInt(rf_no));
		  request.setAttribute("list", list);
		  return "../reserve/res_f_list.jsp";
	  }
	 
	 //더 이어서 해야함...
}
