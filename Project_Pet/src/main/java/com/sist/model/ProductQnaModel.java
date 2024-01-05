package com.sist.model;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.sist.controller.RequestMapping;
import com.sist.dao.ProductQnaDAO;
import com.sist.dao.QnaBoardDAO;
import com.sist.vo.QnaBoardVO;

public class ProductQnaModel {

	final int rowsize=10;
	@RequestMapping("product/product_qna.do")
	public void Product_insert_review(HttpServletRequest request, HttpServletResponse response) {
			String  pno= request.getParameter("pno");
			String page=request.getParameter("page");
			if(page==null) {
				page="1";
			}
			
			int curpage=Integer.parseInt(page);
			int totalpage=ProductQnaDAO.productQnaTotalPage();
			System.out.println("토탈펭지ㅣ"+totalpage);
			curpage=Integer.parseInt(page);
			
			
			int start=(curpage*rowsize)-(rowsize-1);
			int end=(curpage*rowsize);
			   
			   Map map=new HashMap();
				map.put("start", start);
				map.put("end", end);
			
			JSONArray arr=new JSONArray();
			List<QnaBoardVO>list=ProductQnaDAO.productQnaListData(map);
			
			
			int i=0;
			for(QnaBoardVO vo : list) {
				JSONObject obj=new JSONObject();
				obj.put("qno", vo.getQno());
				obj.put("qtitle", vo.getQtitle());
				obj.put("qcontent", vo.getQcontent());
				obj.put("dbday",vo.getDbday());
				obj.put("answercheck", vo.getAnswercheck());
				obj.put("secretcheck", vo.getSecretcheck());
				obj.put("filename", vo.getFilename());
				obj.put("filesize", vo.getFilesize());
				obj.put("qwriter", vo.getQwriter());
				
				if(i==0) {
					obj.put("size", list.size());
				}
				
				arr.add(obj);
				
				i++;
			}
			
			  try
	           {
	              response.setContentType("application/x-www-form-urlencoded; charset=UTF-8");
	              PrintWriter out=response.getWriter();
	              System.out.println(arr);
	              out.write(arr.toJSONString());
	           }catch(Exception ex) {}
	         
			
			
		
	}
}
