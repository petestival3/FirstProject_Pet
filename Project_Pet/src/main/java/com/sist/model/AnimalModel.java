package com.sist.model;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.RequestMapping;
import com.sist.dao.*;
import com.sist.vo.*;
public class AnimalModel {
	@RequestMapping("animal/animalBlog.do")
	public String animal_main(HttpServletRequest request, HttpServletResponse response)
	{
		// 요청값 ??
		AnimalDAO dao=AnimalDAO.newInstance(); // 싱글턴
		List<AnimalVO> list=dao.animalBlogList();
		
		request.setAttribute("list", list);
		request.setAttribute("blog_jsp", "../animal/animalBlog.jsp");
		return "../main/main.jsp";
	}
}
