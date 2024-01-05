package com.sist.model;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.sist.controller.RequestMapping;
import com.sist.dao.ProductDAO;
import com.sist.dao.ProductQnaDAO;
import com.sist.dao.QnaBoardDAO;
import com.sist.vo.QnaBoardVO;
import com.sist.vo.ReviewVO;

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
			int totalpage=ProductQnaDAO.productQnaTotalPage(Integer.parseInt(pno));
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
	
	//jsp로 pno값 전송 (쉐도우박스데이터받기위해)
	@RequestMapping("product/product_qna_sendData.do")
	   public String product_qna_sendData(HttpServletRequest request, HttpServletResponse response) {
	         String  pno= request.getParameter("pno");
	         
	         request.setAttribute("pno", pno);
	      return "../product/product_qna_insert.jsp";
	   }
	
	@RequestMapping("product/product_qna_handleData.do")
	   public void product_qna_handleData(HttpServletRequest request, HttpServletResponse response) {
	         String  pno= "";
	         
	         HttpSession session=request.getSession();
	         String qwriter=(String)session.getAttribute("id");
	         String qtitle = "";
	          String secretcheck = "";
	          String filename= "";
	         String qcontent="";
	         
	         ServletContext context = request.getServletContext();
	         String path = context.getRealPath("/");
	         String qnaImg="qnaImg";
	         path = path + File.separator + qnaImg;
	         
	         
	         
	          int max = 1024 * 1024 * 100;
	          
	        QnaBoardVO vo=new QnaBoardVO();

	             MultipartRequest mr;
	             
	            try {
	               mr = new MultipartRequest(request, path, max, "UTF-8", new DefaultFileRenamePolicy());
	                filename= mr.getFilesystemName("filename");
	               qtitle = mr.getParameter("qtitle");
	                secretcheck = mr.getParameter("secretcheck");
	                 pno = mr.getParameter("pno");
	                 
	                 qcontent = mr.getParameter("qcontent");
	               
	                 
	            } catch (IOException e) {
	               // TODO Auto-generated catch block
	               e.printStackTrace();
	            }
	          

	             if (filename == null) {
	                 vo.setFilename("");
	                 vo.setFilesize(0);
	             } else {
	                File file = new File(path + File.separator + filename);
	               vo.setFilename(filename);
	            
	               vo.setFilesize((int) file.length());
	             }

	          vo.setQcontent(qcontent);
	          vo.setQwriter(qwriter);
	          vo.setQtitle(qtitle);
	          vo.setSecretcheck(secretcheck);
	          vo.setPno(Integer.parseInt(pno));
	          
	          
	          
	          Map map=new HashMap();
	          map.put("qwriter", qwriter);
	          map.put("pno", pno);
	          int count=ProductQnaDAO.productQnaCount(map); 
	          
	          if (count>0) {
	             response.setStatus(HttpServletResponse.SC_BAD_REQUEST); //일부로 ajax에게 에러발생을 전달
	             }else {
	            	
	              ProductQnaDAO.productQnaInsert(vo);// count가 0일경우 insert가능
	              System.out.println("실행123");
	             }
	         
	        
	      
	   }
}
