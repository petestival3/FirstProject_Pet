package com.sist.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.sist.dbcp.CreateDBCPconnection;
import com.sist.vo.*;

public class ProductDAO {
private PreparedStatement ps;
private Connection conn;
private  static ProductDAO dao;
private CreateDBCPconnection dbconn = new CreateDBCPconnection();
private final int ROW_SIZE=12;
private final int REVIEW_ROW_SIZE=4;

public static ProductDAO newInstace() {
	if(dao==null) {
		dao=new ProductDAO();
	}
	return dao;
	
}


public List<ProductVO> homeProduct(){ //메인 화면 상품인기순위
	List<ProductVO>list=new ArrayList<>();
	try {
		conn=dbconn.getConnection();
		String sql="SELECT p_image,p_name,pno,p_lower_price,p_price,p_percent,num "
					+"FROM (SELECT p_image,p_name,pno,p_lower_price,p_price,p_percent,rownum as num "
					+"FROM (SELECT p_image,p_name,pno,p_lower_price,p_price,p_percent FROM product_detail ORDER BY p_hit DESC)) "
					+"WHERE num BETWEEN 1 AND 5";
		ps=conn.prepareStatement(sql);
		ResultSet rs=ps.executeQuery();
		while(rs.next()) {
			ProductVO vo=new ProductVO();
		String p_image=rs.getString(1);
		String p_name=rs.getString(2);
		
		int pno=rs.getInt(3);
		String p_lower_price=rs.getString(4);
		
		vo.setP_image(p_image);
		vo.setP_name(p_name);
		vo.setPno(pno);;
		vo.setP_lower_price(p_lower_price);
		vo.setP_price(rs.getString(5));
		vo.setP_percent(rs.getString(6));
		list.add(vo);
		
		
		}
		rs.close();
	} catch (Exception e) {
		// TODO: handle exception
		e.printStackTrace();
	}
	finally {
		dbconn.disConnection(conn, ps);
	}
	
	return list;
}



public List<ProductVO> productBystackList(String ct,int page){ //상품 품절임박 리스트
	
	List< ProductVO> list= new ArrayList<ProductVO>();
	String msg="";
	
	if(!(ct.equals("전체"))){
		ct="'"+ct+"'";
		msg="AND p_category="+ct;
	}
	
	
	
	try {
		
		conn= dbconn.getConnection();
		String sql="SELECT pno,p_name,p_image,p_percent,p_lower_price,p_category,p_stack,p_price,p_grade,p_hit,p_review_num, num "
					+"FROM (SELECT pno,p_name,p_image,p_percent,p_lower_price,p_category,p_stack,p_price,p_grade,p_hit,p_review_num,rownum as num "
					+"FROM (SELECT pno,p_name,p_image,p_percent,p_lower_price,p_category,p_stack,p_price,p_grade,p_hit,p_review_num FROM product_detail "
					+ "WHERE P_STACK <3 AND P_STACK>0 "+msg+" ORDER BY p_stack ASC"
					+")) " +"WHERE num BETWEEN ? and ?";
		ps=conn.prepareStatement(sql);
		
		int start=(ROW_SIZE*page)-(ROW_SIZE-1);
		int end= ROW_SIZE*page;
		
		ps.setInt(1, start);
		ps.setInt(2, end);
		
		
	
		ResultSet rs= ps.executeQuery();
		while(rs.next()) {
			ProductVO vo= new ProductVO();
			vo.setPno(rs.getInt(1));
			vo.setP_name(rs.getString(2));
			vo.setP_image(rs.getString(3));
			vo.setP_percent(rs.getString(4));
			vo.setP_lower_price(rs.getString(5));
			vo.setP_category(rs.getString(6));
			vo.setP_stack(rs.getInt(7));
			vo.setP_price(rs.getString(8));
			vo.setP_grade(rs.getDouble(9));
			vo.setP_hit(rs.getInt(10));
			vo.setP_review_num(rs.getInt(11));
			list.add(vo);
			
		}
		rs.close();
		
	} catch (Exception e) {
		// TODO: handle exception
		e.printStackTrace();
	}
	finally {
		dbconn.disConnection(conn, ps);
	}
	
	return list;
}


public List<ProductVO> productByASCList(String ct,int page,String rt){ //상품 ASC순 리스트(rt= > 순위나열할 종류) rt받아서 asc로나열
	
	List< ProductVO> list= new ArrayList<ProductVO>();
	String msg="";
	
	
	
	if(!(ct.equals("전체"))){
		ct="'"+ct+"'";
		msg= "WHERE p_category = "+ct; 
	}
	
	
	
	try {
		int start=(ROW_SIZE*page)-(ROW_SIZE-1);
		int end= ROW_SIZE*page;
		
		conn= dbconn.getConnection();
		String sql="SELECT pno,p_name,p_image,p_percent,p_lower_price,p_category,p_stack,p_price,p_grade,p_hit,p_review_num,num "
					+"FROM (SELECT pno,p_name,p_image,p_percent,p_lower_price,p_category,p_stack,p_price,p_grade,p_hit,p_review_num,rownum as num "
					+"FROM (SELECT pno,p_name,p_image,p_percent,p_lower_price,p_category,p_stack,p_price,p_grade,p_hit,p_review_num FROM product_detail "
					+ msg+" ORDER BY "+rt+" ASC "
					+")) " +"WHERE num BETWEEN ? and ? ";
		ps=conn.prepareStatement(sql);
		
		
		
		ps.setInt(1, start);
		ps.setInt(2, end);
		
		
	
		ResultSet rs= ps.executeQuery();
		while(rs.next()) {
			ProductVO vo= new ProductVO();
			vo.setPno(rs.getInt(1));
			vo.setP_name(rs.getString(2));
			vo.setP_image(rs.getString(3));
			vo.setP_percent(rs.getString(4));
			vo.setP_lower_price(rs.getString(5));
			vo.setP_category(rs.getString(6));
			vo.setP_stack(rs.getInt(7));
			vo.setP_price(rs.getString(8));
			vo.setP_grade(rs.getDouble(9));
			vo.setP_hit(rs.getInt(10));
			vo.setP_review_num(rs.getInt(11));
			list.add(vo);
			
		}
		rs.close();
		
	} catch (Exception e) {
		// TODO: handle exception
		e.printStackTrace();
	}
	finally {
		dbconn.disConnection(conn, ps);
	}
	
	return list;
}





public List<ProductVO> productByDescList(String ct,int page,String rt){ //상품 DESC순 리스트(rt= > 순위나열할 종류) rt받아서 DESC로나열
	
	List< ProductVO> list= new ArrayList<ProductVO>();
	String msg="";
	
	
	
	if(!(ct.equals("전체"))){
		ct="'"+ct+"'";
		msg= "WHERE p_category = "+ct; 
	}
	
	
	
	try {
		
		conn= dbconn.getConnection();
		String sql="SELECT pno,p_name,p_image,p_percent,p_lower_price,p_category,p_stack,p_price,p_grade,p_hit,p_review_num,num "
					+"FROM (SELECT pno,p_name,p_image,p_percent,p_lower_price,p_category,p_stack,p_price,p_grade,p_hit,p_review_num,rownum as num "
					+"FROM (SELECT pno,p_name,p_image,p_percent,p_lower_price,p_category,p_stack,p_price,p_grade,p_hit,p_review_num FROM product_detail "
					+ msg+" ORDER BY "+rt+ " DESC "
					+")) " +"WHERE num BETWEEN ? and ?";
		ps=conn.prepareStatement(sql);
	
		
		int start=(ROW_SIZE*page)-(ROW_SIZE-1);
		int end= ROW_SIZE*page;
		
		ps.setInt(1, start);
		ps.setInt(2, end);
		
		
	
		ResultSet rs= ps.executeQuery();
		while(rs.next()) {
			ProductVO vo= new ProductVO();
			vo.setPno(rs.getInt(1));
			vo.setP_name(rs.getString(2));
			vo.setP_image(rs.getString(3));
			vo.setP_percent(rs.getString(4));
			vo.setP_lower_price(rs.getString(5));
			vo.setP_category(rs.getString(6));
			vo.setP_stack(rs.getInt(7));
			vo.setP_price(rs.getString(8));
			vo.setP_grade(rs.getDouble(9));
			vo.setP_hit(rs.getInt(10));
			vo.setP_review_num(rs.getInt(11));
			list.add(vo);
			
		}
		rs.close();
		
	} catch (Exception e) {
		// TODO: handle exception
		e.printStackTrace();
	}
	finally {
		dbconn.disConnection(conn, ps);
	}
	
	return list;
}




public int productByStackTotalPage(String ct) { //재고순 토탈페이지
	String msg="";
	
	if(!(ct.equals("전체"))){
		ct="'"+ct+"'";
		msg="AND p_category="+ct;
	}
	
	
	int total=0;
	
	try {
		conn=dbconn.getConnection();
		String sql= "Select CEIL(COUNT(*)/"+ROW_SIZE+") FROM product_detail WHERE P_STACK <3 AND P_STACK>0 "+msg; 
		ps=conn.prepareStatement(sql);
		
		ResultSet rs= ps.executeQuery();
		rs.next();
		total = rs.getInt(1);
	
		rs.close();
		
		
	} catch (Exception e) {
		// TODO: handle exception
		e.printStackTrace();
	}
	finally {
		dbconn.disConnection(conn, ps);
	}
	
	return total;
	
}



public int productTotalPage(String ct) { //재고순을 제외한 나머지 토탈페이지 msg를 활용한 동적쿼리 
	String msg="";
	if(!(ct.equals("전체"))){
		ct="'"+ct+"'";
		msg="WHERE p_category ="+ct;
	}
	
	
	
	
	
	int total=0;
	try {
		conn=dbconn.getConnection();
		String sql= "Select CEIL(COUNT(*)/"+ROW_SIZE+") FROM product_detail "+msg;
		ps=conn.prepareStatement(sql);
		
		ResultSet rs= ps.executeQuery();
		rs.next();
		total = rs.getInt(1);
	
		rs.close();
		
		
	} catch (Exception e) {
		// TODO: handle exception
		e.printStackTrace();
	}
	finally {
		dbconn.disConnection(conn, ps);
	}
	
	return total;
	
}




public ProductVO productDetail(int pno) { //상품상세보기
	ProductVO vo=new ProductVO();
	try {
		conn=dbconn.getConnection();
		String sql="UPDATE product_detail SET "
					+"p_hit=p_hit+1 "
					+"WHERE pno="+pno;
		ps=conn.prepareStatement(sql);
		ps.executeUpdate();
		
		sql="SELECT pno,p_name,p_lower_price,p_percent,p_category,p_hit,p_image,p_intprice,p_price,p_expire_date,p_shipment,p_stack,p_like,p_detail_image,p_intlowerprice,p_grade,p_review_num from product_detail where pno="+pno;
			ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			rs.next();
			vo.setPno(rs.getInt(1));
			vo.setP_name(rs.getString(2));
			vo.setP_lower_price(rs.getString(3));
			vo.setP_percent(rs.getString(4));
			vo.setP_category(rs.getString(5));
			vo.setP_hit(rs.getInt(6));
			vo.setP_image(rs.getString(7));
 
			vo.setP_intprice(rs.getInt(8));
			vo.setP_price(rs.getString(9));
			
			vo.setP_expire_date(rs.getString(10));
			vo.setP_shipment(rs.getString(11));
			vo.setP_stack(rs.getInt(12));
			vo.setP_like(rs.getInt(13));
			vo.setP_detail_image(rs.getString(14));
			vo.setP_intlowerprice(rs.getInt(15));
			vo.setP_grade(rs.getDouble(16));
			vo.setP_review_num(rs.getInt(17));
			rs.close();
			
			
		
	} catch (Exception e) {
		// TODO: handle exception
		e.printStackTrace();
	}
	finally {
		dbconn.disConnection(conn, ps);
	}
	
	
	return vo;
	
}



public ProductVO productDetail_Before(int pno) { //상품상세보기 클릭시 실행되어야하는 메소드
	ProductVO vo=new ProductVO();
	try {
		conn=dbconn.getConnection();
		
		
		String sql="SELECT pno,p_name,p_lower_price,p_image,p_grade,p_price,p_percent,p_hit from product_detail where pno="+pno;
			ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			rs.next();
			vo.setPno(rs.getInt(1));
			vo.setP_name(rs.getString(2));
			vo.setP_lower_price(rs.getString(3));
			vo.setP_image(rs.getString(4));
			vo.setP_grade(rs.getDouble(5));
			vo.setP_price(rs.getString(6));
			vo.setP_percent(rs.getString(7));
			vo.setP_hit(rs.getInt(8));
			rs.close();
			
			
		
	} catch (Exception e) {
		// TODO: handle exception
		e.printStackTrace();
	}
	finally {
		dbconn.disConnection(conn, ps);
	}
	
	
	return vo;
	
}



public List<Integer> ProductCateNum(){ //상품리스트 좌단에 출력되는 카테고리 목록의 각 카테고리별 상품 개수 출력
	List<Integer>list= new ArrayList<Integer>();
	try {
		conn=dbconn.getConnection();
		
		String sql="SELECT COUNT(*) FROM PRODUCT_DETAIL ";
		ps=conn.prepareStatement(sql);
		ResultSet rs=ps.executeQuery();
		rs.next();
		list.add(rs.getInt(1));
		rs.close();
		
		 sql="SELECT COUNT(*) FROM PRODUCT_DETAIL GROUP BY P_CATEGORY";
		ps=conn.prepareStatement(sql);
		 rs=ps.executeQuery();
		while(rs.next()) {
			list.add(rs.getInt(1));
			
		}
		rs.close();
	} catch (Exception e) {
		// TODO: handle exception
		e.printStackTrace();
	}
	finally {
		dbconn.disConnection(conn, ps);
	}
	
	return list;
}

public List<ProductVO> productSubImage(int pno){//상품상세보기에 사진 하단의 서브이미지들
	
	List<ProductVO>list= new ArrayList<ProductVO>();
	try {
		conn=dbconn.getConnection();
		String sql="SELECT P_SUB_IMAGE FROM PRODUCT_SUB_IMAGE WHERE pno="+pno;
		ps=conn.prepareStatement(sql);
		
		ResultSet rs=ps.executeQuery();
		while(rs.next()) {
			ProductVO vo=new ProductVO();
			vo.setP_sub_image(rs.getString(1));
			list.add(vo);
		}
		rs.close();
		
	} catch (Exception e) {
		// TODO: handle exception
		e.printStackTrace();
	}
	finally {
		dbconn.disConnection(conn, ps);
	}
	
	return list;
}

public List<ProductVO> productRelativeList(int pno){//상품 상세보기의 관련상품리스트
	List<ProductVO>list =new ArrayList<ProductVO>();
		try {
			
			conn=dbconn.getConnection();
		
			String sql="SELECT p_category FROM product_detail where pno="+pno;
			ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			rs.next();
			String ct=rs.getString(1);
			rs.close();
			
			
			sql="SELECT pno,p_image,p_name,p_lower_price,p_grade,p_price,p_percent,p_hit,p_review_num,num "
						+"FROM(SELECT pno,p_image,p_name,p_lower_price,p_grade,p_price,p_percent,p_hit,p_review_num,ROWNUM as num "
						+"FROM (SELECT pno,p_image,p_name,p_lower_price,p_grade,p_price,p_percent,p_hit,p_review_num FROM product_detail "
						+"WHERE p_category=? ORDER BY p_hit DESC)) "
						+"WHERE num BETWEEN 1 AND 5";
			
			ps=conn.prepareStatement(sql);
			ps.setString(1, ct);
			rs=ps.executeQuery();
			while(rs.next()) {
				ProductVO vo =new ProductVO();
				
				vo.setPno(rs.getInt(1));
				vo.setP_image(rs.getString(2));
				vo.setP_name(rs.getString(3));
				vo.setP_lower_price(rs.getString(4));
				vo.setP_grade(rs.getDouble(5));
				vo.setP_price(rs.getString(6));
				vo.setP_percent(rs.getString(7));
				vo.setP_hit(rs.getInt(8));
				vo.setP_review_num(rs.getInt(9));

				
				
				list.add(vo);	
				
			}
			rs.close();
		
			
			
			
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		finally {
			dbconn.disConnection(conn, ps);
		}
	
	return list;
}


public List<ProductVO> highSaleList(){ //상품 리스트 좌단에 초특가 할인리스트
	List<ProductVO> list= new ArrayList<ProductVO>();
	try {
		conn=dbconn.getConnection();
		String sql="SELECT pno,p_image,p_name,p_price,p_lower_price,p_percent,num "
					+"FROM(SELECT pno,p_image,p_name,p_price,p_lower_price,p_percent,ROWNUM as num "
					+"FROM (SELECT pno,p_image,p_name,p_price,p_lower_price,p_percent "
					+"FROM product_detail "
					+"ORDER BY p_intpercent DESC))"
					+"WHERE num BETWEEN 1 AND 9";
		
		ps=conn.prepareStatement(sql);
		ResultSet rs=ps.executeQuery();
		
		while(rs.next()) {
			ProductVO vo=new ProductVO();
			vo.setPno(rs.getInt(1));
			vo.setP_image(rs.getString(2));
			vo.setP_name(rs.getString(3));
			vo.setP_price(rs.getString(4));
			vo.setP_lower_price(rs.getString(5));
			vo.setP_percent(rs.getString(6));
			list.add(vo);
			
		}
		rs.close();
					
	} catch (Exception e) {
		// TODO: handle exception
		e.printStackTrace();
	}
	finally {
		dbconn.disConnection(conn, ps);
	}
	
	return list;
}

public List<ProductVO> productSearchList(String sct,String ss,int page){//상품 검색리스트
	String msg="";
	if (sct.equals("전체")) {
		msg="WHERE p_name Like '%'||?||'%'";
	}
	else {
		msg="WHERE p_category=? AND p_name LIKE '%'||?||'%'";
	}
	List<ProductVO>list= new ArrayList<ProductVO>();
	try {
		conn=dbconn.getConnection();
		String sql="SELECT pno,p_name,p_image,p_lower_price,p_hit,p_grade,p_price,p_percent,p_stack,num "
				   +"FROM (SELECT pno,p_name,p_image,p_lower_price,p_hit,p_grade,p_price,p_percent,p_stack,rownum as num "
				   +"FROM (SELECT pno,p_name,p_image,p_lower_price,p_hit,p_grade,p_price,p_percent,p_stack "
				   +"FROM PRODUCT_DETAIL "
				   +msg +")) "
				   +"WHERE num BETWEEN ? AND ?";
		ps=conn.prepareStatement(sql);
		
		int start=(ROW_SIZE*page)-(ROW_SIZE-1);
		int end= ROW_SIZE*page;
		
		if (sct.equals("전체")) {
			ps.setString(1,ss);
			ps.setInt(2, start);
			ps.setInt(3, end);
		}
		else {
			ps.setString(1, sct);
			ps.setString(2, ss);
			ps.setInt(3, start);
			ps.setInt(4, end);
		}
		ResultSet rs= ps.executeQuery();
		while(rs.next()) {
			ProductVO vo =new ProductVO();
			vo.setPno(rs.getInt(1));
			vo.setP_name(rs.getString(2));
			vo.setP_image(rs.getString(3));
			vo.setP_lower_price(rs.getString(4));
			vo.setP_hit(rs.getInt(5));
			vo.setP_grade(rs.getDouble(6));
			vo.setP_price(rs.getString(7));
			vo.setP_percent(rs.getString(8));
			vo.setP_stack(rs.getInt(9));
			list.add(vo);
		}
		rs.close();
	} catch (Exception e) {
		// TODO: handle exception
		e.printStackTrace();
	}
	finally {
		dbconn.disConnection(conn, ps);
	}
	return list;
	
}

public int productSearchTotalPage(String sct,String ss) {//상품검색리스트 토탈페이지
	int total=0;
	String msg="";
	if (sct.equals("전체")) {
		msg="WHERE p_name LIKE '%'||?||'%'";
	}
	else {
		msg="WHERE p_category=? AND p_name LIKE '%'||?||'%'";
	}
	
	
	try {
		conn=dbconn.getConnection();
		String sql="SELECT CEIL(COUNT(*)/"+ROW_SIZE+") FROM PRODUCT_DETAIL "+msg;
		ps=conn.prepareStatement(sql);
		if (sct.equals("전체")) {
			ps.setString(1, ss);
		}
		else {
			ps.setString(1, sct);
			ps.setString(2, ss);
		}
		
		ResultSet rs=ps.executeQuery();
		rs.next();
		total=rs.getInt(1);
		rs.close();
					
	} catch (Exception e) {
		// TODO: handle exception
		e.printStackTrace();
	}
	finally {
		dbconn.disConnection(conn, ps);
	}
	
	return total;
	
}

public List<ReviewVO> product_reviewHighScoreList(int page,int pno) {//상품상세보기의 리뷰높은할인순 리스트
	List<ReviewVO> list=new ArrayList<ReviewVO>();
	
	
	try {
		conn=dbconn.getConnection();
		String sql="SELECT writer,TO_CHAR(revdate,'YYYY-MM-DD HH24:MI:SS'),content,imgname,imgsize,score,num "
					+"FROM(SELECT writer,revdate,content,imgname,imgsize,score,rownum as num "
					+"FROM(SELECT writer,revdate,content,imgname,imgsize,score FROM review "
					+"WHERE typeno=2 AND objno=? "
					+"ORDER BY score DESC ,revdate DESC))"
					+"WHERE num BETWEEN ? AND ?";
		ps=conn.prepareStatement(sql);
		int start=(REVIEW_ROW_SIZE*page)-(REVIEW_ROW_SIZE-1);
		int end= REVIEW_ROW_SIZE*page;
		ps.setInt(1, pno);
		ps.setInt(2, start);
		ps.setInt(3, end);

	ResultSet rs=ps.executeQuery();
	
	while(rs.next()) {
		ReviewVO vo= new ReviewVO();
		vo.setWriter(rs.getString(1));
		vo.setDbday(rs.getString(2));
		vo.setContent(rs.getString(3));
		vo.setImgname(rs.getString(4));
		vo.setImgsize(rs.getInt(5));
		vo.setScore(rs.getDouble(6));
		
		list.add(vo);
	}
	rs.close();
	dbconn.disConnection(conn, ps);
		
	
	
	} catch (Exception e) {
		// TODO: handle exception
	e.printStackTrace();
	}
	finally {
		dbconn.disConnection(conn, ps);
	}
	
	return list;
	
}


public List<ReviewVO> product_reviewLowScoreList(int page,int pno) {//상품상세보기의 리뷰낮은할인순 리스트
	List<ReviewVO> list=new ArrayList<ReviewVO>();
	
	
	try {
		conn=dbconn.getConnection();
		String sql="SELECT writer,TO_CHAR(revdate,'YYYY-MM-DD HH24:MI:SS'),content,imgname,imgsize,score,num "
					+"FROM(SELECT writer,revdate,content,imgname,imgsize,score,rownum as num "
					+"FROM(SELECT writer,revdate,content,imgname,imgsize,score FROM review "
					+"WHERE typeno=2 AND objno=? "
					+"ORDER BY score ASC ,revdate DESC))"
					+"WHERE num BETWEEN ? AND ?";
		ps=conn.prepareStatement(sql);
		int start=(REVIEW_ROW_SIZE*page)-(REVIEW_ROW_SIZE-1);
		int end= REVIEW_ROW_SIZE*page;
		ps.setInt(1, pno);
		ps.setInt(2, start);
		ps.setInt(3, end);

	ResultSet rs=ps.executeQuery();
	
	while(rs.next()) {
		ReviewVO vo= new ReviewVO();
		vo.setWriter(rs.getString(1));
		vo.setDbday(rs.getString(2));
		vo.setContent(rs.getString(3));
		vo.setImgname(rs.getString(4));
		vo.setImgsize(rs.getInt(5));
		vo.setScore(rs.getDouble(6));
		
		list.add(vo);
	}
	rs.close();
	dbconn.disConnection(conn, ps);
		
	
	
	} catch (Exception e) {
		// TODO: handle exception
	e.printStackTrace();
	}
	finally {
		dbconn.disConnection(conn, ps);
	}
	
	return list;
	
}


public List<ReviewVO> product_reviewLatestDateList(int page,int pno) {//상품상세보기의 리뷰최근순 리스트
	List<ReviewVO> list=new ArrayList<ReviewVO>();
	
	
	try {
		conn=dbconn.getConnection();
		String sql="SELECT writer,TO_CHAR(revdate,'YYYY-MM-DD HH24:MI:SS'),content,imgname,imgsize,score,num "
					+"FROM(SELECT writer,revdate,content,imgname,imgsize,score,rownum as num "
					+"FROM(SELECT writer,revdate,content,imgname,imgsize,score FROM review "
					+"WHERE typeno=2 AND objno=? "
					+"ORDER BY revdate DESC))"
					+"WHERE num BETWEEN ? AND ?";
		ps=conn.prepareStatement(sql);
		int start=(REVIEW_ROW_SIZE*page)-(REVIEW_ROW_SIZE-1);
		int end= REVIEW_ROW_SIZE*page;
		ps.setInt(1, pno);
		ps.setInt(2, start);
		ps.setInt(3, end);

	ResultSet rs=ps.executeQuery();
	
	while(rs.next()) {
		ReviewVO vo= new ReviewVO();
		vo.setWriter(rs.getString(1));
		vo.setDbday(rs.getString(2));
		vo.setContent(rs.getString(3));
		vo.setImgname(rs.getString(4));
		vo.setImgsize(rs.getInt(5));
		vo.setScore(rs.getDouble(6));
		
		list.add(vo);
	}
	rs.close();
	dbconn.disConnection(conn, ps);
		
	
	
	} catch (Exception e) {
		// TODO: handle exception
	e.printStackTrace();
	}
	finally {
		dbconn.disConnection(conn, ps);
	}
	
	return list;
	
}


public List<ReviewVO> product_reviewOldDateList(int page,int pno) {//상품상세보기의 오래된순 리스트
	List<ReviewVO> list=new ArrayList<ReviewVO>();
	
	
	try {
		conn=dbconn.getConnection();
		String sql="SELECT writer,TO_CHAR(revdate,'YYYY-MM-DD HH24:MI:SS'),content,imgname,imgsize,score,num "
					+"FROM(SELECT writer,revdate,content,imgname,imgsize,score,rownum as num "
					+"FROM(SELECT writer,revdate,content,imgname,imgsize,score FROM review "
					+"WHERE typeno=2 AND objno=? "
					+"ORDER BY revdate ASC))"
					+"WHERE num BETWEEN ? AND ?";
		ps=conn.prepareStatement(sql);
		int start=(REVIEW_ROW_SIZE*page)-(REVIEW_ROW_SIZE-1);
		int end= REVIEW_ROW_SIZE*page;
		ps.setInt(1, pno);
		ps.setInt(2, start);
		ps.setInt(3, end);

	ResultSet rs=ps.executeQuery();
	
	while(rs.next()) {
		ReviewVO vo= new ReviewVO();
		vo.setWriter(rs.getString(1));
		vo.setDbday(rs.getString(2));
		vo.setContent(rs.getString(3));
		vo.setImgname(rs.getString(4));
		vo.setImgsize(rs.getInt(5));
		vo.setScore(rs.getDouble(6));
		
		list.add(vo);
	}
	rs.close();
	dbconn.disConnection(conn, ps);
		
	
	
	} catch (Exception e) {
		// TODO: handle exception
	e.printStackTrace();
	}
	finally {
		dbconn.disConnection(conn, ps);
	}
	
	return list;
	
}




public int product_review_totalPage(int pno) {//리뷰 토탈페이지
	int totalpage=0;
	
	try {
		conn=dbconn.getConnection();
		String sql="SELECT CEIL(COUNT(*)/4.0) FROM review WHERE objno=?";
		ps=conn.prepareStatement(sql);
		ps.setInt(1, pno);
		ResultSet rs= ps.executeQuery();
		if(rs.next()) {
			totalpage=rs.getInt(1);
		}
		rs.close();
		dbconn.disConnection(conn, ps);
		
	} catch (Exception e) {
		// TODO: handle exception
		e.printStackTrace();
	}
	finally {
		dbconn.disConnection(conn, ps);
	}
	return totalpage;
}

public double newGrade(int pno) {//리뷰 에이젝스 리스트 초기화시 새로운평점
	double newGrade=0;
	try {
		conn=dbconn.getConnection();
		String sql="SELECT p_grade FROM product_detail WHERE pno=?";
		ps=conn.prepareStatement(sql);
		ps.setInt(1, pno);
		
		ResultSet rs= ps.executeQuery();
		if(rs.next()) {
			newGrade=rs.getDouble(1);
		}
		rs.close();
	} catch (Exception e) {
		// TODO: handle exception
	e.printStackTrace();
	}
	finally {
		dbconn.disConnection(conn, ps);
	}
	
	return newGrade;
}


public void insertProductReview(ReviewVO vo) {//리뷰 인서트
	
	int reviewAmount=0;
	int p_grade_sum=0;
	
	try {
		conn=dbconn.getConnection();
		String sql="SELECT p_review_num FROM product_detail WHERE pno=?";
		ps=conn.prepareStatement(sql);
		ps.setInt(1, vo.getObjno());
		ResultSet rs= ps.executeQuery();
		
		if(rs.next()) {
			reviewAmount=rs.getInt(1);
		}
		rs.close();
		
		dbconn.disConnection(conn, ps);
		
		conn=dbconn.getConnection();
		 sql="SELECT SUM(score) FROM review WHERE objno=?";
		ps=conn.prepareStatement(sql);
		ps.setInt(1, vo.getObjno());
		 rs= ps.executeQuery();
		
		if(rs.next()) {
			p_grade_sum=rs.getInt(1);
		}
		rs.close();
		dbconn.disConnection(conn, ps);
		
		
		
		conn=dbconn.getConnection();
		sql="INSERT INTO REVIEW (REVNO,OBJNO,WRITER,CONTENT,IMGNAME,IMGSIZE,SCORE,TYPENO) "
			+"VALUES(REVIEW_REVNO_SEQ.nextval,?,?,?,?,?,?,2)";
		ps=conn.prepareStatement(sql);
		ps.setInt(1, vo.getObjno());
		ps.setString(2, vo.getWriter());
		ps.setString(3, vo.getContent());
		ps.setString(4, vo.getImgname());
		ps.setInt(5, vo.getImgsize());
		ps.setDouble(6, vo.getScore());
		
		ps.executeUpdate();
		dbconn.disConnection(conn, ps);
		
		
		double newGrade = (p_grade_sum + vo.getScore()) / (reviewAmount + 1);
		newGrade = Math.round(newGrade * 10.0) / 10.0; 
		
		conn=dbconn.getConnection();
		sql="UPDATE product_detail SET "
		   +"p_grade=? ,"
			+"p_review_num=p_review_num+1 "	
			+"WHERE pno=?";	
				ps=conn.prepareStatement(sql);
				ps.setDouble(1, newGrade);
				ps.setInt(2, vo.getObjno());
				ps.executeUpdate();
				dbconn.disConnection(conn, ps);
		
	} catch (Exception e) {
		// TODO: handle exception
	e.printStackTrace();
	}
	
	finally {
		dbconn.disConnection(conn, ps);
	}
}

//리뷰를 아이디,상품 당 하나의 리뷰만 등록가능한 것을 체크하기위해 개수를 가져오는 메소드
public int reviewUserCount(int pno,String writer) {
	int count=0;
	try {
		conn=dbconn.getConnection();
		String sql="SELECT COUNT(*) FROM REVIEW WHERE objno=? AND writer=?";
		ps=conn.prepareStatement(sql);
		ps.setInt(1, pno);
		ps.setString(2, writer);
		
		ResultSet rs=ps.executeQuery();
		if(rs.next()) {
			count=rs.getInt(1);
		}
		rs.close();
	} catch (Exception e) {
		// TODO: handle exception
		e.printStackTrace();
	}
	finally {
		dbconn.disConnection(conn, ps);
	}
	
	return count;
}

public int reviewAmount(int pno) {
	int reviewamount=0;
	
	try {
		conn=dbconn.getConnection();
		String sql="SELECT COUNT(*) FROM REVIEW WHERE objno=? AND typeno=2";
		ps=conn.prepareStatement(sql);
		ps.setInt(1, pno);
		
		
		ResultSet rs=ps.executeQuery();
		if(rs.next()) {
			reviewamount=rs.getInt(1);
		}
		rs.close();
	} catch (Exception e) {
		// TODO: handle exception
		e.printStackTrace();
	}
	finally {
		dbconn.disConnection(conn, ps);
	}
	
	return reviewamount;
	
}

public int QnaAmount(int pno) {
	int qnaAmount=0;
	
	try {
		conn=dbconn.getConnection();
		String sql="SELECT COUNT(*) FROM Qnaboard WHERE pno=?";
		ps=conn.prepareStatement(sql);
		ps.setInt(1, pno);
		
		
		ResultSet rs=ps.executeQuery();
		if(rs.next()) {
			qnaAmount=rs.getInt(1);
		}
		rs.close();
	} catch (Exception e) {
		// TODO: handle exception
		e.printStackTrace();
	}
	finally {
		dbconn.disConnection(conn, ps);
	}
	
	return qnaAmount;
	
}


public List<ProductVO> newProductList() {
	List<ProductVO>list=new ArrayList<ProductVO>();
	
	try {
		conn=dbconn.getConnection();
		String sql="SELECT pno,p_image,p_name,p_price,p_lower_price,p_percent,num "
				+"FROM(SELECT pno,p_image,p_name,p_price,p_lower_price,p_percent,ROWNUM as num "
				+"FROM (SELECT pno,p_image,p_name,p_price,p_lower_price,p_percent "
				+"FROM product_detail WHERE p_REGDATE >=SYSDATE-30" 
				+"ORDER BY p_regdate DESC))"
				+"WHERE num BETWEEN 1 AND 3";
		ps=conn.prepareStatement(sql);
	
		ResultSet rs=ps.executeQuery();
		while(rs.next()) {
			ProductVO vo=new ProductVO();
			vo.setPno(rs.getInt(1));
			vo.setP_image(rs.getString(2));
			vo.setP_name(rs.getString(3));
			vo.setP_price(rs.getString(4));
			vo.setP_lower_price(rs.getString(5));
			vo.setP_percent(rs.getString(6));
			list.add(vo);
		}
		
		
		rs.close();
	} catch (Exception e) {
		// TODO: handle exception
		e.printStackTrace();
	}
	finally {
		dbconn.disConnection(conn, ps);
	}
	
	return list;
	
}

public List<ProductVO> hotpriceList() {
	List<ProductVO>list=new ArrayList<ProductVO>();
	
	try {
		conn=dbconn.getConnection();
		String sql="SELECT pno,p_image,p_name,p_price,p_lower_price,p_percent,num "
				+"FROM(SELECT pno,p_image,p_name,p_price,p_lower_price,p_percent,ROWNUM as num "
				+"FROM (SELECT pno,p_image,p_name,p_price,p_lower_price,p_percent "
				+"FROM product_detail WHERE p_REGDATE >=SYSDATE-30" 
				+"ORDER BY p_price ASC))"
				+"WHERE num BETWEEN 1 AND 3";
		ps=conn.prepareStatement(sql);
	
		ResultSet rs=ps.executeQuery();
		while(rs.next()) {
			ProductVO vo=new ProductVO();
			vo.setPno(rs.getInt(1));
			vo.setP_image(rs.getString(2));
			vo.setP_name(rs.getString(3));
			vo.setP_price(rs.getString(4));
			vo.setP_lower_price(rs.getString(5));
			vo.setP_percent(rs.getString(6));
			list.add(vo);
		}
		
		
		rs.close();
	} catch (Exception e) {
		// TODO: handle exception
		e.printStackTrace();
	}
	finally {
		dbconn.disConnection(conn, ps);
	}
	
	return list;
	
}
}
