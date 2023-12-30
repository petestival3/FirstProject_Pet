package com.sist.model;

import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.controller.RequestMapping;

import com.sist.dao.WalkDAO;
import com.sist.dao.*;
import com.sist.vo.*;
import com.sist.vo.WalkVO;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

public class WalkModel {
	@RequestMapping("walk/walkList.do")
	public String walkList(HttpServletRequest request, HttpServletResponse response) {
		String strpage= request.getParameter("page");
		String loc=request.getParameter("loc");
		WalkDAO dao=WalkDAO.newInstance();
		List<WalkVO>list=null;
		if (strpage==null) {
			strpage="1";
		}
		if (loc==null) {
			loc="전체";
		}
		
		int curpage=Integer.parseInt(strpage);
		int totalpage=dao.walkTotalPage(loc);
		
		final int block=10;
		int start = ((curpage-1)/block*block)+1;
		int end = ((curpage-1)/block*block)+10;
		if(end>totalpage) {
			end=totalpage;
		}
		
		list=dao.walkList(loc, curpage);
		request.setAttribute("list", list);
		request.setAttribute("curpage", strpage);
		request.setAttribute("loc", loc);
		request.setAttribute("start", start);
		request.setAttribute("end", end);
		request.setAttribute("walk_jsp", "../walk/walkList.jsp");
		request.setAttribute("main_jsp", "../walk/walkMain.jsp");
		request.setAttribute("totalpage", totalpage);
	
				
		
		return "../main/main.jsp";
	
}
	
	
	@RequestMapping("walk/walkDetail.do")
	public String walkDetail(HttpServletRequest request, HttpServletResponse response) {
		
		String wno=request.getParameter("wno");
		String page=request.getParameter("page");
		String loc=request.getParameter("loc");
		
		WalkDAO dao=WalkDAO.newInstance();
		
		WalkVO vo=dao.walkDetail(Integer.parseInt(wno));
		List<WalkVO>courseList =dao.walkCourseData(Integer.parseInt(wno));
		
		//코스별 기능구현 에이젝스.....
			request.setAttribute("csSize", courseList.size());
			request.setAttribute("courseList", courseList);
		request.setAttribute("loc", loc);
		request.setAttribute("curpage", page);
		request.setAttribute("vo", vo);
		request.setAttribute("main_jsp", "../walk/walkDetail.jsp");
			
				
		
		return "../main/main.jsp";
	
}
	
	
	
	
	
	
	@RequestMapping("walk/walkReplyAjaxList.do")
	public void walkReplyAjaxList(HttpServletRequest request, HttpServletResponse response) {
		
		
		  try
		  {
			  request.setCharacterEncoding("UTF-8");
		  }catch(Exception ex) {}
		  String wno=request.getParameter("wno");
		  String strpage=request.getParameter("page");
		  
			
			int curpage=Integer.parseInt(strpage);
		  WalkDAO dao=WalkDAO.newInstance();
		  
		  
		 int totalpage=dao.walkReplyTotalPage(Integer.parseInt(wno));
		  int replyAmount=dao.walkReplyAmount(Integer.parseInt(wno));
		  HttpSession session =request.getSession();
		  // JSON변경 
		  // VO => {} ==> JSONObject
		  // List => [{},{}...] ==> JSONArray
		  JSONArray arr=new JSONArray();//[]
		  //[{count:0},]
		  if(replyAmount==0)
		  {
			  JSONObject obj=new JSONObject();
			  obj.put("replyAmount", replyAmount);
			  obj.put("sessionID", session.getAttribute("id"));
			  arr.add(obj);
		  }
		  else
		  {
			  int i=0;
			  List<WalkReplyVO>list=dao.walkReplyListData(Integer.parseInt(wno),curpage);
			  
			  for(WalkReplyVO vo:list)
			  {
				  String rootId="";
				  if(vo.getRoot()!=0) {
				rootId= dao.rootId(vo.getRoot());
				  }
				  JSONObject obj=new JSONObject();
				  // {zipcode:111,address:'...',count:2},{}
				  obj.put("rno", vo.getRno());
				  obj.put("rcontent", vo.getRcontent());
				  obj.put("dbday", vo.getDbday());
				  obj.put("like_count", vo.getLike_count());
				  obj.put("group_tab", vo.getGroup_tab());
				  obj.put("userid", vo.getUserid());
				  obj.put("bno", vo.getBno());
				  obj.put("rootId", rootId);
				  obj.put("root", vo.getRoot());
				  obj.put("group_id", vo.getGroup_id());
				  
				
				  



				  if(i==0)
				  {
					  obj.put("replyAmount", replyAmount);
					  obj.put("sessionID", session.getAttribute("id"));
					  obj.put("totalpage", totalpage);
				  }
				  arr.add(obj);
				  i++;
			  }
		  }
		 
		  try
		  {
			  response.setContentType("application/x-www-form-urlencoded; charset=UTF-8");
			  PrintWriter out=response.getWriter();
			  out.write(arr.toJSONString());
		  }catch(Exception ex) {}
		  
		
	
	}
	
	
	@RequestMapping("walk/walkReplyAjaxAdd.do")
	public void walkReplyAjaxAdd(HttpServletRequest request, HttpServletResponse response) {
		
		
		  try
		  {
			  request.setCharacterEncoding("UTF-8");
		  }catch(Exception ex) {}
		String rcontent=request.getParameter("rcontent");
		String pwd=request.getParameter("pwd");
		String wno=request.getParameter("wno");
		
		 
		WalkDAO dao=WalkDAO.newInstance();
		 WalkReplyVO vo=new WalkReplyVO();
		 HttpSession session =request.getSession();
		 String id=(String)session.getAttribute("id");
		  
		vo.setUserid(id);
		vo.setRcontent(rcontent);
		vo.setBno(Integer.parseInt(wno));
		dao.walkReplyInsert(vo, pwd);
		  
		

	
}
	
	
	@RequestMapping("walk/walkReplyMoreAdd.do")
	public void walkReplyMoreAjaxAdd(HttpServletRequest request, HttpServletResponse response) {
		
		
		  try
		  {
			  request.setCharacterEncoding("UTF-8");
		  }catch(Exception ex) {}
		String rcontent=request.getParameter("rcontent");
		String pwd=request.getParameter("pwd");
		String wno=request.getParameter("wno");
		String rno=request.getParameter("rno");
		 
		WalkDAO dao=WalkDAO.newInstance();
		 WalkReplyVO vo=new WalkReplyVO();
		 HttpSession session =request.getSession();
		 String id=(String)session.getAttribute("id");
		  
		vo.setUserid(id);
		vo.setRcontent(rcontent);
		vo.setBno(Integer.parseInt(wno));
		vo.setRno(Integer.parseInt(rno));
		
		dao.walkAddReplyInsert(pwd, vo);
		  
		

	
}
	
	
	@RequestMapping("walk/walkReplyDelete.do")
	public void walkReplyDeleteAjax(HttpServletRequest request, HttpServletResponse response) {
		
		
		  try
		  {
			  request.setCharacterEncoding("UTF-8");
		  }catch(Exception ex) {}
		
		String pwd=request.getParameter("pwd");
		String msg="";
		String rno=request.getParameter("rno");
		 	boolean pCheck=false;
		WalkDAO dao=WalkDAO.newInstance();
		JSONObject obj=new JSONObject();
		
		pCheck = dao.walkDeleteReply(Integer.parseInt(rno), pwd);
		
		if (pCheck==false) {
			msg="비밀번호가 틀렸습니다.";
			
			obj.put("msg", msg);
		}
		
		
		
		  try
		  {
			  response.setContentType("application/x-www-form-urlencoded; charset=UTF-8");
			  PrintWriter out=response.getWriter();
			  out.write(obj.toJSONString());
		  }catch(Exception ex) {}
		
		
		
		
	
		  
		

	
}
	
	
	@RequestMapping("walk/walkReplyUpdate.do")
	public void walkReplyUpdateAjax(HttpServletRequest request, HttpServletResponse response) {
		
		
		  try
		  {
			  request.setCharacterEncoding("UTF-8");
		  }catch(Exception ex) {}
		
		String pwd=request.getParameter("pwd");
		String msg="";
		String rno=request.getParameter("rno");
		String upcontent=request.getParameter("upcontent");
		 	boolean pCheck=false;
		WalkDAO dao=WalkDAO.newInstance();
		JSONObject obj=new JSONObject();
		
		WalkReplyVO vo=new WalkReplyVO();
		vo.setRno(Integer.parseInt(rno));
		vo.setRcontent(upcontent);
		
		
		pCheck = dao.walkReplyUpdate(vo, pwd);
		
		if (pCheck==false) {
			msg="비밀번호가 틀렸습니다.";
			
			obj.put("msg", msg);
		}
		
		
		
		  try
		  {
			  response.setContentType("application/x-www-form-urlencoded; charset=UTF-8");
			  PrintWriter out=response.getWriter();
			  out.write(obj.toJSONString());
		  }catch(Exception ex) {}
		
		
		
		
	
		  
		

	
}
	
	
	@RequestMapping("walk/walkCourseAjaxInform.do")
	public void walkCourseAjaxInform(HttpServletRequest request, HttpServletResponse response) {
		
		
		  try
		  {
			  request.setCharacterEncoding("UTF-8");
		  }catch(Exception ex) {}
		
		String wcno=request.getParameter("wcno");
		 	
		WalkDAO dao=WalkDAO.newInstance();
		JSONObject obj=new JSONObject();
		
		WalkVO vo=dao.walkCourseAjaxInform(Integer.parseInt(wcno));
		
		obj.put("level_image", vo.getLevel_image());
		obj.put("w_course_name", vo.getW_course_name());
		obj.put("course_inform",vo.getCourse_inform());
		obj.put("address", vo.getAddress());
		obj.put("course_length_detail", vo.getCourse_lengthDetail());
		obj.put("course_time", vo.getCourse_time());
		obj.put("optn", vo.getOptn());
		obj.put("toilet", vo.getToilet());
		obj.put("conventionName", vo.getConventionName());
		obj.put("course_level", vo.getCourse_level());
		
		
		  try
		  {
			  response.setContentType("application/x-www-form-urlencoded; charset=UTF-8");
			  PrintWriter out=response.getWriter();
			  out.write(obj.toJSONString());
		  }catch(Exception ex) {}
		
		
		
		
	
		  
		

	
}
	
}
