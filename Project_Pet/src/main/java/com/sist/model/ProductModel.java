package com.sist.model;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.RequestMapping;
import com.sist.dao.ProductDAO;
import com.sist.vo.ProductVO;
import com.sist.vo.ReviewVO;
import com.sist.vo.ProductVO;

public class ProductModel {
	
	

	@RequestMapping("product/ProductList.do")
public String productList(HttpServletRequest request, HttpServletResponse response) {
	String strpage=request.getParameter("page");
	String ct=request.getParameter("ct");
	String rt=request.getParameter("rt");
	List<ProductVO>list=null;
	
	ProductDAO dao=ProductDAO.newInstace();
	if (strpage==null) {
		strpage="1";
	}
	if (ct==null) {
		ct="전체";
	}
	if(rt==null) {
		
		rt="p_intprice";
	}

	int curpage=Integer.parseInt(strpage);
	int totalpage=dao.productTotalPage(ct);
	
	final int block=10;
	int start = ((curpage-1)/block*block)+1;
	int end = ((curpage-1)/block*block)+10;
	if(end>totalpage) {
		end=totalpage;
	}
		
	if(rt.equals("p_stack")) {
		list=dao.productBystackList(ct, curpage);
		totalpage=dao.productByStackTotalPage(ct);
		if(end>totalpage) {
			end=totalpage;
		}
	}
	else if (rt.equals("p_intprice")) {
		list=dao.productByASCList(ct, curpage,rt);
	
	}
	else {
		list=dao.productByDescList(ct, curpage, rt);
	
	}
	
	
	
	List<Integer>catenumList=dao.ProductCateNum();	
	List<ProductVO>highSaleList=dao.highSaleList();
	
	

		request.setAttribute("highSaleList", highSaleList);
		request.setAttribute("product_jsp", "../product/ProductList.jsp");
		request.setAttribute("main_jsp", "../product/ProductMain.jsp");
		request.setAttribute("list", list);
		request.setAttribute("page", strpage);
		request.setAttribute("ct", ct);
		request.setAttribute("totalpage", totalpage);
		request.setAttribute("start", start);
		request.setAttribute("end", end);
		request.setAttribute("rt", rt);
		request.setAttribute("cateNumList", catenumList);
	
	return "../main/main.jsp";
}
	
	
	
	
	
	
	
