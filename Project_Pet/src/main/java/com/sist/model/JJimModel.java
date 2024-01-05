package com.sist.model;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.controller.RequestMapping;
import com.sist.dao.JJimDAO;
import com.sist.dao.MemberDAO;
import com.sist.vo.JJimVO;
import com.sist.vo.MemberVO;

public class JJimModel {

	@RequestMapping("mypage/my_JJim.do")
	public String mypage_jjim(HttpServletRequest request, HttpServletResponse response)
	{
		request.setAttribute("mypage_jsp", "../mypage/my_JJim.jsp");
		request.setAttribute("main_jsp", "../mypage/mypage.jsp");
		return "../main/main.jsp";
	}
	
	@RequestMapping("mypage/my_JJim_cancle.do")
	public String mypage_jjim_cancle(HttpServletRequest request, HttpServletResponse response)
	{
		String no=request.getParameter("no");
		JJimDAO dao=new JJimDAO();
		dao.JJimDelete(Integer.parseInt(no));
		
		return "../mypage/my_JJim.do";
	}
}
