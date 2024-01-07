package com.sist.model;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.controller.RequestMapping;
import com.sist.dao.*;
import com.sist.vo.*;
public class AnimalModel {
	@RequestMapping("animal/animal.do")
	public String animal_animal(HttpServletRequest request, HttpServletResponse response)
	{
		// 요청값 ??
		// 1. View한테 요청값 받기
				String page=request.getParameter("page");
				if(page==null)
					page="1";
				int curpage=Integer.parseInt(page);
				// 2. DB 연동
		AnimalDAO dao=AnimalDAO.newInstance(); // 싱글턴
		List<AnimalVO> list=dao.animalListData(curpage);
		int totalpage=dao.animalTotalPage();
		
		final int BLOCK=10;
		int startPage=((curpage-1)/BLOCK*BLOCK)+1;
		int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
		if(endPage>totalpage)
			endPage=totalpage;

		request.setAttribute("anilist", list);
		request.setAttribute("curpage", curpage);
		request.setAttribute("totalpage", totalpage);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("main_jsp", "../animal/animal.jsp");
		return "../main/main.jsp";
	}
	
	@RequestMapping("animal/animaldetail.do")
	public String animal_detail(HttpServletRequest request,HttpServletResponse response)
	{
		String kano=request.getParameter("kano");
		// DAO 연결
		AnimalDAO dao=AnimalDAO.newInstance();
		AnimalVO avo=dao.animalDetailData(Integer.parseInt(kano));
		request.setAttribute("avo", avo);
		request.setAttribute("main_jsp", "../animal/animaldetail.jsp");
		
		  //입양희망 (정유나) 시작
		 WishVO wvo=dao.animalWishDetailData(Integer.parseInt(kano));
		 request.setAttribute("wvo", wvo);
		
		  HttpSession session=request.getSession();
		  String id=(String)session.getAttribute("id");
		  if(id!=null)
		  {
			  WishDAO wdao=WishDAO.newInstance();
			  int wish_count=wdao.WishCount(id, Integer.parseInt(kano));
			  request.setAttribute("wish_count", wish_count);
		  }
		  //입양희망 (정유나) 종료
		  
		
		return "../main/main.jsp";
	}
}
