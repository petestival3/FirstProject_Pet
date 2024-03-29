package com.sist.model;

import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.text.DecimalFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.plaf.synth.SynthGraphicsUtils;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.sist.controller.RequestMapping;
import com.sist.dao.ProductAdminDAO;
import com.sist.dao.ProductDAO;
import com.sist.dao.ProductQnaDAO;
import com.sist.dao.ReserveFuneralDAO;
import com.sist.dao.StayReserveDAO;
import com.sist.vo.FuneralReserveInfoVO;
import com.sist.vo.ProductVO;
import com.sist.vo.QnaBoardVO;
import com.sist.vo.ReserveStayInfoVO;
import com.sist.vo.ShoppingVO;

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
		List<ReserveStayInfoVO> list=
			     StayReserveDAO.reserveAdminPageStayListData();
	  request.setAttribute("list", list);
		
		request.setAttribute("main_jsp", "../adminPage/ad_page.jsp");
		request.setAttribute("ad_page_jsp", "../adminPage/ad_res.jsp");
		
		return "../main/main.jsp";
	}
	
	//호텔 예약반려내역 취소
	  @RequestMapping("adminPage/ad_res_cancel.do")
	  public String adres_cancel(HttpServletRequest request,
			   HttpServletResponse response)
	  {
		  String no=request.getParameter("no");
		  StayReserveDAO dao=new StayReserveDAO();
		  dao.stayReserveDelete(Integer.parseInt(no));
		  return "redirect:../adminPage/ad_res.do";
	  }
	  
	//호텔 예약 승인
	@RequestMapping("adminPage/ad_res_ok.do")
	  public String admin_stay_reserve_ok(HttpServletRequest request,
			  HttpServletResponse response)
	  {
		  String no=request.getParameter("no");
		  // 데이터베이스 연동
		  StayReserveDAO.reserveStayAdminOk(Integer.parseInt(no));
		  return "redirect:../adminPage/ad_res.do";
	  }
	//호텔 예약 반려
	 @RequestMapping("adminPage/ad_res_no.do")
	  public String admin_stay_reserve_no(HttpServletRequest request,
			  HttpServletResponse response)
	  {
		  String no=request.getParameter("no");
		  // 데이터베이스 연동
		  StayReserveDAO.reserveStayAdminNo(Integer.parseInt(no));
		  return "redirect:../adminPage/ad_res.do";
	  }
	
	@RequestMapping("adminPage/ad_res_f.do")
	public String admin_res_f(HttpServletRequest request, HttpServletResponse response)
	{
		List<FuneralReserveInfoVO> list=
			     ReserveFuneralDAO.reserveAdminPageListData();
	  request.setAttribute("list", list);
		
		request.setAttribute("main_jsp", "../adminPage/ad_page.jsp");
		request.setAttribute("ad_page_jsp", "../adminPage/ad_res_f.jsp");
		
		return "../main/main.jsp";
	}
	
	//장례식장 예약반려내역 취소
	  @RequestMapping("adminPage/ad_res_f_cancel.do")
	  public String adres_f_cancel(HttpServletRequest request,
			   HttpServletResponse response)
	  {
		  String rf_no=request.getParameter("rf_no");
		  ReserveFuneralDAO dao=new ReserveFuneralDAO();
		  dao.Funeralreservedelete(Integer.parseInt(rf_no));
		  return "redirect:../adminPage/ad_res_f.do";
	  }
	//장례식장 예약 승인
	@RequestMapping("adminPage/ad_res_f_ok.do")
	  public String admin_reserve_ok(HttpServletRequest request,
			  HttpServletResponse response)
	  {
		  String rf_no=request.getParameter("rf_no");
		  // 데이터베이스 연동
		  ReserveFuneralDAO.reserveAdminOk(Integer.parseInt(rf_no));
		  return "redirect:../adminPage/ad_res_f.do";
	  }
	//장례식장 예약 반려
	 @RequestMapping("adminPage/ad_res_f_no.do")
	  public String admin_reserve_no(HttpServletRequest request,
			  HttpServletResponse response)
	  {
		  String rf_no=request.getParameter("rf_no");
		  // 데이터베이스 연동
		  ReserveFuneralDAO.reserveAdminNo(Integer.parseInt(rf_no));
		  return "redirect:../adminPage/ad_res_f.do";
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
			System.out.println("실행");
		

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
	@RequestMapping("adminPage/ad_product_stateHandleList.do")
	   public String ad_product_stateHandle(HttpServletRequest request, HttpServletResponse response) {
		String page=request.getParameter("page");
		String type=request.getParameter("type");
		if(type==null) {
			type="1";
		}
	    //p_image,p_name
		//userid,buy_date,buy_state,cbno
		
		if(page==null) {
			page="1";
		}
		int curpage=Integer.parseInt(page);
		 Map map= new HashMap();
			map.put("type", type);
			map.put("page", page);
			
			
		int totalpage=ProductAdminDAO.productStateTotal(map);
		System.out.println(totalpage);
		int start=(curpage*ROWSIZE)-(ROWSIZE-1);
		int end=(curpage*ROWSIZE);
		
		final int block=10;
		   int startpage = ((curpage-1)/block*block)+1;
		   int endpage = ((curpage-1)/block*block)+10;
		   if(endpage>totalpage) {
		      endpage=totalpage;
		   }
		
		  
			map.put("start", start);
			map.put("end", end);
		
		List<ShoppingVO>list=ProductAdminDAO.productStateList(map);
		request.setAttribute("totalpage", totalpage);
		request.setAttribute("startpage", startpage);
		request.setAttribute("endpage", endpage);
		request.setAttribute("type", type);
		request.setAttribute("list", list);
		request.setAttribute("main_jsp", "../adminPage/ad_page.jsp");
		request.setAttribute("ad_page_jsp", "../adminPage/ad_productState.jsp");
		
		return "../main/main.jsp";
		
	   }
	
	
	
	@RequestMapping("adminPage/ad_product_stateHandleUpdate.do")
	   public String ad_product_stateHandleUpdate(HttpServletRequest request, HttpServletResponse response) {
	
		String utype=request.getParameter("utype");
		String cbno=request.getParameter("cbno");
		String buy_count=request.getParameter("buyc");
		Map map= new HashMap();
		map.put("buyc", buy_count);
		map.put("cbno", cbno);
		map.put("utype", utype);
		
		int pno =ProductAdminDAO.getpnotoUp(map);
		
		
		map.put("pno", pno);
		ProductAdminDAO.productStateUpdatet(map);
		if(utype.equals("2")) {
ProductAdminDAO.pstackUpdate(map);
		}
		
		return "ad_product_stateHandleList.do";
		
	   }
	
	
	@RequestMapping("adminPage/ad_productPstackHandleList.do")
	public String ad_productPstackHandleList(HttpServletRequest request, HttpServletResponse response) {
		
		  try {
              request.setCharacterEncoding("UTF-8");
           } catch (UnsupportedEncodingException e) {
              // TODO Auto-generated catch block
              e.printStackTrace();
           }
        ProductDAO dao=ProductDAO.newInstace();
        	String msg=request.getParameter("msg");
        	
           String sct=request.getParameter("sct");
           String strpage=request.getParameter("page");
           String ss=request.getParameter("ss");
           if (sct==null) {
              sct="전체";
           }
           if (strpage==null) {
              strpage="1";
           }
           if (ss==null) {
              ss="";
           }
           
           int curpage=Integer.parseInt(strpage);
           int sTotalPage=dao.productSearchTotalPage(sct, ss);
           List<ProductVO>list=dao.productSearchList(sct, ss, curpage);
          
           
           final int block=10;
           int start = ((curpage-1)/block*block)+1;
           int end = ((curpage-1)/block*block)+10;
           if(end>sTotalPage) {
              end=sTotalPage;
           }
           
          request.setAttribute("msg", msg);
           request.setAttribute("page", strpage);
           request.setAttribute("sct", sct);
           request.setAttribute("ss", ss);
           request.setAttribute("sTotalPage", sTotalPage);
           request.setAttribute("searchList", list);
           request.setAttribute("start", start);
           request.setAttribute("end", end);
           request.setAttribute("size", list.size());
         
          
           
		
		
       	request.setAttribute("main_jsp", "../adminPage/ad_page.jsp");
		request.setAttribute("ad_page_jsp", "../adminPage/ad_productStack.jsp");
			
			return "../main/main.jsp";
			
		
	}
	
	
	
	
	@RequestMapping("adminPage/adminHandleStack.do")
	public String adminHandleStack(HttpServletRequest request, HttpServletResponse response) {
			String checkpstack=request.getParameter("pstack");
			String pno=request.getParameter("gpno");
			String quantity=request.getParameter("adminQuantity");
			String out=request.getParameter("out");
			String in=request.getParameter("in");
			String msg="";
			int cpstack=Integer.parseInt(checkpstack);
		Map map=new HashMap();
		
		map.put("buyc", quantity);
		map.put("pno", pno);

			if(in==null && cpstack<Integer.parseInt(quantity)) {
				msg="NO";
			}
			else {
				msg="YES";
			
				if(out==null) {
					map.put("type",1);
					
				}
				else if(in==null) {
					map.put("type",2);
				}
				
				ProductAdminDAO.adminpstackUpdate(map);
			}
			return "ad_productPstackHandleList.do?msg="+msg;
			
		
	}
	
	
	
	@RequestMapping("adminPage/maechul.do")
	public String maechul(HttpServletRequest request, HttpServletResponse response) {
			
		String type=request.getParameter("type");
		if(type==null) {
			type="1";
		}
		int maechul=ProductAdminDAO.maechul(Integer.parseInt(type));
		System.out.println(maechul);
		
		DecimalFormat decimalFormat = new DecimalFormat("###,###원");
		String machulPrice = decimalFormat.format(maechul); // buy_intprice는 숫자 변수
		request.setAttribute("machulPrice", machulPrice);
		request.setAttribute("type", type);
	 	request.setAttribute("main_jsp", "../adminPage/ad_page.jsp");
			request.setAttribute("ad_page_jsp","../adminPage/ad_maechul.jsp");
			return "../main/main.jsp";
			
	}

}
