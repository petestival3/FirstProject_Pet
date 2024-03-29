package com.sist.model;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.sist.controller.RequestMapping;
import com.sist.dao.*;
import com.sist.vo.*;

public class FuneralDetailModel {
	@RequestMapping("FuneralDetail/produce.do")
	public String funeral_main(HttpServletRequest request, HttpServletResponse response)
	{
		// DB 연동
	      // 1. 요청값 받기
          //없는듯???
	      // 2. DB 연동 
	      FuneralDetailDAO dao=FuneralDetailDAO.newInstance();
	      //System.out.println("funeralDetailDAO-dao="+dao);
	      List<FuneralDetailVO> list=dao.FuneralListData();
	      
	      // 3. 결과값 모아서 request에 저장
	      request.setAttribute("list", list);
		  request.setAttribute("main_jsp", "../funeralDetail/produce.jsp");
		  commonsModel.commonsHeaderData(request);
		  return "../main/main.jsp";
	}
	
	@RequestMapping("FuneralDetail/reserve.do")
	public String funeral_reserve(HttpServletRequest request, HttpServletResponse response)
	{
	      // 3. 결과값 모아서 request에 저장
		  request.setAttribute("main_jsp", "../funeralDetail/reserve.jsp");
		  commonsModel.commonsHeaderData(request);
		  return "../main/main.jsp";
	}
	
	@RequestMapping("FuneralDetail/search_f.do")
	public String funeral_search_f(HttpServletRequest request, HttpServletResponse response)
	{
	      // 3. 결과값 모아서 request에 저장
		  request.setAttribute("main_jsp", "../funeralDetail/search_f.jsp");
		  commonsModel.commonsHeaderData(request);
		  return "../main/main.jsp";
	}
	
	@RequestMapping("FuneralDetail/list_f.do")
	public String funeral_list_f(HttpServletRequest request, HttpServletResponse response)
	{
		String page=request.getParameter("page");
		  if(page==null)
			  page="1";
		  int curpage=Integer.parseInt(page);
		  
		  FuneralListDAO dao=FuneralListDAO.newInstance();
		  List<FuneralListVO> list=dao.funeralListData(curpage);
		  int totalpage=dao.funeralListTotalPage();
		  
		  final int BLOCK=10;
		  int startPage=((curpage-1)/BLOCK*BLOCK)+1;
		  int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
		  if(endPage>totalpage)
			  endPage=totalpage;
		  
		  // 출력할 데이터 전송 
		  request.setAttribute("curpage", curpage);
		  request.setAttribute("totalpage", totalpage);
		  request.setAttribute("startPage", startPage);
		  request.setAttribute("endPage", endPage);
		  request.setAttribute("list", list);
		
	      // 3. 결과값 모아서 request에 저장
		  request.setAttribute("main_jsp", "../funeralDetail/list_f.jsp");
		  commonsModel.commonsHeaderData(request);
		  return "../main/main.jsp";
	}
	

	@RequestMapping("FuneralDetail/detail_f.do")
	public String funeral_detail_f(HttpServletRequest request, HttpServletResponse response)
	{
	      // 3. 결과값 모아서 request에 저장
		  request.setAttribute("main_jsp", "../funeralDetail/detail_f.jsp");
		  commonsModel.commonsHeaderData(request);
		  return "../main/main.jsp";
	}
	
	 @RequestMapping("FuneralDetail/list_f_detail.do")
	  public void funeralFindDetailData(HttpServletRequest request,
			  HttpServletResponse response)
	  {
		// JSON 전송 
		  String fno=request.getParameter("fno");
		  FuneralListDAO dao=FuneralListDAO.newInstance();
		  FuneralListVO vo=dao.funeralFindDetailData(Integer.parseInt(fno));
		  JSONObject obj=new JSONObject();
		  //obj.put("poster", vo.getPoster());//{"poster":값,......}
		  obj.put("name", vo.getCR_COM_NAME());
		  obj.put("sector", vo.getCR_COM_SECTOR());
		  obj.put("phone", vo.getCR_COM_PHONE());
		  obj.put("loc", vo.getCR_COM_LOC());
		  obj.put("homepage", vo.getCR_COM_HOMEPAGE());
		  
		  // 전송 => ajax
		  try
		  {
			  response.setContentType("application/x-www-form-urlencoded; charset=UTF-8");
			  PrintWriter out=response.getWriter();
			  out.write(obj.toJSONString());
		  }catch(Exception ex) {}
		
	  }
}
