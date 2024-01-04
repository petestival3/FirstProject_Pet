package com.sist.model;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.RequestMapping;
import com.sist.dao.*;
import com.sist.vo.*;

import java.io.PrintWriter;
import java.text.*;
public class FreeBoardModel {
	@RequestMapping("freeboard/list.do")
	public String freeboard_list(HttpServletRequest request,HttpServletResponse response)
	{
		// 1. 페이지 받기
		String page=request.getParameter("page");
		if(page==null)
			page="1";
		int curpage=Integer.parseInt(page);
		// 2. 데이터베이스 연동
		FreeBoardDAO dao=FreeBoardDAO.newInstance();
		List<FreeBoardVO> list=dao.boardListData(curpage);
		int totalpage=dao.freeBoardTotalPage();
		
		final int BLOCK=10;
		int startPage=((curpage-1)/BLOCK*BLOCK)+1;
		int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
		if(endPage>totalpage)
			endPage=totalpage;
//		int totalpage=(int)Math.ceil(dao.boardRowCount()/10.0);
//		int count=dao.boardRowCount();
//		count=count-((curpage*10)-10);
//		request.setAttribute("count", count);
		request.setAttribute("curpage", curpage);
		request.setAttribute("totalpage", totalpage);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("list", list);
		request.setAttribute("today", new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
		request.setAttribute("main_jsp", "../freeboard/list.jsp");
		return "../main/main.jsp";
	}
	@RequestMapping("freeboard/insert.do")
	public String freeboard_insert(HttpServletRequest request,HttpServletResponse response)
	{
		
		request.setAttribute("main_jsp", "../freeboard/insert.jsp");
		return "../main/main.jsp";
	}
	
	@RequestMapping("freeboard/insert_ok.do")
	public String freeboard_insert_ok(HttpServletRequest request,HttpServletResponse response)
	{
		try
		{
			request.setCharacterEncoding("UTF-8");
		}catch(Exception ex) {}
		String name=request.getParameter("name");
		String subject=request.getParameter("subject");
		String content=request.getParameter("content");
		String pwd=request.getParameter("pwd");
		
		FreeBoardVO vo=new FreeBoardVO();
		vo.setName(name);
		vo.setSubject(subject);
		vo.setContent(content);
		vo.setPwd(pwd);
		
		// 데이터베이스 연결 
		FreeBoardDAO dao=FreeBoardDAO.newInstance();
		dao.boardInsert(vo);
		return "redirect:../freeboard/list.do";
	}
	
	@RequestMapping("freeboard/detail.do")
	public String board_detail(HttpServletRequest request,HttpServletResponse response)
	{
		String no=request.getParameter("no");
		FreeBoardDAO dao=FreeBoardDAO.newInstance();
		// 오라클에서 데이터 읽기 
		FreeBoardVO vo=dao.boardInfoData(Integer.parseInt(no), 1); // 1 = type 번호 (상세보기)
		request.setAttribute("vo", vo);
		// => 댓글 목록 
		request.setAttribute("main_jsp", "../freeboard/detail.jsp");
		
		// 댓글 읽기 
		FreeBoardReplyDAO fdao=FreeBoardReplyDAO.newInstance();
		List<FreeBoardReplyVO> list=fdao.replyListData(Integer.parseInt(no));
		request.setAttribute("list", list);
		
		return "../main/main.jsp";
	}
	
	// 삭제
		@RequestMapping("freeboard/delete_ok.do")
		public void freeboard_delete(HttpServletRequest request,HttpServletResponse response)
		{
			String no=request.getParameter("no");
			String pwd=request.getParameter("pwd");
			FreeBoardDAO dao=FreeBoardDAO.newInstance();
			String res=dao.boardDelete(Integer.parseInt(no), pwd);
			try
			{
				PrintWriter out=response.getWriter();
				out.write(res);
			}catch(Exception ex) {}
		}
		// 수정
		@RequestMapping("freeboard/update.do")
		public String freeboard_update(HttpServletRequest request,HttpServletResponse response)
		{
			String no=request.getParameter("no");
			FreeBoardDAO dao=FreeBoardDAO.newInstance();
			FreeBoardVO vo=dao.boardInfoData(Integer.parseInt(no), 2); // type번호 2번. 조회수 증가 안되게
			request.setAttribute("vo", vo);
			request.setAttribute("main_jsp", "../freeboard/update.jsp");
			return "../main/main.jsp";
		}
		
		// 실제 수정 
		@RequestMapping("freeboard/update_ok.do")
		public void freeboard_update_ok(HttpServletRequest request,HttpServletResponse response)
		{
			try
			{
				request.setCharacterEncoding("UTF-8");
			}catch(Exception ex) {}
			String no=request.getParameter("no");
			String name=request.getParameter("name");
			String subject=request.getParameter("subject");
			String content=request.getParameter("content");
			String pwd=request.getParameter("pwd");
			
			FreeBoardVO vo=new FreeBoardVO();
			vo.setNo(Integer.parseInt(no));
			vo.setName(name);
			vo.setSubject(subject);
			vo.setContent(content);
			vo.setPwd(pwd);
			
			FreeBoardDAO dao=FreeBoardDAO.newInstance();
			String res=dao.boardUpdate(vo);
			try
			{
				PrintWriter out=response.getWriter();
				out.write(res);
			}catch(Exception ex) {}
		}
}
