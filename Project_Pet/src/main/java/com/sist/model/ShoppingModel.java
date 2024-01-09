package com.sist.model;

import java.io.PrintWriter;
import java.text.DecimalFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import com.sist.controller.RequestMapping;
import com.sist.dao.ShoppingDAO;
import com.sist.vo.ShoppingVO;

public class ShoppingModel {

	@RequestMapping("shopping/shoppingCart.do")
	   public String product_qna_answer(HttpServletRequest request, HttpServletResponse response) {
			HttpSession session=request.getSession();
			String userid=(String)session.getAttribute("id");
			
			List<ShoppingVO>list=ShoppingDAO.shoppingCartList(userid);
			request.setAttribute("list", list);
		
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
	
	
	
}
