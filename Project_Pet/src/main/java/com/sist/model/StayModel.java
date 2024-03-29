package com.sist.model;
import com.sist.controller.*;
import com.sist.dao.*;
import com.sist.vo.*;

import java.io.PrintWriter;
import java.util.*;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

public class StayModel {
	@RequestMapping("stay/list.do")
	public String stay_list(HttpServletRequest request, HttpServletResponse response) {
		String page=request.getParameter("page");
		if(page==null) 
			page="1";
		String stype="0";
		StayDAO dao=StayDAO.newInstance();
		int curpage=Integer.parseInt(page);
		int totalpage=dao.StayTotalPage();
		final int BLOCK=5;
		int startPage=((curpage-1)/BLOCK*BLOCK)+1;
		int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
		List<StayVO> list=dao.StayListData(curpage);
		List<StayVO> toplist=dao.stayLikeTop();
		int staytotal=dao.totalcount();
		if(endPage>totalpage)
			endPage=totalpage;
		
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		
		request.setAttribute("stype", stype);
		request.setAttribute("list", list);
		request.setAttribute("toplist", toplist);
		request.setAttribute("curpage", curpage);
		request.setAttribute("totalpage", totalpage);
		request.setAttribute("staytotal", staytotal);
		
		// 쿠키 데이터 전송
		Cookie[] cookies=request.getCookies();
		List<StayVO> stcList=new ArrayList<StayVO>();
		if(cookies!=null) {
			for(int i=cookies.length-1;i>=0;i--) {
				if(cookies[i].getName().startsWith("stays")) {
					String no=cookies[i].getValue();
					StayVO vo=dao.stayDetail(Integer.parseInt(no));
					stcList.add(vo);
				}
			}
		}
		request.setAttribute("stcList", stcList);
		request.setAttribute("count", stcList.size());
		
		request.setAttribute("main_jsp", "../stay/list.jsp");
		commonsModel.commonsHeaderData(request);
		return "../main/main.jsp";
	}
	
	@RequestMapping("stay/detail.do")
	public String stay_detail(HttpServletRequest request, HttpServletResponse response) {
		String stayno=request.getParameter("stayno");
		
		StayDAO dao=StayDAO.newInstance();
		dao.stayRevCountUpdate(Integer.parseInt(stayno), 1);
		dao.stayScoreUpdate(Integer.parseInt(stayno), 1);
		StayVO vo=dao.stayDetail(Integer.parseInt(stayno));
		List<RoomVO> rlist=dao.RoomListData(Integer.parseInt(stayno),1);
		ReviewDAO rdao=ReviewDAO.newInstance();
		int reviewtotal=rdao.reviewTotalPage(1, Integer.parseInt(stayno));
		int roomtotal=dao.stayroomtotal(Integer.parseInt(stayno));
		
		request.setAttribute("roomtotal", roomtotal);
		request.setAttribute("reviewtotal", reviewtotal);
		request.setAttribute("vo", vo);
//		request.setAttribute("rlist", rlist);
		request.setAttribute("main_jsp", "../stay/detail.jsp");
		commonsModel.commonsHeaderData(request);
		return "../main/main.jsp";
	}
	
	@RequestMapping("stay/detail_before.do")
	public String stay_before_detail(HttpServletRequest request, HttpServletResponse response) {
		String stayno=request.getParameter("stayno");
		Cookie cookie=new Cookie("stays_"+stayno, stayno);
		cookie.setPath("/");
		cookie.setMaxAge(60*60*24);
		response.addCookie(cookie);
		
		return "redirect:../stay/detail.do?stayno="+stayno;
	}
	
	@RequestMapping("stay/location_list.do")
	public void stay_location_list(HttpServletRequest request, HttpServletResponse response) {
		try
		  {
			  request.setCharacterEncoding("UTF-8");
		  }catch(Exception ex) {}
		  String fds=request.getParameter("fds");
		  if(fds==null)
			  fds="가평";
		  StayDAO dao=StayDAO.newInstance();
		  // JSON변경 
		  // VO => {} ==> JSONObject
		  // List => [{},{}...] ==> JSONArray
		  JSONArray arr=new JSONArray();//[]
		  //[{count:0},]
			  List<StayVO> list=dao.stayAddressListData(fds);
			  for(StayVO vo:list)
			  {
				  JSONObject obj=new JSONObject();
				  // {zipcode:111,address:'...',count:2},{}
				  obj.put("name", vo.getName());
				  obj.put("image", vo.getImage());
				  obj.put("price", vo.getPrice());
				  obj.put("stayno", vo.getStayno());
				  arr.add(obj);
			  }
		  try
		  {
			  response.setContentType("application/x-www-form-urlencoded; charset=UTF-8");
			  PrintWriter out=response.getWriter();
			  out.write(arr.toJSONString());
		  }catch(Exception ex) {}
	}
	
