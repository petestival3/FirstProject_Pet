package com.sist.model;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.sist.controller.RequestMapping;
import com.sist.dao.ProductQnaDAO;
import com.sist.vo.QnaBoardVO;

public class AdminPageModel {
	
	private final int ROWSIZE=10;
	@RequestMapping("adminPage/ad_page.do")
	public String admin_main(HttpServletRequest request, HttpServletResponse response)
	{
	      // 3. 결과값 모아서 request에 저장
		  request.setAttribute("main_jsp", "../adminPage/ad_page.jsp");
		  request.setAttribute("ad_page_jsp", "../adminPage/ad_main.jsp");
		  return "../main/main.jsp";
	}
	

	@RequestMapping("adminPage/ad_res.do")
	public String admin_res(HttpServletRequest request, HttpServletResponse response)
	{
		request.setAttribute("main_jsp", "../adminPage/ad_page.jsp");
		request.setAttribute("ad_page_jsp", "../adminPage/ad_res.jsp");
		
		return "../main/main.jsp";
	}
	
	@RequestMapping("adminPage/ad_payment.do")
	public String admin_payment(HttpServletRequest request, HttpServletResponse response)
	{
		request.setAttribute("main_jsp", "../adminPage/ad_page.jsp");
		request.setAttribute("ad_page_jsp", "../adminPage/ad_payment.jsp");
		
		return "../main/main.jsp";
	}
	
	
	@RequestMapping("adminPage/ad_productQnaList.do")
	public String ad_productQnaList(HttpServletRequest request, HttpServletResponse response) {
			
		

			String page=request.getParameter("page");
			String type=request.getParameter("type");//미완료,완료
			
			if(page==null) {
				page="1";
			}
			if(type==null) {
				type="1";
			}
			
			
			int curpage=Integer.parseInt(page);
			int count=ProductQnaDAO.productAdminQnaCount(Integer.parseInt(type));
			int totalpage=(int)Math.ceil(count/10.0);
			int rowCount=count-((curpage*10)-10);
			
				
			int start=(curpage*ROWSIZE)-(ROWSIZE-1);
			int end=(curpage*ROWSIZE);
			
			final int block=10;
			   int startpage = ((curpage-1)/block*block)+1;
			   int endpage = ((curpage-1)/block*block)+10;
			   if(endpage>totalpage) {
			      endpage=totalpage;
			   }
			   
			   Map map=new HashMap();
				map.put("start", start);
				map.put("end", end);
				map.put("page",curpage );
				map.put("type", type);
				
			
			List<QnaBoardVO>list=ProductQnaDAO.productQnaAdminListData(map);
			
			
			request.setAttribute("page", page);
			request.setAttribute("startpage", startpage);
			request.setAttribute("rowcount", rowCount);
			request.setAttribute("endpage", endpage);
			request.setAttribute("list", list);
			request.setAttribute("type", type);
			request.setAttribute("totalpage", totalpage);
			
			
			request.setAttribute("main_jsp", "../adminPage/ad_page.jsp");
			request.setAttribute("ad_page_jsp", "../adminPage/ad_product_qna.jsp");
			
			return "../main/main.jsp";
			
		
	}
	
	@RequestMapping("adminPage/ad_product_qna_move.do")
	public String ad_product_qna_move(HttpServletRequest request, HttpServletResponse response)
	{
		
		String qno=request.getParameter("qno");
		String p_name=ProductQnaDAO.ProductQnaGetPname(Integer.parseInt(qno));
		QnaBoardVO vo=ProductQnaDAO.productQnaNoAnswerData(Integer.parseInt(qno));
		 if(vo.getFilename()==null) {
        	 vo.setFilename("no");
         }
        
		
	
		request.setAttribute("p_name", p_name);
		request.setAttribute("qno", qno);
		request.setAttribute("vo", vo);
		
		return "../adminPage/ad_product_qnaAnswer.jsp";
	}
	
	@RequestMapping("admin/ad_qna_answerInsert.do")
	   public String product_qna_answerInsert(HttpServletRequest request, HttpServletResponse response) {
		String qno=request.getParameter("qno");
		String ancontent=request.getParameter("ancontent");
		String antitle=request.getParameter("antitle");
		
	      Map map=new HashMap();
	      map.put("qno", qno);
	      map.put("ancontent",ancontent);
	      map.put("antitle", antitle);
	      
	      ProductQnaDAO.productQnaAnswerInsert(map,Integer.parseInt(qno));
		
		
		
		return "redirect:../adminPage/ad_productQnaList.do";
	   }
	

}
