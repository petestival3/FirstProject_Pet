package com.sist.model;

import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.controller.RequestMapping;

import com.sist.dao.WalkDAO;
import com.sist.dao.*;
import com.sist.vo.*;
import com.sist.vo.WalkVO;

import oracle.net.aso.l;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

public class WalkModel {
	
	//산책로 일반 리스트 모델
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
		request.setAttribute("totalpage", totalpage);
		request.setAttribute("walk_jsp", "../walk/walkList.jsp");
		request.setAttribute("main_jsp", "../walk/walkMain.jsp");
		
	
				
		
		return "../main/main.jsp";
	
}
	
	//산책로 상세보기 모델
	@RequestMapping("walk/walkDetail.do")
	public String walkDetail(HttpServletRequest request, HttpServletResponse response) {
		
		String wno=request.getParameter("wno");
		
		
		WalkDAO dao=WalkDAO.newInstance();
		
		WalkVO vo=dao.walkDetail(Integer.parseInt(wno));
		List<WalkVO>courseList =dao.walkCourseData(Integer.parseInt(wno));
		
		//코스별 기능구현 에이젝스.....
			request.setAttribute("csSize", courseList.size());
			request.setAttribute("courseList", courseList);
	
		request.setAttribute("vo", vo);
		request.setAttribute("main_jsp", "../walk/walkDetail.jsp");
			
				
		
		return "../main/main.jsp";
	
}
	
	
	
	//산책로 검색리스트 모델
	@RequestMapping("walk/walkSearchList.do")
	public void walkSearchList(HttpServletRequest request, HttpServletResponse response) {
		
		
		  try
		  {
			  request.setCharacterEncoding("UTF-8");
		  }catch(Exception ex) {}
		  
		  String loc=request.getParameter("loc");
		  String w_name=request.getParameter("w_name");
		 String page=request.getParameter("page");
		
		 int curpage=Integer.parseInt(page);
		  WalkDAO dao=WalkDAO.newInstance();
		  JSONArray arr=new JSONArray();
		
		 
		  List<WalkVO>list =dao.walkSearchList(loc, w_name, curpage);
		  
		  int totalpage=dao.walkSearchTotalPage(loc, w_name);
		  
		  final int block=10;
		  int start = ((curpage-1)/block*block)+1;
			int end = ((curpage-1)/block*block)+10;
			if(end>totalpage) {
				end=totalpage;
			}
		  
		  if(list.size()==0)
		  {
			  JSONObject obj=new JSONObject();
			  obj.put("listSize", list.size());
			  obj.put("msg", "검색결과가 없습니다.");
			  arr.add(obj);
		  }
		  else
		  {
			  int i=0;
			
			  
			  for(WalkVO vo:list)
			  {
				 
				  JSONObject obj=new JSONObject();
				  	obj.put("wno", vo.getWno());
				  	obj.put("w_name", vo.getWname());
				  	obj.put("signgu_name", vo.getSigngu_name());
				  	obj.put("address", vo.getAddress());
				  	obj.put("cla", vo.getcLa());
				  	obj.put("clo", vo.getcLo());
				  	obj.put("reply_amount",vo.getReply_amount());
				 
				
				  if(i==0)
				  {
					 obj.put("listSize", list.size());
					 obj.put("totalpage", totalpage);
					 obj.put("start",start);
					 obj.put("end",end);
					 
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
		  }catch(Exception ex) {
			  ex.printStackTrace();
			  
		  }
		  
		
	
	}
	
	
	
	
	
	
	//산책로 댓글리스트 (ajax)모델
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
		
		  
		  String id=(String)session.getAttribute("id");
		  
		  JSONArray arr=new JSONArray();
		  
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
			 
			  List<WalkReplyVO>list=dao.walkReplyListData(Integer.parseInt(wno),curpage,id);
			 WalkReplyVO vo2=dao.walkReplyBest(Integer.parseInt(wno), id);
			
			  
			  
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
				  obj.put("upcheck", vo.getUpcheck());
				  	


				  if(i==0)
				  {
					 
					 
					  obj.put("replyAmount", replyAmount);
					  obj.put("sessionID", session.getAttribute("id"));
					  obj.put("totalpage", totalpage);
					  
					  obj.put("brno", vo2.getRno());
						
					  obj.put("brcontent", vo2.getRcontent());
					  obj.put("bdbday", vo2.getDbday());
					  obj.put("blike_count", vo2.getLike_count());
					 
					  obj.put("buserid", vo2.getUserid());
					
					  
					  obj.put("bupcheck", vo2.getUpcheck());
					 
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
	
	//산책로 댓글입력(ajax) 모델
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
	
	//산책로 대댓글입력 모델(ajax)
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
	
	//산책로 댓글삭제모델(ajax)
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
	
		//상품 댓글 업데이트(수정) 모델(ajax)
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
	
	//산책로 상세정보중 코스상세정보를 선택시 보여주기위한 ajax처리를 위한 모델
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
	
	
	@RequestMapping("walk/walkReplyUpButton.do")
	public void walkReplyUpButton(HttpServletRequest request, HttpServletResponse response) {
		
			//  테이블에 값이 있는지 체크 = > count
		//없으면 y값으로 인서트 
		// boardreply - > upcheck 가져옴 
		//있으면 만약 upcheck=n 이면 y로 업데이트 , boardreply likecount=+1 
		//없으면 만약 upcheck=y 이면 n으로 업데이트 , boardreply likecount=-1 
		  
	
		//upcheck랑 like count 
	String rno=	request.getParameter("rno");
	String upcheck="";
	String sendUpcheck="";
	int sendLikeCount=0;
	
	Map map= new HashMap();
	HttpSession session = request.getSession();
	
	String id=(String)session.getAttribute("id"); 
		WalkDAO dao=WalkDAO.newInstance();
		int count = dao.likeCountCheck(Integer.parseInt(rno),id );
		
		if(count==0) {
		map=dao.walkRelativeUserNoData(Integer.parseInt(rno), id);
			
		}
		else {
			
			upcheck=dao.getUpcheck(Integer.parseInt(rno), id);
			
				
				if(upcheck.equals("n")) {
				map=dao.UserUpadateUpcheckToYes(Integer.parseInt(rno), id);
				
					
				}
				else if (upcheck.equals("y")) {
				map=dao.UserUpadateUpcheckToNo(Integer.parseInt(rno), id);
					
				}
			
		}
		
		sendLikeCount=(int)map.get("sendLikeCount");
		sendUpcheck=(String)map.get("sendupCheck");
		
		JSONObject obj=new JSONObject();
		
		obj.put("sendLikeCount",sendLikeCount);
		obj.put("sendUpcheck",sendUpcheck);
		
		try
		  {
			  request.setCharacterEncoding("UTF-8");
		  }catch(Exception ex) {}
		  	
		  
		 
			  
			  try{//변경된 값 , upcheck
			  response.setContentType("application/x-www-form-urlencoded; charset=UTF-8");
			  PrintWriter out=response.getWriter();
			  out.write(obj.toJSONString());
			  }
		  catch(Exception ex) {}
	

	
}
	
	
}
