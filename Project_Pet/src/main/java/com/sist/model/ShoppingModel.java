package com.sist.model;

import java.io.PrintWriter;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import com.sist.controller.RequestMapping;
import com.sist.dao.ShoppingDAO;
import com.sist.vo.ProductVO;
import com.sist.vo.ShoppingVO;

public class ShoppingModel {

	@RequestMapping("shopping/shoppingCart.do")
	   public String product_qna_answer(HttpServletRequest request, HttpServletResponse response) {
			HttpSession session=request.getSession();
			String userid=(String)session.getAttribute("id");
			String type=request.getParameter("type");
			
			List<ShoppingVO>list=ShoppingDAO.shoppingCartList(userid);
			request.setAttribute("list", list);
			request.setAttribute("size", list.size());
			request.setAttribute("type", type);
	      request.setAttribute("main_jsp", "../shopping/shoppingcart.jsp");
		
	      return "../main/main.jsp";
	   }
	
	
	
	
	
	@RequestMapping("shopping/shoppingInsert.do")
	   public void shoppingInsert(HttpServletRequest request, HttpServletResponse response) {
				String pno=request.getParameter("pno");
				String buy_count=request.getParameter("buy_count");
				String buy_intprice=request.getParameter("buy_intprice");
				
				String userid="";
			
					
				DecimalFormat decimalFormat = new DecimalFormat("###,###원");
				String buy_price = decimalFormat.format(Integer.parseInt(buy_intprice)); // buy_intprice는 숫자 변수
				HttpSession session=request.getSession();
				userid=(String)session.getAttribute("id");
				Map map=new HashMap();
				
				map.put("pno", Integer.parseInt(pno));
				map.put("buy_count", Integer.parseInt(buy_count));
				map.put("buy_intprice", Integer.parseInt(buy_intprice));
				map.put("userid", userid);
				map.put("buy_price", buy_price);
				
					String msg=ShoppingDAO.shoppingInsert(map);
					
					
					JSONObject obj=new JSONObject();
					obj.put("msg",msg);
					obj.put("id", userid);
		
				  try
		           {
		              response.setContentType("application/x-www-form-urlencoded; charset=UTF-8");
		              PrintWriter out=response.getWriter();
		            
		              out.write(obj.toJSONString());
		           }catch(Exception ex) {
		        	   ex.printStackTrace();
		           }
		
	      
	   }
	
	
	@RequestMapping("shopping/shoppingCartUpdate.do")
	   public void shoppingCartUpdate(HttpServletRequest request, HttpServletResponse response) {
			String buy_count =request.getParameter("buy_count");
			String buy_intprice=request.getParameter("buy_intprice");
		
			String cbno=request.getParameter("cbno");
			
			DecimalFormat decimalFormat = new DecimalFormat("###,###원");
			String buy_price = decimalFormat.format(Integer.parseInt(buy_intprice)); // buy_intprice는 숫자 변수
			Map map=new HashMap();
			map.put("buy_count", buy_count);
			map.put("buy_intprice",buy_intprice);
			map.put("cbno",cbno);
			map.put("buy_price", buy_price);
			
			ShoppingDAO.ShoppingCartUpdate(map);
			
	     
	   }
	
	
	@RequestMapping("shopping/shoppingCartDelete.do")
	   public void shoppingCartDelet(HttpServletRequest request, HttpServletResponse response) {
			
		
			String cbno=request.getParameter("cbno");
			
			System.out.println(cbno);
			ShoppingDAO.ShoppingCartDelete(Integer.parseInt(cbno));
			
			
	     
	   }
	
	
	
	@RequestMapping("shopping/shoppingCartReset.do")
	   public void shoppingCartReset(HttpServletRequest request, HttpServletResponse response) {
			
		
				HttpSession session= request.getSession();
				String userid=(String)session.getAttribute("id");
				
			
					ShoppingDAO.ShoppingCartReset(userid);
			
			
	     
	   }
	
	
	@RequestMapping("shopping/shoppingMoveBuy.do")
	   public String shoppingMoveBuy(HttpServletRequest request, HttpServletResponse response) {
			
		
				HttpSession session= request.getSession();
				String userid=(String)session.getAttribute("id");
				String getTotal=request.getParameter("getTotal");
				
				DecimalFormat decimalFormat = new DecimalFormat("###,###원");
				String buy_price = decimalFormat.format(Integer.parseInt(getTotal)); // buy_intprice는 숫자 변수
				
				request.setAttribute("buy_intprice", Integer.parseInt(getTotal));
				request.setAttribute("buy_price", buy_price);
				
				List<ShoppingVO>list=new ArrayList<ShoppingVO>();
				list=ShoppingDAO.shoppingCartList(userid);
				int size=ShoppingDAO.buyListCount(userid);
				
				request.setAttribute("list", list);
				request.setAttribute("size", size-1);
				request.setAttribute("main_jsp", "../shopping/ProductBuy.jsp");
				
				
			
				
				 return "../main/main.jsp";
			
	     
	   }
	
	
	@RequestMapping("shopping/shoppingMoveOneBuy.do")
	   public String shoppingMoveOneBuy(HttpServletRequest request, HttpServletResponse response) {
			
		
				HttpSession session= request.getSession();
				String userid=(String)session.getAttribute("id");
				String getTotal=request.getParameter("getTotal");
				
				DecimalFormat decimalFormat = new DecimalFormat("###,###원");
				String buy_price = decimalFormat.format(Integer.parseInt(getTotal)); // buy_intprice는 숫자 변수
				
				request.setAttribute("buy_intprice", Integer.parseInt(getTotal));
				request.setAttribute("buy_price", buy_price);
				
				List<ShoppingVO>list=new ArrayList<ShoppingVO>();
				list=ShoppingDAO.shoppingCartList(userid);
				if (list.size() > 1) {
				    list.subList(1, list.size()).clear();
				}
				int size=0;
				
				request.setAttribute("list", list);
				request.setAttribute("size", size);
				request.setAttribute("main_jsp", "../shopping/ProductBuy.jsp");
				
				
			
				
				 return "../main/main.jsp";
			
	     
	   }
	
	
	
