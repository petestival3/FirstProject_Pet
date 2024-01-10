package com.sist.model;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.controller.RequestMapping;
import com.sist.dao.*;
import com.sist.vo.*;
public class LoseCatModel {
	@RequestMapping("losecat/losecat.do")
	public String losecat_list(HttpServletRequest request,HttpServletResponse response)
	{
		// 1. 요청값 받기
		String page=request.getParameter("page");
		if(page==null)
			page="1";
		int curpage=Integer.parseInt(page);
		// 2. DB 연동
		LoseCatDAO dao=LoseCatDAO.newInstance();
		List<LoseCatVO> list=dao.losecatListData(curpage);
		int totalpage=dao.loseCatTotalPage();
		List<LoseCatVO> cTopList=dao.losecatTopList();
		
		final int BLOCK=10;
		int startPage=((curpage-1)/BLOCK*BLOCK)+1;
		int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
		if(endPage>totalpage)
			endPage=totalpage;
		
		
		request.setAttribute("cTopList", cTopList);
		request.setAttribute("lcList", list);
		request.setAttribute("curpage", curpage);
		request.setAttribute("totalpage", totalpage);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("main_jsp", "../losecat/losecat.jsp");
		commonsModel.commonsHeaderData(request);
		return "../main/main.jsp";
	}
	@RequestMapping("losecat/losecatdetail.do")
	public String losecat_detail(HttpServletRequest request,HttpServletResponse response)
	{
		String lcno=request.getParameter("lcno");
		// DAO 연결
		LoseCatDAO dao=LoseCatDAO.newInstance();
		LoseCatVO lcvo=dao.loseCatDetailData(Integer.parseInt(lcno));
		
		//공감해요 부분 (정유나) 시작
        HttpSession session=request.getSession();
  	    String id=(String)session.getAttribute("id");
  	    if(id!=null)
  	    {
  		  LikeDAO jdao=LikeDAO.newInstance();
  		  int like_count=jdao.CatLikeOk(Integer.parseInt(lcno), id);
  		  int like_total=jdao.CatLikeCount(Integer.parseInt(lcno));
  		  request.setAttribute("like_count", like_count);
  		  request.setAttribute("like_total", like_total);
  	    }
        //공감해요 부분 (정유나) 종료
		
		request.setAttribute("lcvo", lcvo);
		request.setAttribute("main_jsp", "../losecat/losecatdetail.jsp");
		commonsModel.commonsHeaderData(request);
		return "../main/main.jsp";
	}
}