	@RequestMapping("stay/stypelist.do")
	public String stay_stypelist(HttpServletRequest request, HttpServletResponse response) {
		
		String[] types= {"","호텔","캠핑","펜션","모텔"};
		String[] engtypes= {"","Hotel","Camping","Pension","Motel"};
		String page=request.getParameter("page");
		if(page==null) 
			page="1";
		String typeno=request.getParameter("stype");
		String stype=types[Integer.parseInt(typeno)];
		String engtype=engtypes[Integer.parseInt(typeno)];
		
		StayDAO dao=StayDAO.newInstance();
		int curpage=Integer.parseInt(page);
		int totalpage=dao.StayTypeTotalPage(stype);
		final int BLOCK=5;
		int startPage=((curpage-1)/BLOCK*BLOCK)+1;
		int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
		List<StayVO> list=dao.stayTypeListAllData(stype,curpage);
		List<StayVO> toplist=dao.stayLikeTop();
		int staytotal=dao.stayTypeCount(stype);
		if(endPage>totalpage)
			endPage=totalpage;
		
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		
		request.setAttribute("stype", typeno);
		request.setAttribute("list", list);
		request.setAttribute("toplist", toplist);
		request.setAttribute("curpage", curpage);
		request.setAttribute("totalpage", totalpage);
		request.setAttribute("staytotal", staytotal);
		
		// 쿠키 데이터 전송
		Cookie[] cookies=request.getCookies();
		List<StayVO> stcList=new ArrayList<StayVO>();
		if(cookies!=null) {
			for(int i=cookies.length-1;i>=0;i--) {
				if(cookies[i].getName().startsWith("stays")) {
					String no=cookies[i].getValue();
					StayVO vo=dao.stayDetail(Integer.parseInt(no));
					stcList.add(vo);
				}
			}
		}
		request.setAttribute("stcList", stcList);
		request.setAttribute("count", stcList.size());
		
		
		
		request.setAttribute("main_jsp", "../stay/stypelist.jsp");
		commonsModel.commonsHeaderData(request);
		return "../main/main.jsp";
	}
	
	@RequestMapping("stay/stay_location.do")
	public String stay_location(HttpServletRequest request, HttpServletResponse response) {
		
		request.setAttribute("main_jsp", "../stay/location.jsp");
		commonsModel.commonsHeaderData(request);
		return "../main/main.jsp";
	}
	
	@RequestMapping("stay/stypeSortlist.do")
	public String stay_stypeSortlist(HttpServletRequest request, HttpServletResponse response) {
		
		String[] types= {"","호텔","캠핑","펜션","모텔"};
		String[] engtypes= {"","Hotel","Camping","Pension","Motel"};
		String page=request.getParameter("page");
		if(page==null) 
			page="1";
		String typeno=request.getParameter("stype");
		String stype=types[Integer.parseInt(typeno)];
		String engtype=engtypes[Integer.parseInt(typeno)];
		
		String sb=request.getParameter("sb");
		
		StayDAO dao=StayDAO.newInstance();
		int curpage=Integer.parseInt(page);
		int totalpage=dao.StayTypeTotalPage(stype);
		final int BLOCK=5;
		int startPage=((curpage-1)/BLOCK*BLOCK)+1;
		int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
		List<StayVO> list=dao.staySortDESCListData(stype,curpage,sb);
		List<StayVO> toplist=dao.stayLikeTop();
		int staytotal=dao.stayTypeCount(stype);
		if(endPage>totalpage)
			endPage=totalpage;
		
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		
		request.setAttribute("sb", sb);
		request.setAttribute("stype", typeno);
		request.setAttribute("list", list);
		request.setAttribute("toplist", toplist);
		request.setAttribute("curpage", curpage);
		request.setAttribute("totalpage", totalpage);
		request.setAttribute("staytotal", staytotal);
		
		// 쿠키 데이터 전송
		Cookie[] cookies=request.getCookies();
		List<StayVO> stcList=new ArrayList<StayVO>();
		if(cookies!=null) {
			for(int i=cookies.length-1;i>=0;i--) {
				if(cookies[i].getName().startsWith("stays")) {
					String no=cookies[i].getValue();
					StayVO vo=dao.stayDetail(Integer.parseInt(no));
					stcList.add(vo);
				}
			}
		}
		request.setAttribute("stcList", stcList);
		request.setAttribute("count", stcList.size());
		
		
		
		request.setAttribute("main_jsp", "../stay/stypeSortlist.jsp");
		commonsModel.commonsHeaderData(request);
		return "../main/main.jsp";
	}
	
	
	@RequestMapping("stay/roomlist.do")
	public void stay_room_list(HttpServletRequest request, HttpServletResponse response) {
		
		  String sno=request.getParameter("sno");
		  if(sno==null) {
			  sno="1";
		  }
		  String roompage=request.getParameter("roompage");
		  if(roompage==null)
			  roompage="1";
		  StayDAO dao=StayDAO.newInstance();
//		  int roomtotal=dao.stayroomtotal(Integer.parseInt(sno));
		  // JSON변경 
		  // VO => {} ==> JSONObject
		  // List => [{},{}...] ==> JSONArray
		  JSONArray arr=new JSONArray();//[]
		  //[{count:0},]
			  List<RoomVO> list=dao.RoomListData(Integer.parseInt(sno),Integer.parseInt(roompage));
			  for(RoomVO vo:list)
			  {
				  JSONObject obj=new JSONObject();
				  // {zipcode:111,address:'...',count:2},{}
				  /*
				   * private int rno,stayno, roomno,price;
					 private String image,name;
				   */
				  obj.put("rno", vo.getRno());
				  obj.put("roomno", vo.getRoomno());
				  obj.put("price", vo.getPrice());
				  obj.put("image", vo.getImage());
				  obj.put("name", vo.getName());
				  arr.add(obj);
			  }
		  try
		  {
			  response.setContentType("application/x-www-form-urlencoded; charset=UTF-8");
			  PrintWriter out=response.getWriter();
			  out.write(arr.toJSONString());
		  }catch(Exception ex) {}
	}
	
