package com.sist.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.controller.RequestMapping;
import com.sist.dao.*;
import com.sist.vo.*;

public class LikeModel {
	 @RequestMapping("product/like_insert.do")
	   public String like_insert(HttpServletRequest request,
			   HttpServletResponse response)
	   {
		   String pno=request.getParameter("pno");
		   HttpSession session=request.getSession();
		   String id=(String)session.getAttribute("id");
		   LikeVO vo=new LikeVO();
		   vo.setPno(Integer.parseInt(pno));
		   vo.setId(id);
		   LikeDAO dao=LikeDAO.newInstance();
		   dao.LikeInsert(vo);
		   return "redirect:../product/productDetail.do?pno="+pno;
	   }
}
