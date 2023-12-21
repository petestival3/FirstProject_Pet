package com.sist.model;
import com.sist.controller.*;
import com.sist.dao.*;
import com.sist.vo.*;
import java.util.*;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class StayModel {
	@RequestMapping("stay/list.do")
	public String stay_list(HttpServletRequest request, HttpServletResponse response) {
		String page=request.getParameter("page");
		if(page==null) 
			page="1";
		
		StayDAO dao=StayDAO.newInstance();
		int curpage=Integer.parseInt(page);
		int totalpage=dao.StayTotalPage();
		final int BLOCK=5;
		int startPage=((curpage-1)/BLOCK*BLOCK)+1;
		int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
		List<StayVO> list=dao.StayListData(curpage);
		List<StayVO> toplist=dao.stayLikeTop();
		int staytotal=dao.totalcount();
		if(endPage>totalpage)
			endPage=totalpage;
		
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
	
		request.setAttribute("list", list);
		request.setAttribute("toplist", toplist);
		request.setAttribute("curpage", curpage);
		request.setAttribute("totalpage", totalpage);
		request.setAttribute("staytotal", staytotal);
		
		// 쿠키 데이터 전송
		Cookie[] cookies=request.getCookies();
		List<StayVO> stcList=new ArrayList<StayVO>();
		if(cookies!=null) {
			for(int i=cookies.length-1;i>=0;i--) {
				if(cookies[i].getName().startsWith("stays")) {
					String no=cookies[i].getValue();
					StayVO vo=dao.stayDetail(Integer.parseInt(no));
					stcList.add(vo);
				}
			}
		}
		request.setAttribute("stcList", stcList);
		request.setAttribute("count", stcList.size());
		
		request.setAttribute("main_jsp", "../stay/list.jsp");
		return "../main/main.jsp";
	}
	
	@RequestMapping("stay/detail.do")
	public String stay_detail(HttpServletRequest request, HttpServletResponse response) {
String stayno=request.getParameter("stayno");
		
		StayDAO dao=StayDAO.newInstance();
		StayVO vo=dao.stayDetail(Integer.parseInt(stayno));
		List<RoomVO> rlist=dao.RoomListData(Integer.parseInt(stayno));

		request.setAttribute("vo", vo);
		request.setAttribute("rlist", rlist);
		request.setAttribute("main_jsp", "../stay/detail.jsp");
		return "../main/main.jsp";
	}
	
	@RequestMapping("stay/detail_before.do")
	public String stay_before_detail(HttpServletRequest request, HttpServletResponse response) {
		String stayno=request.getParameter("stayno");
		Cookie cookie=new Cookie("stays_"+stayno, stayno);
		cookie.setPath("/");
		cookie.setMaxAge(60*60*24);
		response.addCookie(cookie);
		
		return "redirect:../stay/detail.do?stayno="+stayno;
	}
}
