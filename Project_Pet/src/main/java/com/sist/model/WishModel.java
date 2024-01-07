package com.sist.model;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.controller.RequestMapping;
import com.sist.dao.*;
import com.sist.vo.*;
/*
--<입양희망 테이블(임시보호)>
CREATE TABLE CD_WISH(
 cdno NUMBER,
 id VARCHAR2(20) ,
 kano NUMBER ,
 CONSTRAINT cd_cdno_pk PRIMARY KEY (cdno),
 CONSTRAINT cd_id_fk FOREIGN KEY(id) REFERENCES MEMBER(id),
 CONSTRAINT cd_kano_fk FOREIGN KEY(kano) REFERENCES KEEPANIMAL2(kano)
);

--<입양희망 시퀀스(임시보호)>
CREATE SEQUENCE cd_cdno_seq 
START WITH 1
INCREMENT BY 1
NOCYCLE
NOCACHE;
*/
public class WishModel {
/*
	@RequestMapping("mypage/my_JJim.do")
	public String mypage_jjim(HttpServletRequest request, HttpServletResponse response)
	{
		request.setAttribute("mypage_jsp", "../mypage/my_JJim.jsp");
		request.setAttribute("main_jsp", "../mypage/mypage.jsp");
		return "../main/main.jsp";
	}
	*/
	 @RequestMapping("animal/wish_insert.do")
	   public String wish_insert(HttpServletRequest request,
			   HttpServletResponse response)
	   {
		   String kano=request.getParameter("kano");
		   HttpSession session=request.getSession();
		   String id=(String)session.getAttribute("id");
		   WishVO vo=new WishVO();
		   vo.setKano(Integer.parseInt(kano));
		   vo.setId(id);
		   WishDAO dao=WishDAO.newInstance();
		   dao.WishInsert(vo);
		   return "redirect:../animal/animaldetail.do?kano="+kano;
	   }
	 
	   @RequestMapping("animal/wish_cancel.do")
	   public String wish_cancel(HttpServletRequest request,
			   HttpServletResponse response)
	   {
           String cdno=request.getParameter("cdno");
		   WishDAO dao=WishDAO.newInstance();
		   dao.WishCancel(Integer.parseInt(cdno));
		   return "redirect:../animal/animaldetail.do?cdno="+cdno;
	   }
}
