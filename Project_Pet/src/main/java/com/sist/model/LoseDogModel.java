package com.sist.model;
import java.util.*;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.RequestMapping;
import com.sist.dao.*;
import com.sist.vo.*;
public class LoseDogModel {
	@RequestMapping("losedog/losedog.do")
	public String losedog_list(HttpServletRequest request,HttpServletResponse response)
	{
		// 1. View 에서 요청값 받기
		String page=request.getParameter("page");
		if(page==null)
			page="1";
		int curpage=Integer.parseInt(page);
		// 2. DB 연동
		LoseDogDAO dao=LoseDogDAO.newInstance();
		List<LoseDogVO> list=dao.loseDogListData(curpage);
		int totalpage=dao.loseDogTotalPage();
		List<LoseDogVO> topList=dao.losedogTopList();
		
		final int BLOCK=10;
		int startPage=((curpage-1)/BLOCK*BLOCK)+1;
		int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
		if(endPage>totalpage)
			endPage=totalpage;
		
		
		request.setAttribute("topList", topList);
		request.setAttribute("ldList", list);
		request.setAttribute("curpage", curpage);
		request.setAttribute("totalpage", totalpage);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("main_jsp", "../losedog/losedog.jsp");
		return "../main/main.jsp";
	}
	@RequestMapping("losedog/losedogdetail_before.do")
	public String losedog_detail_before(HttpServletRequest request,HttpServletResponse response)
	{
		// Cookie 생성 
		String ldno=request.getParameter("ldno");
		Cookie cookie=new Cookie("losedog_"+ldno, ldno);
		// 저장의 위치 결정 
		cookie.setPath("/");
		// 저장 기간 설정 
		cookie.setMaxAge(60*60*24); // 초단위 (하루 저장)
		// 전송 
		response.addCookie(cookie);
		return "redirect:../losedog/losedogdetail.do?ldno="+ldno;
	}
	@RequestMapping("losedog/losedogdetail.do")
	public String losedog_detail(HttpServletRequest request,HttpServletResponse response)
	{
		String ldno=request.getParameter("ldno");
		// DAO 연결
		LoseDogDAO dao=LoseDogDAO.newInstance();
		LoseDogVO ldvo=dao.loseDogDetailData(Integer.parseInt(ldno));
		
		
		request.setAttribute("ldvo", ldvo);
		request.setAttribute("main_jsp", "../losedog/losedogdetail.jsp");
		return "../main/main.jsp";
	}
	
}
