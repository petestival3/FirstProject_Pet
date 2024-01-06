package com.sist.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.controller.RequestMapping;
import com.sist.dao.*;
import com.sist.vo.*;

public class LikeModel {
	 @RequestMapping("losedog/like_insert.do")
	   public String like_insert(HttpServletRequest request,
			   HttpServletResponse response)
	   {
		   String ldno=request.getParameter("ldno");
		   HttpSession session=request.getSession();
		   String id=(String)session.getAttribute("id");
		   LikeVO vo=new LikeVO();
		   vo.setLdno(Integer.parseInt(ldno));
		   vo.setId(id);
		   LikeDAO dao=LikeDAO.newInstance();
		   dao.LikeInsert(vo);
		   return "redirect:../losedog/losedogdetail.do?ldno="+ldno;
	   }
}
