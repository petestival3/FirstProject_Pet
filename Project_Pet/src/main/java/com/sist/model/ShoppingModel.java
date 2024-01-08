package com.sist.model;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import com.sist.controller.RequestMapping;
import com.sist.dao.ShoppingDAO;

public class ShoppingModel {

	@RequestMapping("shopping/shoppingCart.do")
	   public String product_qna_answer(HttpServletRequest request, HttpServletResponse response) {
				
	      request.setAttribute("main_jsp", "../shopping/shoppingcart.jsp");
		
	      return "../main/main.jsp";
	   }
	
	
	
	@RequestMapping("shopping/shoppingInsert.do")
	   public void shoppingInsert(HttpServletRequest request, HttpServletResponse response) {
				String pno=request.getParameter("pno");
				String buy_count=request.getParameter("buy_count");
				String buy_intprice=request.getParameter("buy_intprice");
				String userid="";
			
				HttpSession session=request.getSession();
				userid=(String)session.getAttribute("id");
				Map map=new HashMap();
				
				map.put("pno", Integer.parseInt(pno));
				map.put("buy_count", Integer.parseInt(buy_count));
				map.put("buy_intprice", Integer.parseInt(buy_intprice));
				map.put("userid", userid);
				
					String msg=ShoppingDAO.shoppingInsert(map);
					
					System.out.println(msg);
					JSONObject obj=new JSONObject();
					obj.put("msg",msg);
		
				  try
		           {
		              response.setContentType("application/x-www-form-urlencoded; charset=UTF-8");
		              PrintWriter out=response.getWriter();
		            
		              out.write(obj.toJSONString());
		           }catch(Exception ex) {
		        	   ex.printStackTrace();
		           }
		
	      
	   }
	
	
	
}
