package com.sist.model;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.RequestMapping;
import com.sist.dao.HealthDAO;
import com.sist.vo.*;

public class HealthModel {
	@RequestMapping("health/hsptmain.do")
	public String hsptMainList(HttpServletRequest request,HttpServletResponse response)
	{
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		String page=request.getParameter("page");
		if(page==null)
			page="1";
		String fd=request.getParameter("fd");
		String st=request.getParameter("st"); // 파라미터값을 받음
		 
		HealthDAO dao=new HealthDAO(); 
		List<HealthVO> list=new ArrayList<HealthVO>();
		int totalpage=0;
		int curpage=Integer.parseInt(page); 
		List<HealthVO> statelist=dao.HsptStateData();
		
		if(st==null && fd==null) // 검색하지 않았을 때
		{	
			totalpage=dao.hsptTotalPage();
			list = dao.hsptTotalList(curpage);
		}

		final int BLOCK=10;
		int startPage=((curpage-1)/BLOCK*BLOCK)+1;
		int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
		
		if(endPage>totalpage)
		{
			endPage=totalpage;
		}

		request.setAttribute("curpage", curpage);
		request.setAttribute("totalpage", totalpage);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("list", list);
		request.setAttribute("statelist", statelist);
	
	request.setAttribute("hspt_jsp", "../health/find.jsp");
	request.setAttribute("main_jsp", "../health/hsptmain.jsp");

		return "../main/main.jsp";
	}
	
@RequestMapping("health/find.do")
	public String hsptTotalList(HttpServletRequest request,HttpServletResponse response)
	{
	try {
		request.setCharacterEncoding("UTF-8");
	} catch (UnsupportedEncodingException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
	
	String page=request.getParameter("page");
	if(page==null)
		page="1";
	String fd=request.getParameter("fd");
	String st=request.getParameter("st"); // 파라미터값을 받음
	 
	HealthDAO dao=new HealthDAO(); 
	List<HealthVO> list=new ArrayList<HealthVO>();
	int totalpage=0;
	int curpage=Integer.parseInt(page); 
	List<HealthVO> statelist=dao.HsptStateData();
	
	if(st==null && fd==null) // 검색하지 않았을 때
	{	
		totalpage=dao.hsptTotalPage();
		list = dao.hsptTotalList(curpage);
	}

	final int BLOCK=10;
	int startPage=((curpage-1)/BLOCK*BLOCK)+1;
	int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
	
	if(endPage>totalpage)
	{
		endPage=totalpage;
	}

	request.setAttribute("curpage", curpage);
	request.setAttribute("totalpage", totalpage);
	request.setAttribute("startPage", startPage);
	request.setAttribute("endPage", endPage);
	request.setAttribute("list", list);
	request.setAttribute("statelist", statelist);
	request.setAttribute("hspt_jsp", "../health/find.jsp");
	request.setAttribute("main_jsp", "../health/hsptmain.jsp");

		return "../main/main.jsp";
	}

@RequestMapping("health/hsptsearch.do")
public String hsptSearchDetail(HttpServletRequest request,HttpServletResponse response)
{
try {
	request.setCharacterEncoding("UTF-8");
} catch (UnsupportedEncodingException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}


String page=request.getParameter("page");
if(page==null)
	page="1";
int curpage=Integer.parseInt(page); 
String fd=request.getParameter("fd");
String st=request.getParameter("st"); // 파라미터값을 받음
//System.out.println(st);
HealthDAO dao=new HealthDAO(); 
List<HealthVO> list=new ArrayList<HealthVO>();
int totalpage=dao.hsptSearchTotalPage(fd, st);

if(st==null) // 검색하지 않았을 때
{	
	st="전체";
}

list=dao.hsptSearchList(curpage,fd, st);
//System.out.println(list.size());


	

List<HealthVO> statelist=dao.HsptStateData();


final int BLOCK=10;
int startPage=((curpage-1)/BLOCK*BLOCK)+1;
int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;

if(endPage>totalpage)
{
	endPage=totalpage;
}


request.setAttribute("fd", fd);
request.setAttribute("st", st);
request.setAttribute("curpage", curpage);
request.setAttribute("totalpage", totalpage);
request.setAttribute("startPage", startPage);
request.setAttribute("endPage", endPage);
request.setAttribute("list", list);
request.setAttribute("statelist", statelist);
request.setAttribute("hspt_jsp", "../health/hsptsearch.jsp");
request.setAttribute("main_jsp", "../health/hsptmain.jsp");

	return "../main/main.jsp";
}

@RequestMapping("health/detail.do")
public String hsptDetailList(HttpServletRequest request,HttpServletResponse response)
{
	String no=request.getParameter("no");
	HealthDAO dao=HealthDAO.newInstance();
	HealthVO vo=dao.hsptDetailList(Integer.parseInt(no));
	
	request.setAttribute("no", no);
	request.setAttribute("vo", vo);
	
	request.setAttribute("main_jsp", "../health/detail.jsp");
	return "../main/main.jsp";
}

@RequestMapping("health/newsmain.do")
public String hsptNewsMain(HttpServletRequest request, HttpServletResponse response)
{
	String page=request.getParameter("page");
	if(page==null)
		page="1";
	int curpage=Integer.parseInt(page);
	
	HealthDAO dao=new HealthDAO();
	List<HealthVO> list3=dao.hsptNewsList(curpage);
	int totalpage=dao.newsearchTotalPage();
	
	final int BLOCK=10;
	int startPage=((curpage-1)/BLOCK*BLOCK)+1;
	int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
	
	if(endPage>totalpage)
	{
		endPage=totalpage;
	}

	request.setAttribute("startPage", startPage);
	request.setAttribute("endPage", endPage);
	request.setAttribute("totalpage", totalpage);
	request.setAttribute("curpage", curpage);
	request.setAttribute("list3", list3);
	request.setAttribute("main_jsp", "../health/newsmain.jsp");
	return "../main/main.jsp";
}
@RequestMapping("health/newsdetail.do")
public String newsDetailList(HttpServletRequest request,HttpServletResponse response)
{
	
	
	String no=request.getParameter("no");
	HealthDAO dao=HealthDAO.newInstance();
	HealthVO vo=dao.NewsDetailList(Integer.parseInt(no));
	
	
//	System.out.println(dao);
//	System.out.println(vo);
	
	request.setAttribute("no", no);
	request.setAttribute("vo", vo);
	
	request.setAttribute("main_jsp", "../health/newsdetail.jsp");
	return "../main/main.jsp";
}

}