	@RequestMapping("shopping/shoppingBeforeCheck.do")
	   public void shoppingBeforeCheck(HttpServletRequest request, HttpServletResponse response) {
			
		
				HttpSession session= request.getSession();
				String userid=(String)session.getAttribute("id");
				
				
				String msg=ShoppingDAO.BeforeBuy(userid);
				
				JSONObject obj=new JSONObject();
				obj.put("msg", msg);
				  try
		           {
		              response.setContentType("application/x-www-form-urlencoded; charset=UTF-8");
		              PrintWriter out=response.getWriter();
		            
		              out.write(obj.toJSONString());
		           }catch(Exception ex) {
		        	   ex.printStackTrace();
		           }
				
			
			
	     
	   }
	
	@RequestMapping("shopping/ShoppingPostfind.do")
	public String member_postfind(HttpServletRequest request,
			  HttpServletResponse response) {
		
	
		return "../shopping/shoppingPost.jsp";
	}
	
	
	
	@RequestMapping("shopping/getSUs.do")
	public void getSUsid(HttpServletRequest request,
			  HttpServletResponse response) {
		
		try {
			response.setCharacterEncoding("UTF-8");
		} catch (Exception e) {
			// TODO: handle exception
		}
		HttpSession session =request.getSession();
		String id=(String)session.getAttribute("id");
	
		JSONObject obj= new JSONObject();
		
		obj.put("get", id);
		
		 try
         {
            response.setContentType("application/x-www-form-urlencoded; charset=UTF-8");
            PrintWriter out=response.getWriter();
          
            out.write(obj.toJSONString());
         }catch(Exception ex) {
      	   ex.printStackTrace();
         }

		
		
	}
	
	
	
	@RequestMapping("shopping/shoppingPayment.do")
	   public void shoppingPayment(HttpServletRequest request, HttpServletResponse response) {
			System.out.println("실행");
		String buy_address =request.getParameter("buy_address");
		String recipient=request.getParameter("recipient");
		String phone=request.getParameter("phone");
		String request_content =request.getParameter("request_content");
			String buy_post =request.getParameter("buy_post");
		HttpSession session=request.getSession();
		String userid=(String)session.getAttribute("id");
		
			
			
			
			
			Map map=new HashMap();
			map.put("buy_address", buy_address);
			map.put("userid", userid);
			map.put("recipient", recipient);
			map.put("phone", phone);
			map.put("buy_post", buy_post);
			map.put("request_content", request_content);
			
			ShoppingDAO.handleProductPay(map);
			
			
			
			
	     
	   }
	
	
	
	
	@RequestMapping("shopping/shoppingPaymentOne.do")
	   public void shoppingPaymentOne(HttpServletRequest request, HttpServletResponse response) {
			System.out.println("원실행");
		String buy_address =request.getParameter("buy_address");
		String recipient=request.getParameter("recipient");
		String phone=request.getParameter("phone");
		String request_content =request.getParameter("request_content");
			String buy_post =request.getParameter("buy_post");
		HttpSession session=request.getSession();
		String userid=(String)session.getAttribute("id");
		String cbno=request.getParameter("cbno");
			
			
			
			
			Map map=new HashMap();
			map.put("buy_address", buy_address);
			map.put("userid", userid);
			map.put("recipient", recipient);
			map.put("phone", phone);
			map.put("buy_post", buy_post);
			map.put("request_content", request_content);
			map.put("cbno", cbno);
			
			ShoppingDAO.handleProductPayOne(map);
			
			
			
			
	     
	   }
	
	
	
	
	@RequestMapping("shopping/shoppingComplete.do")
	   public String shoppingComplete(HttpServletRequest request, HttpServletResponse response) {
			
		  request.setAttribute("main_jsp", "../shopping/shoppingComplete.jsp");
			
			
			return "../main/main.jsp";
	     
	   }
	
	
}
