package com.sist.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.RequestMapping;

public class ShoppingModel {

	@RequestMapping("shopping/shoppingCart.do")
	   public String product_qna_answer(HttpServletRequest request, HttpServletResponse response) {
	
	      
		
	      request.setAttribute("main_jsp", "../shopping/shoppingcart.jsp");
		
	      return "../main/main.jsp";
	   }
	
	
	
}
