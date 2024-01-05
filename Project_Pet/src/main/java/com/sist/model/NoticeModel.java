package com.sist.model;

import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.RequestMapping;
import com.sist.dao.FreeBoardDAO;
import com.sist.dao.FreeBoardReplyDAO;
import com.sist.dao.NoticeDAO;
import com.sist.vo.FreeBoardReplyVO;
import com.sist.vo.FreeBoardVO;
import com.sist.vo.NoticeVO;

public class NoticeModel {
	@RequestMapping("notice/list.do")
	public String notice_list(HttpServletRequest request,HttpServletResponse response)
	{
		// 1. 페이지 받기
		String page=request.getParameter("page");
		if(page==null)
			page="1";
		int curpage=Integer.parseInt(page);
		// 2. 데이터베이스 연동
		NoticeDAO dao=NoticeDAO.newInstance();
		List<NoticeVO> list=dao.noticeListData(curpage);
		int totalpage=dao.noticeTotalPage();
		
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
		request.setAttribute("main_jsp", "../notice/list.jsp");
		return "../main/main.jsp";
	}
	
	@RequestMapping("notice/insert.do")
	public String notice_insert(HttpServletRequest request,HttpServletResponse response)
	{
		
		request.setAttribute("main_jsp", "../notice/insert.jsp");
		return "../main/main.jsp";
	}
	
	@RequestMapping("notice/insert_ok.do")
	public String notice_insert_ok(HttpServletRequest request,HttpServletResponse response)
	{
		try
		{
			request.setCharacterEncoding("UTF-8");
		}catch(Exception ex) {}
		String name=request.getParameter("name");
		String subject=request.getParameter("subject");
		String content=request.getParameter("content");
		String pwd=request.getParameter("pwd");
		
		NoticeVO vo=new NoticeVO();
		vo.setName(name);
		vo.setSubject(subject);
		vo.setContent(content);
		vo.setPwd(pwd);
		
		// 데이터베이스 연결 
		NoticeDAO dao=NoticeDAO.newInstance();
		dao.noticeInsert(vo);
		return "redirect:../notice/list.do";
	}
	
	@RequestMapping("notice/detail.do")
	public String notice_detail(HttpServletRequest request,HttpServletResponse response)
	{
		String no=request.getParameter("no");
		NoticeDAO dao=NoticeDAO.newInstance();
		// 오라클에서 데이터 읽기 
		NoticeVO vo=dao.noticeInfoData(Integer.parseInt(no), 1); // 1 = type 번호 (상세보기)
		request.setAttribute("vo", vo);
		// => 댓글 목록 
		request.setAttribute("main_jsp", "../notice/detail.jsp");
		
		return "../main/main.jsp";
	}
	
	// 삭제
		@RequestMapping("notice/delete_ok.do")
		public void notice_delete(HttpServletRequest request,HttpServletResponse response)
		{
			String no=request.getParameter("no");
			String pwd=request.getParameter("pwd");
			NoticeDAO dao=NoticeDAO.newInstance();
			String res=dao.noticeDelete(Integer.parseInt(no), pwd);
			try
			{
				PrintWriter out=response.getWriter();
				out.write(res);
			}catch(Exception ex) {}
		}
		// 수정
		@RequestMapping("notice/update.do")
		public String notice_update(HttpServletRequest request,HttpServletResponse response)
		{
			String no=request.getParameter("no");
			NoticeDAO dao=NoticeDAO.newInstance();
			NoticeVO vo=dao.noticeInfoData(Integer.parseInt(no), 2); // type번호 2번. 조회수 증가 안되게
			request.setAttribute("vo", vo);
			request.setAttribute("main_jsp", "../notice/update.jsp");
			return "../main/main.jsp";
		}
		
		// 실제 수정 
		@RequestMapping("notice/update_ok.do")
		public void notice_update_ok(HttpServletRequest request,HttpServletResponse response)
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
			
			NoticeVO vo=new NoticeVO();
			vo.setNo(Integer.parseInt(no));
			vo.setName(name);
			vo.setSubject(subject);
			vo.setContent(content);
			vo.setPwd(pwd);
			
			NoticeDAO dao=NoticeDAO.newInstance();
			String res=dao.noticeUpdate(vo);
			try
			{
				PrintWriter out=response.getWriter();
				out.write(res);
			}catch(Exception ex) {}
		}
	
}
