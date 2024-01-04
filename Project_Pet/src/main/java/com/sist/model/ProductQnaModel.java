package com.sist.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.RequestMapping;
import com.sist.dao.ProductQnaDAO;
import com.sist.dao.QnaBoardDAO;
import com.sist.vo.QnaBoardVO;

public class ProductQnaModel {

	
	@RequestMapping("product/product_qna.do")
	public String Product_insert_review(HttpServletRequest request, HttpServletResponse response) {
			String  pno= request.getParameter("pno");
			
			
			
			List<QnaBoardVO>list=ProductQnaDAO.productQnaListData();
			System.out.println(list.size());
			
			request.setAttribute("pno", pno);
		return "../product/product_insert_review.jsp";
	}
}
