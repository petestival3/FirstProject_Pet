package com.sist.model;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

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
public void hsptDetailList(HttpServletRequest request,HttpServletResponse response)
{
	String no=request.getParameter("no");
	HealthDAO dao=HealthDAO.newInstance();
	HealthVO vo=dao.hsptDetailList(Integer.parseInt(no));
	
	JSONObject obj=new JSONObject();
	obj.put("address", vo.getHospital_address());
	obj.put("phone", vo.getHospital_phone());
	obj.put("name", vo.getHospital_name());
	
	try
	{
		response.setContentType("application/x-www-form-urlencoded; charset=UTF-8");
		PrintWriter out=response.getWriter();
		out.write(obj.toString());
	}catch(Exception ex) {}
	
	
	
	
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
	
	List<HealthVO> list4=dao.hitnews();

	
	
	
	final int BLOCK=10;
	int startPage=((curpage-1)/BLOCK*BLOCK)+1;
	int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
	
	if(endPage>totalpage)
	{
		endPage=totalpage;
	}
	
	Cookie[] cookies=request.getCookies();
	List<HealthVO> NList=new ArrayList<HealthVO>();
	if(cookies!=null)
	{
		for(int i=cookies.length-1;i>=0;i--)
		{
			if(cookies[i].getName().startsWith("news_"))
			{
				String no=cookies[i].getValue();
				HealthVO vo=dao.NewsDetailList(Integer.parseInt(no));
				NList.add(vo);
			}
		}
	}
	
	request.setAttribute("NList", NList);
	request.setAttribute("list4", list4);
	request.setAttribute("startPage", startPage);
	request.setAttribute("endPage", endPage);
	request.setAttribute("totalpage", totalpage);
	request.setAttribute("curpage", curpage);
	request.setAttribute("list3", list3);
	request.setAttribute("main_jsp", "../health/newsmain.jsp");
	return "../main/main.jsp";
}

@RequestMapping("health/before_newsdetail.do") // 쿠키 먼저 저장 (동시에 수행할수없음)
public String healthBeforeDetailData(HttpServletRequest request, HttpServletResponse response)
{
	String no=request.getParameter("no");
	
	Cookie cookie=new Cookie("news_"+no, no);
	cookie.setPath("/");
	cookie.setMaxAge(60*60*24);
	response.addCookie(cookie);
	return "redirect:../health/newsdetail.do?no="+no;
}

@RequestMapping("health/newsdetail.do")
public String newsDetailList(HttpServletRequest request,HttpServletResponse response)
{
	String no=request.getParameter("no"); // 뉴스 고유 번호
	HealthDAO dao=HealthDAO.newInstance();
	HealthVO vo=dao.NewsDetailList(Integer.parseInt(no)); // 뉴스 디테일 데이터 출력
	
	List<WalkReplyVO> list=dao.newsReplyShow(Integer.parseInt(no)); // 뉴스 댓글 데이터 출력

	request.setAttribute("no", no);
	request.setAttribute("vo", vo);
	request.setAttribute("list", list);
	
	request.setAttribute("main_jsp", "../health/newsdetail.jsp");
	return "../main/main.jsp";
}


	@RequestMapping("health/newsreply_insert_ok.do")
	public String newsReply_ok(HttpServletRequest request,HttpServletResponse response)
	{
		try
		{
			request.setCharacterEncoding("UTF-8");
		}catch(Exception ex) {ex.printStackTrace();}
		
		WalkReplyVO vo=new WalkReplyVO();
		
		HttpSession session=request.getSession();
	    String user_Id = (String) session.getAttribute("id");
	    String pwd=request.getParameter("pwd");
		String no=request.getParameter("no"); 
		String content=request.getParameter("content");
		System.out.println(user_Id);
		System.out.println(pwd);
		System.out.println(no);
		System.out.println(content);
		vo.setBno(Integer.parseInt(no));
		vo.setRcontent(content);
		vo.setUserid(user_Id);

		request.setAttribute("no", no);

		HealthDAO dao=HealthDAO.newInstance();
		dao.newsReply(vo,pwd,Integer.parseInt(no));
		
		return "redirect:../health/newsdetail.do?no="+no;
	}
	@RequestMapping("health/newsreply_delete_ok.do")
	public void newsReply_delete_ok(HttpServletRequest request,HttpServletResponse response)
	{
		try
		{
			request.setCharacterEncoding("UTF-8");
		}catch(Exception ex) {ex.printStackTrace();}
		
		HttpSession session=request.getSession();
	    String user_Id = (String) session.getAttribute("id");
	    String no=request.getParameter("no"); 
	    String pwd=request.getParameter("pwd");
		String rno=request.getParameter("rno"); // 댓글고유번호
		
		System.out.println(no);
		System.out.println(user_Id);
		System.out.println(pwd);
		System.out.println(rno);
		 
		HealthDAO dao=HealthDAO.newInstance();
		String res=dao.newsReplyDelete(Integer.parseInt(rno),pwd);
		try
		{
			PrintWriter out=response.getWriter();
			out.write(res);
		}catch(Exception ex) {}

	}
}

