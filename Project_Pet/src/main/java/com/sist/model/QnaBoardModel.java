package com.sist.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.controller.RequestMapping;
import com.sist.dao.*;
import com.sist.vo.*;
import java.util.*;

public class QnaBoardModel {
	@RequestMapping("qnaBoard/list.do")
	public String qnaBoard_list(HttpServletRequest request,HttpServletResponse response)
	{
		// Model 안에 문제 있따 !
		// System.out.println("qna");
		// (사용자 요청을 받아서 요청처리 결과를 받는다...)
		// 사용자 요청 => 페이지 => Object page=this (page는 이미 내장객체 이름으로 쓰였다)
		String page=request.getParameter("page");
		if(page==null) // 처음 실행할 때 페이지 지정없으니 1page 출력해라(dafault)
			page="1"; 
		// 현재페이지 지정 
		int curpage=Integer.parseInt(page);
		// 오라클로부터 데이터 읽기
		QnaBoardDAO dao=QnaBoardDAO.newInstance();
		List<QnaBoardVO> list=dao.qnaBoardListData(curpage);
		// 총페이지
//		int count=dao.qnaBoardRowCount();
		int totalpage=dao.qnaBoardTotalPage();
		//int totalpage=(int)(Math.ceil(count/10.0));
//		
		final int BLOCK=10;
		int startPage=((curpage-1)/BLOCK*BLOCK)+1;
		int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
		if(endPage>totalpage)
			endPage=totalpage;
//		
//		// count 변경 => 2page 넘어가서도 글번호 올바르게 출력하는 코딩 (페이지)
//		count=count-((curpage*10)-10);
		request.setAttribute("page", page);
		request.setAttribute("curpage", curpage);
		request.setAttribute("list", list);
//		request.setAttribute("count", count);
		request.setAttribute("totalpage", totalpage);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		
		request.setAttribute("main_jsp", "../qnaBoard/list.jsp");
		return "../main/main.jsp";
	}
//	@RequestMapping("qnaBoard/insert.do")
//	public String qnaBoard_insert(HttpServletRequest request,HttpServletResponse response)
//	{
//		request.setAttribute("main_jsp", "../qnaBoard/insert.jsp");
//		return "../main/main.jsp";
//	}
//	@RequestMapping("qnaBoard/insert_ok.do")
//	public String qnaBoard_insert_ok(HttpServletRequest request,HttpServletResponse response)
//	{
//		String qtitle=request.getParameter("qtitle");
//		String qcontent=request.getParameter("qcontent");
//		HttpSession session=request.getSession();
//		String id=(String)session.getAttribute("id");
//		String name=(String)session.getAttribute("name");
//		
//		QnaBoardVO vo=new QnaBoardVO();
//		vo.setQtitle(qtitle);
//		vo.setQcontent(qcontent);
//		vo.setId(id);
//		vo.setName(name);
//		
//		QnaBoardDAO dao=QnaBoardDAO.newInstance();
//		dao.qnaBoardInsert(vo);
//		
//		return "redirect:../qnaBoard/list.do";
//	}
}
