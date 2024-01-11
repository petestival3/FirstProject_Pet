package com.sist.model;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.locks.ReentrantLock;

import javax.naming.Context;
import javax.servlet.ServletContext;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JPopupMenu.Separator;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.sist.controller.RequestMapping;
import com.sist.dao.ProductDAO;
import com.sist.dao.ShoppingDAO;
import com.sist.dao.StayDAO;
import com.sist.vo.ProductVO;
import com.sist.vo.ReviewVO;
import com.sist.vo.ProductVO;

public class ProductModel {
   
   
   //상품 리스트 모델
   @RequestMapping("product/ProductList.do")
public String productList(HttpServletRequest request, HttpServletResponse response) {
	   HttpSession session=request.getSession();
		String userid=(String)session.getAttribute("id");
		int cartNum=0;
		if(userid!=null) {
			 cartNum=ShoppingDAO.CartNum(userid);
		}
		request.setAttribute("cartNum",cartNum);
		StayDAO sdao=StayDAO.newInstance();
		int likeNum=0;
		if(userid!=null) {
			likeNum=sdao.likeCountHeader(userid);
		}else {
			likeNum=0;
		}
		request.setAttribute("likeNum", likeNum);
		
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
      
      rt="p_buyamount";
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
   List<ProductVO>newProductList=dao.newProductList();
   List<ProductVO>hotPriceList=dao.hotpriceList();
   
   	  request.setAttribute("hotpriceList", hotPriceList);
   	  request.setAttribute("newProductList", newProductList);
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
   //상품 디테일 모델
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
         
         for (ReviewVO vo2 : prList) {
        	 String qwriter=vo2.getWriter();
        	  String printQwriter = "";
			
			 if (qwriter.length() > 3) {
		            printQwriter = qwriter.substring(0, qwriter.length() - 3) + "***";
		        } else if (qwriter.length() == 3) {
		            printQwriter = qwriter.substring(0, qwriter.length() - 2) + "**";
		        } else if (qwriter.length() == 2) {
		            printQwriter = "**" + qwriter.substring(0, qwriter.length() - 1) + "*";
		        } else {
		            printQwriter = qwriter;
		        }
			 
			 vo2.setWriter(printQwriter);
		}
         
         int qnaAmount=dao.QnaAmount(Integer.parseInt(pno));
         int reviewTotalPage=dao.product_review_totalPage(Integer.parseInt(pno));
         
        
         request.setAttribute("qnaAmount", qnaAmount);
         request.setAttribute("reviewTotalPage", reviewTotalPage);
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
         
         int prTotalpage=dao.product_review_totalPage(Integer.parseInt(pno));
         List<ProductVO>clist=new ArrayList<ProductVO>();
         List<ProductVO>rlist=dao.productRelativeList(Integer.parseInt(pno));
         request.setAttribute("rlist", rlist);
         request.setAttribute("rlistSize", rlist.size());
         request.setAttribute("prTotalpage", prTotalpage);
         
        HttpSession session=request.getSession();
         String id=(String)session.getAttribute("id");
         
     
 		
 		int cartNum=0;
 		if(id!=null) {
 			 cartNum=ShoppingDAO.CartNum(id);
 		}
 		request.setAttribute("cartNum",cartNum);
 		StayDAO sdao=StayDAO.newInstance();
 		int likeNum=0;
 		if(id!=null) {
 			likeNum=sdao.likeCountHeader(id);
 		}else {
 			likeNum=0;
 		}
 		request.setAttribute("likeNum", likeNum);
 		
 		
         
         try {
         
            Cookie[] cookies=request.getCookies();
                     
            if(cookies!=null) {
               int  count =0;
               for(int i=cookies.length-1;i>=0;i--) {
                  
                  if (cookies[i].getName().startsWith(id+"_pno_")) {
                     String cvalue=cookies[i].getValue();
                     
                     int cpno=Integer.parseInt(cvalue);
                     ProductVO cvo =dao.productDetail_Before(cpno);
                     int cvReviewAmount=0;
                     cvReviewAmount=dao.reviewAmount(cvo.getPno());//최근본상품 리뷰개수
                     cvo.setP_review_num(cvReviewAmount);
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
         
         
         
         
         
         
         
         
   //상품 디테일 이동전 쿠키저장을 위한 모델
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
      	
      HttpSession session=request.getSession();
      String id=(String)session.getAttribute("id");
      
      if(id!=null) {
    	  
    
         Cookie cookie=new Cookie(id+"_pno_"+pno, pno);
         cookie.setPath("/");
         cookie.setMaxAge(60*60*24);
         response.addCookie(cookie);
         
      }
      
      return "redirect:../product/productDetail.do?pno="+pno+"&rt="+rt+"&page="+strpage+"&ct="+ct+"&count="+count+"&ss="+ss;
   }
   
   
   
   //목록 돌아가기 최근 상품 디테일에선 디폴트 목록 , 일반 디테일에선 보던 목록으로 돌아감
   //detailback.do 수행후 파라미터값이 있냐 없냐 를 따져서 productlist.do 메소드로 이동
   //상품상세보기에서 목록으로 돌아가기 클릭시 홈화면으로 돌아가냐,이전보던 페이지,카테고리 로 돌아가냐 , 삼품리스트 초기화면으로 돌아가냐를 선택하는 모델(lcount를 활용)
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
   else if(lcount.equals("4")) {
	   send="redirect:../adminPage/ad_productQnaList.do";
   }
   else if(lcount.equals("5")) {
	   send="redirect:../shopping/shoppingCart.do";
   }
      
      return send;
   }
   
   
   //상품검색리스트 모델
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
   
   
   
   
   
   //상품 리뷰입력 모델(ajax)
   @RequestMapping("product/Product_insert_review.do")
   public String Product_insert_review(HttpServletRequest request, HttpServletResponse response) {
         String  pno= request.getParameter("pno");
         
         request.setAttribute("pno", pno);
      return "../product/product_insert_review.jsp";
   }
   
   
   //상품 리뷰입력시 데이터처리를 위한모델 (ajax)
   @RequestMapping("product/Product_handle_review.do")
   public void Product_handle_review(HttpServletRequest request, HttpServletResponse response) {
      
        try {
              request.setCharacterEncoding("UTF-8");
          } catch (Exception ex) {}

           
         
         HttpSession session=request.getSession();
         String writer=(String)session.getAttribute("id");
         String score = "";
          String content = "";
          String pno = "";
         
         ServletContext context = request.getServletContext();
         String path = context.getRealPath("/");
         String reviewImg="reviewImg";
         path = path + File.separator + reviewImg;
         
         
         
          int max = 1024 * 1024 * 100;
          ProductDAO dao =ProductDAO.newInstace();
          ReviewVO vo=new ReviewVO();

             MultipartRequest mr;
             String imgname="";
            try {
               mr = new MultipartRequest(request, path, max, "UTF-8", new DefaultFileRenamePolicy());
                imgname= mr.getFilesystemName("image");
               score = mr.getParameter("score");
                content = mr.getParameter("content");
                 pno = mr.getParameter("pno");
               
            } catch (IOException e) {
               // TODO Auto-generated catch block
               e.printStackTrace();
            }
          

             if (imgname == null) {
                 vo.setImgname("");
                 vo.setImgsize(0);
             } else {
                File file = new File(path + File.separator + imgname);
               vo.setImgname(imgname);
               vo.setImgsize((int) file.length());
             }

          vo.setContent(content);
          vo.setWriter(writer);
          vo.setScore(Double.parseDouble(score));
          vo.setObjno(Integer.parseInt(pno));
          
          int count=dao.reviewUserCount(Integer.parseInt(pno), writer);
          
          if (count>0) {
             response.setStatus(HttpServletResponse.SC_BAD_REQUEST); //일부로 ajax에게 에러발생을 전달
             }else {
               dao.insertProductReview(vo); // count가 0일경우 insert가능
             }
          
        
          
         
   }
   
   //상품 리뷰를 ajax로 새로고침된 리스트를 보내기 위한 모델
   @RequestMapping("product/Product_review_newList.do")
   public void Product_review_newList(HttpServletRequest request, HttpServletResponse response) {
      System.out.println("실행");
      try {
         request.setCharacterEncoding("UTF-8");
      } catch (Exception e) {
         // TODO: handle exception
      }
      
         String  pno= request.getParameter("pno");
         String page=request.getParameter("page");
         String type=request.getParameter("type");
         
         int curpage=Integer.parseInt(page);
         
         ProductDAO dao=ProductDAO.newInstace();
         
         /*
            * writer,TO_CHAR(revdate,'YYYY-MM-DD HH24:MI:SS'),content,imgname,imgsize,score
            * 
            */
         HttpSession session =request.getSession();
         String id=(String)session.getAttribute("id");
         
         int reviewAmount=dao.reviewAmount(Integer.parseInt(pno));
         JSONArray arr=new JSONArray();
         List<ReviewVO>list=null;
         if(type.equals("1")) {
            //높은 평점순 
            list=dao.product_reviewHighScoreList(curpage, Integer.parseInt(pno));
         }
         
         
         if(type.equals("2")) {
            list=dao.product_reviewLowScoreList(curpage, Integer.parseInt(pno));
         }
         
         if(type.equals("3")) {
            list=dao.product_reviewLatestDateList(curpage, Integer.parseInt(pno));
         }
         
         if(type.equals("4")) {
            list=dao.product_reviewOldDateList(curpage, Integer.parseInt(pno));
         }
      double newGrade=dao.newGrade(Integer.parseInt(pno));
      int totalpage=dao.product_review_totalPage(Integer.parseInt(pno));
      
         int i=0;
         
         for (ReviewVO vo : list) {
            JSONObject obj=new JSONObject();
               
            
            obj.put("writer", vo.getWriter());
            obj.put("dbday", vo.getDbday());
            obj.put("content", vo.getContent());
            obj.put("imgname", vo.getImgname());
            obj.put("imgsize", vo.getImgsize());
            obj.put("score", vo.getScore());
            
            arr.add(obj);
            
            if (i==0) {
               obj.put("listSize", list.size());
               obj.put("newGrade", newGrade);
               obj.put("totalpage", totalpage);
               obj.put("id", id);
               obj.put("reviewAmount", reviewAmount);
            }
            i++;
         }
      
          try
           {
              response.setContentType("application/x-www-form-urlencoded; charset=UTF-8");
              PrintWriter out=response.getWriter();
              out.write(arr.toJSONString());
           }catch(Exception ex) {}
         
      
   }
   

  
   
   
   
}