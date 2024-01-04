package com.sist.model;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.*;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.sist.vo.*;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
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
	
	@RequestMapping("review/insert_ok.do")
	public String review_insertok(HttpServletRequest request,HttpServletResponse response) {
		
		try {
			request.setCharacterEncoding("UTF-8");
		}catch(Exception ex) {}
		
		HttpSession session=request.getSession();
		String name=(String)session.getAttribute("name");
		String writer=name;
		
		String score = "";
		String content = "";
		String objno = "";
		String typeno = "";
		
		ServletContext context = request.getServletContext();
		String path = context.getRealPath("/");
		String reviewImg="reviewImg";
		path = path + File.separator + reviewImg;
		
		int max = 1024 * 1024 * 100;
		ReviewVO vo=new ReviewVO();
		MultipartRequest mr;
	    String imgname="";
	    try {
			mr = new MultipartRequest(request, path, max, "UTF-8", new DefaultFileRenamePolicy());
			imgname= mr.getFilesystemName("upload");
			score = mr.getParameter("rating3");
			content = mr.getParameter("content");
			objno = mr.getParameter("sno");
			typeno = mr.getParameter("type");
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	    
	    if (imgname == null) {
	        vo.setImgname("");
	        vo.setImgsize(0);
	    } else {
	    	File file = new File(path + File.separator + imgname);
	      vo.setImgname(imgname);
	      vo.setImgsize((int) file.length());
	    }
		
		vo.setContent(content);
		vo.setObjno(Integer.parseInt(objno));
		vo.setTypeno(Integer.parseInt(typeno));
		vo.setScore(Double.parseDouble(score));
		vo.setWriter(writer);
		
		ReviewDAO dao=ReviewDAO.newInstance();
		dao.reviewInsert(vo);
		
		return "redirect:../stay/detail_before.do?stayno="+objno;
	}
	
	@RequestMapping("review/insert.do")
	public String review_insert(HttpServletRequest request,HttpServletResponse response) {
		
		String sno=request.getParameter("stayno");
		request.setAttribute("sno", sno);
		return "../review/reviewinsert.jsp";
	}
	
}
