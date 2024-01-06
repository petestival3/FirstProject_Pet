package com.sist.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.controller.RequestMapping;
import com.sist.dao.*;
import com.sist.vo.*;

public class LikeModel {
	 @RequestMapping("losedog/like_insert.do")
	   public String like_dog_insert(HttpServletRequest request,
			   HttpServletResponse response)
	   {
		   String ldno=request.getParameter("ldno");
		   HttpSession session=request.getSession();
		   String id=(String)session.getAttribute("id");
		   LikeDogVO vo=new LikeDogVO();
		   vo.setLdno(Integer.parseInt(ldno));
		   vo.setId(id);
		   LikeDAO dao=LikeDAO.newInstance();
		   dao.DogLikeInsert(vo);
		   return "redirect:../losedog/losedogdetail.do?ldno="+ldno;
	   }
	 
	 @RequestMapping("losecat/like_insert.do")
	   public String like_cat_insert(HttpServletRequest request,
			   HttpServletResponse response)
	   {
		   String lcno=request.getParameter("lcno");
		   HttpSession session=request.getSession();
		   String id=(String)session.getAttribute("id");
		   LikeCatVO vo=new LikeCatVO();
		   vo.setLcno(Integer.parseInt(lcno));
		   vo.setId(id);
		   LikeDAO dao=LikeDAO.newInstance();
		   dao.CatLikeInsert(vo);
		   return "redirect:../losecat/losecatdetail.do?lcno="+lcno;
	   }
}
