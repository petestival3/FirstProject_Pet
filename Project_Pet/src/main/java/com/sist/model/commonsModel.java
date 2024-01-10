package com.sist.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.sist.dao.ShoppingDAO;
import com.sist.dao.StayDAO;

public class commonsModel {
	public static void commonsHeaderData(HttpServletRequest request) {
		// 1. 공지사항 => hit가 많은 
		HttpSession session=request.getSession();
		String userid=(String)session.getAttribute("id");
		int cartNum=0;
		if(userid!=null) {
			 cartNum=ShoppingDAO.CartNum(userid);
		}
		
		StayDAO sdao=StayDAO.newInstance();
		int likeNum=0;
		if(userid!=null) {
			likeNum=sdao.likeCountHeader(userid);
		}else {
			likeNum=0;
		}
		
		request.setAttribute("likeNum", likeNum);
		request.setAttribute("cartNum",cartNum);
	}
}
