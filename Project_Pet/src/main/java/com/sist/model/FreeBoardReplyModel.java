package com.sist.model;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.controller.RequestMapping;
import com.sist.dao.*;
import com.sist.vo.*;
public class FreeBoardReplyModel {
	@RequestMapping("freeboard/reply_insert.do")
	public String reply_insert(HttpServletRequest request,HttpServletResponse response)
	{
		try
		{
			request.setCharacterEncoding("UTF-8");
		}catch(Exception ex) {}
		String bno=request.getParameter("bno");
		String msg=request.getParameter("msg");
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		String name=(String)session.getAttribute("name");
		
		FreeBoardReplyVO vo=new FreeBoardReplyVO();
		vo.setBno(Integer.parseInt(bno));
		vo.setMsg(msg);
		vo.setId(id);
		vo.setName(name);
		
		// DAO 로 전송 
		FreeBoardReplyDAO dao=FreeBoardReplyDAO.newInstance();
		dao.replyInsert(vo);
		return "redirect:../freeboard/detail.do?no="+bno;
	}
	@RequestMapping("freeboard/reply_update.do")
	public String reply_update(HttpServletRequest request,HttpServletResponse response)
	{
		try
		{
			request.setCharacterEncoding("UTF-8");
		}catch(Exception ex) {}
		String bno=request.getParameter("bno"); // 게시물 번호 
		String no=request.getParameter("no"); // 댓글 번호 
		String msg=request.getParameter("msg");
		
		// DAO 연결 
		FreeBoardReplyDAO dao=FreeBoardReplyDAO.newInstance();
		dao.replyUpdate(Integer.parseInt(no), msg);
		return "redirect:../freeboard/detail.do?no="+bno;
	}
	
	@RequestMapping("freeboard/reply_delete.do")
	public String reply_delete(HttpServletRequest request,HttpServletResponse response)
	{
		String no=request.getParameter("no");
		String bno=request.getParameter("bno");
		
		// DAO 에 삭제 요청 
		FreeBoardReplyDAO dao=FreeBoardReplyDAO.newInstance();
		dao.replyDelete(Integer.parseInt(no));
		return "redirect:../freeboard/detail.do?no="+bno;
	}
}





