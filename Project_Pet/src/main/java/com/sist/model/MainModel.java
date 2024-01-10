package com.sist.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.controller.DispatcherServlet;
import com.sist.controller.RequestMapping;
import java.util.*;
import com.sist.dao.*;
import com.sist.vo.*;

public class MainModel {
	@RequestMapping("main/main.do")
	public String main_main(HttpServletRequest request, HttpServletResponse response)
	{
		HttpSession session=request.getSession();
		String userid=(String)session.getAttribute("id");
		int cartNum=0;
		if(userid!=null) {
			 cartNum=ShoppingDAO.CartNum(userid);
		}
		
		
		//String homePrice=ShoppingDAO.homePrice(userid);
		
		String ssss="가평";
		ProductDAO pdao=ProductDAO.newInstace();
		List<ProductVO>plist=pdao.homeProduct();
		
		AnimalDAO adao=AnimalDAO.newInstance();
		List<AnimalVO> alist=adao.animalBlogList();
		//request.setAttribute("homePrice",homePrice);
		request.setAttribute("cartNum",cartNum);
		request.setAttribute("fds", ssss);
		request.setAttribute("plist", plist);
		request.setAttribute("alist", alist);
		request.setAttribute("main_jsp", "../main/home.jsp");
		return "../main/main.jsp";
	}
}