	@RequestMapping("stay/staylikeon.do")
	public void stay_like_on(HttpServletRequest request, HttpServletResponse response) {
		String sno=request.getParameter("sno");
		if(sno==null) {
			  sno="1";
		  }
		// 숙소리스트 likecount 증가
		StayDAO.stayLikeUpdate(Integer.parseInt(sno));
		
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		
		StayDAO dao=StayDAO.newInstance();
		StayVO vo=dao.stayDetail(Integer.parseInt(sno));
		String image=vo.getImage();
		String name=vo.getName();
		Double score=vo.getScore();
		
		StayLikeVO slvo=new StayLikeVO();
		slvo.setId(id);
		slvo.setImage(image);
		slvo.setName(name);
		slvo.setScore(score);
		slvo.setSno(Integer.parseInt(sno));
		System.out.println("likeon");
		StayDAO.idLikeInsert(slvo);
		System.out.println("likeon");
	}
	
	@RequestMapping("stay/staylikeoff.do")
	public void stay_like_off(HttpServletRequest request, HttpServletResponse response) {
		String sno=request.getParameter("sno");
		if(sno==null) {
			  sno="1";
		  }
		// 숙소리스트 likecount 감소
		StayDAO.stayLikeCancel(Integer.parseInt(sno));
		
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		
		Map map=new HashMap();
		map.put("id", id);
		map.put("sno", sno);
		System.out.println("likeoff");
		StayDAO.idLikeDelete(map);
		
	}
	
	@RequestMapping("stay/idstayLikeCount.do")
	public void idstay_like_count(HttpServletRequest request, HttpServletResponse response) {
		String sno=request.getParameter("sno");
		if(sno==null) {
			  sno="1";
		  }
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		
		Map map=new HashMap();
		map.put("id", id);
		map.put("sno", sno);
		
		int count=StayDAO.idStayLikeCount(map);
		String ss="";
		System.out.println("likecounttest");
		if(count==0) {
			ss="nolike";
		}else {
			ss="yeslike";
		}
		
		try {
			PrintWriter out=response.getWriter();
			out.write(ss);
		}catch(Exception ex) {}
	}
	
	@RequestMapping("stay/idlike_mypage.do")
	public String idlike_mypage(HttpServletRequest request, HttpServletResponse response){
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		String page=request.getParameter("page");
		if(page==null) {
			page="1";
		}
		int curpage=Integer.parseInt(page);
		int rowSize=4;
		int totalpage=0;
		totalpage=StayDAO.stayLikeTotal(id);
		int start=(rowSize*curpage)-(rowSize-1);
		int end=rowSize*curpage;
		
		Map map=new HashMap();
		map.put("id", id);
		map.put("start", start);
		map.put("end", end);
		
		List<StayLikeVO> list=StayDAO.idLikeList(map);
		
		request.setAttribute("list", list);
		request.setAttribute("curpage", curpage);
		request.setAttribute("totalpage", totalpage);
		request.setAttribute("mypage_jsp", "../mypage/my_staylike.jsp");
		request.setAttribute("main_jsp", "../mypage/mypage.jsp");
		
		return "../main/main.jsp";
		
	}
}