	//파라미터값으로 상품에대한 페이지,카테고리등 정보를 받고 requestScope에 저장함 (setattribute)
	//이유는 detail.jsp 에서 목록으로 돌아갈떄 el로 꺼내고 , 최근본상품에서 디테일로 바로 넘어갈떄 el이용해서 넘어가야 하기때문
	//parameter값으로 넘기면 jsp에서 자바를 사용해야한다
	//여기서는 요청처리후 detail.jsp로 이동
	@RequestMapping("product/productDetail.do")
	public String productDetail(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		String strpage=request.getParameter("page");
		String ct=request.getParameter("ct");
		String rt=request.getParameter("rt");
		String pno=request.getParameter("pno");
		String lcount=request.getParameter("count");
		String ss=request.getParameter("ss");
		
			ProductDAO dao=ProductDAO.newInstace();
			ProductVO vo =dao.productDetail(Integer.parseInt(pno));
			List<ProductVO>subImageList=dao.productSubImage(Integer.parseInt(pno));
			List<ReviewVO>prList=dao.product_reviewHighScoreList(1, Integer.parseInt(pno));
			request.setAttribute("subImageList", subImageList);
			request.setAttribute("vo", vo);
			request.setAttribute("main_jsp", "../product/productDetail.jsp");
			request.setAttribute("page", strpage);
			request.setAttribute("ct", ct);
			request.setAttribute("rt", rt);
			request.setAttribute("lcount",lcount);//목록으로 돌아가는 카운트
			request.setAttribute("ss", ss);
			request.setAttribute("prList", prList);
			request.setAttribute("prListSize", prList.size());
			
			List<ProductVO>clist=new ArrayList<ProductVO>();
			List<ProductVO>rlist=dao.productRelativeList(Integer.parseInt(pno));
			request.setAttribute("rlist", rlist);
			request.setAttribute("rlistSize", rlist.size());
			try {
			
				Cookie[] cookies=request.getCookies();
							
				if(cookies!=null) {
					int  count =0;
					for(int i=cookies.length-1;i>=0;i--) {
						
						if (cookies[i].getName().startsWith("pno_")) {
							String cvalue=cookies[i].getValue();
							int cpno=Integer.parseInt(cvalue);
							ProductVO cvo =dao.productDetail_Before(cpno);
							clist.add(cvo);
							count ++;
							
							request.setAttribute("clist", clist);
							request.setAttribute("count", clist.size());//쿠키목록출력카운트
							if(count==5) {
								break;
							}
							
						}	
					}
					}
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			
			
			return "../main/main.jsp";
		}
			
			
			
			
			
			
			
			
	
	//리스트에서 상세보기 클릭하면 거침 쿠키설정후 쿠키를 보내고 파라미터값으로 페이지,카테고리등등정보보냄(목록으로 돌아가기 위함)=> detail.do로이동
	@RequestMapping("product/DetailBefore.do")
	public String DetailBefore(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String count=request.getParameter("count");
		String pno=request.getParameter("pno");
		String strpage=request.getParameter("page");
		String ct=request.getParameter("ct");
		String rt=request.getParameter("rt");
		String ss=request.getParameter("ss");
		
		try {
		    if (ct != null) {
		        ct = java.net.URLEncoder.encode(ct, "UTF-8");
		    }
		    if (ss != null) {
		        ss = java.net.URLEncoder.encode(ss, "UTF-8");
		    }
		} catch (UnsupportedEncodingException e) {
		    e.printStackTrace();
		}
		
			Cookie cookie=new Cookie("pno_"+pno, pno);
			cookie.setPath("/");
			cookie.setMaxAge(60*60*24);
			response.addCookie(cookie);
			
				
		
		return "redirect:../product/productDetail.do?pno="+pno+"&rt="+rt+"&page="+strpage+"&ct="+ct+"&count="+count+"&ss="+ss;
	}
	
	
	
	//목록 돌아가기 최근 상품 디테일에선 디폴트 목록 , 일반 디테일에선 보던 목록으로 돌아감
	//detailback.do 수행후 파라미터값이 있냐 없냐 를 따져서 productlist.do 메소드로 이동
	
	@RequestMapping("product/DetailListBack.do")
	public String DetailListBack(HttpServletRequest request, HttpServletResponse response) {
		String ct=request.getParameter("ct");
		String ss=request.getParameter("ss");
		
		try {
			ss=java.net.URLEncoder.encode(ss,"UTF-8");
			ct=java.net.URLEncoder.encode(ct,"UTF-8");
			
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		String strpage=request.getParameter("page");
		String rt=request.getParameter("rt");
		String send="redirect:../product/ProductList.do?page="+strpage+"&ct="+ct+"&rt="+rt;
		String lcount=request.getParameter("lcount");
	

	
	if (lcount.equals("1")) {
		send="redirect:../product/ProductList.do";
	}
	else if(lcount.equals("2")) {	
		
	send="redirect:../product/ProductSearchList.do?page="+strpage+"&sct="+ct+"&ss="+ss;
	
	}
	else if(lcount.equals("3")){
		send="redirect:../main/main.do";
	}
		
		return send;
	}
	
	@RequestMapping("product/ProductSearchList.do")
	public String ProductSearchList(HttpServletRequest request, HttpServletResponse response) {
				try {
					request.setCharacterEncoding("UTF-8");
				} catch (UnsupportedEncodingException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			ProductDAO dao=ProductDAO.newInstace();
		
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
				List<Integer>catenumList=dao.ProductCateNum();	
				List<ProductVO>highSaleList=dao.highSaleList();
				
				final int block=10;
				int start = ((curpage-1)/block*block)+1;
				int end = ((curpage-1)/block*block)+10;
				if(end>sTotalPage) {
					end=sTotalPage;
				}
				
				request.setAttribute("highSaleList", highSaleList);
				request.setAttribute("page", strpage);
				request.setAttribute("sct", sct);
				request.setAttribute("ss", ss);
				request.setAttribute("sTotalPage", sTotalPage);
				request.setAttribute("searchList", list);
				request.setAttribute("start", start);
				request.setAttribute("end", end);
				request.setAttribute("size", list.size());
				request.setAttribute("cateNumList", catenumList);
				request.setAttribute("product_jsp", "../product/ProductSearchList.jsp");
				request.setAttribute("main_jsp", "../product/ProductMain.jsp");
				
		
		
		return "../main/main.jsp";
	}
	
	
	
	
	
	
	@RequestMapping("product/Product_insert_review.do")
	public String Product_insert_review(HttpServletRequest request, HttpServletResponse response) {
			
		return "../product/product_insert_review.jsp";
	}
	
	
	
}
