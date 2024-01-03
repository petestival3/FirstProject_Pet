package com.sist.model;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.sist.vo.*;
import com.sist.controller.RequestMapping;
import com.sist.dao.*;
public class ReviewModel {
	/*
	 * @RequestMapping("review/list.do") public String
	 * review_list(HttpServletRequest request, HttpServletResponse response) {
	 * 
	 * return "../" }
	 */
	@RequestMapping("review/list.do")
	public void review_list(HttpServletRequest request,HttpServletResponse response) {
		  String typeno=request.getParameter("typeno");
		  String objno=request.getParameter("objno");
		  String page=request.getParameter("revpage");
		  if(page==null)
			  page="1";
		  ReviewDAO dao=ReviewDAO.newInstance();
		  // JSON변경 
		  // VO => {} ==> JSONObject
		  // List => [{},{}...] ==> JSONArray
		  JSONArray arr=new JSONArray();//[]
		  //[{count:0},]
			  List<ReviewVO> revlist=dao.ReviewListData(Integer.parseInt(typeno), Integer.parseInt(objno), Integer.parseInt(page));
			  for(ReviewVO vo:revlist)
			  {
				  JSONObject obj=new JSONObject();
				  // {zipcode:111,address:'...',count:2},{}
				  obj.put("revno", vo.getRevno());
				  obj.put("objno", vo.getObjno());
				  obj.put("typeno", vo.getTypeno());
				  obj.put("imgsize", vo.getImgsize());
				  obj.put("imgname", vo.getImgname());
				  obj.put("score", vo.getScore());
				  obj.put("writer", vo.getWriter());
				  obj.put("content", vo.getContent());
				  obj.put("dbday", vo.getDbday());
				  obj.put("revdate", vo.getRevdate());
				  arr.add(obj);
			  }
			  /*
			   *    private int revno,objno,typeno,imgsize;
					private double score;
					private String writer,content,imgname,dbday;
					private Date revdate;
			   */
		  try
		  {
			  response.setContentType("application/x-www-form-urlencoded; charset=UTF-8");
			  PrintWriter out=response.getWriter();
			  out.write(arr.toJSONString());
		  }catch(Exception ex) {}
	}
	
	@RequestMapping("review/insert.do")
	public String review_insert(HttpServletRequest request,HttpServletResponse response) {
		
		try {
			request.setCharacterEncoding("UTF-8");
		}catch(Exception ex) {}
		
		HttpSession session=request.getSession();
		String name=(String)session.getAttribute("name");
		String objno=request.getParameter("objno");
		String typeno=request.getParameter("type");
		String writer=name;
		String score=request.getParameter("rating3");
		String Content=request.getParameter("content");
		
		ReviewVO vo=new ReviewVO();
		vo.setContent(Content);
		vo.setObjno(Integer.parseInt(objno));
		vo.setTypeno(Integer.parseInt(typeno));
		vo.setScore(Double.parseDouble(score));
		vo.setWriter(writer);
		
		ReviewDAO dao=ReviewDAO.newInstance();
		dao.reviewInsert(vo);
		
		return "redirect:../stay/detail_before.do?stayno="+objno;
	}
	
	
}
