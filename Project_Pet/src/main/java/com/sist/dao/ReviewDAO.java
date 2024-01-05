package com.sist.dao;

import java.util.*;

import javax.naming.spi.DirStateFactory.Result;

import java.sql.*;
import com.sist.dbcp.*;
import com.sist.vo.*;
public class ReviewDAO {
	private Connection conn;
	private PreparedStatement ps;
	private CreateDBCPconnection dbconn=new CreateDBCPconnection();
	private static ReviewDAO dao;
	private final int ROW_SIZE=5;
	
	public static ReviewDAO newInstance() {
		if(dao==null)
			dao=new ReviewDAO();
		return dao;
	}
	
	// 목록출력
	// typeno => 1:stay 2:shop 3:hospital 4:funeral
	public List<ReviewVO> ReviewListData(int typeno,int objno,int page){
		List<ReviewVO> list=new ArrayList<ReviewVO>();
		try {
			conn=dbconn.getConnection();
			int start=(ROW_SIZE*page)-(ROW_SIZE-1);
			int end=ROW_SIZE*page;
			
			String sql="SELECT revno,objno,writer,content,score,typeno,imgname,imgsize,TO_CHAR(revdate,'YYYY-MM-DD HH24:MI:SS'),num "
					+ "FROM (SELECT revno,objno,writer,content,score,typeno,imgname,imgsize,revdate,rownum as num "
					+ "FROM (SELECT revno,objno,writer,content,score,typeno,imgname,imgsize,revdate "
					+ "FROM review WHERE typeno=? AND objno=? ORDER BY revno DESC)) "
					+ "WHERE num BETWEEN ? AND ?";
			
			ps=conn.prepareStatement(sql);
			ps.setInt(1, typeno);
			ps.setInt(2, objno);
			ps.setInt(3, start);
			ps.setInt(4, end);
			
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				ReviewVO vo=new ReviewVO();
				vo.setRevno(rs.getInt(1));
				vo.setObjno(rs.getInt(2));
				vo.setWriter(rs.getString(3));
				vo.setContent(rs.getString(4));
				vo.setScore(rs.getDouble(5));
				vo.setTypeno(rs.getInt(6));
				vo.setImgname(rs.getString(7));
				vo.setImgsize(rs.getInt(8));
				vo.setDbday(rs.getString(9));
				list.add(vo);
			}
			rs.close();
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			dbconn.disConnection(conn, ps);
		}
		return list;
	}
	
	public int reviewTotalPage(int typeno,int objno) {
		int total=0;
		try {
			conn=dbconn.getConnection();
			String sql="SELECT CEIL(COUNT(*)/5.0) FROM review "
					+ "WHERE typeno=? AND objno=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, typeno);
			ps.setInt(2, objno);
			
			ResultSet rs=ps.executeQuery();
			rs.next();
			total=rs.getInt(1);
			rs.close();
			ps.close();
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			dbconn.disConnection(conn, ps);
		}
		return total;
	}

	public void reviewInsert(ReviewVO vo) {
		
		try {
			conn=dbconn.getConnection();
			String sql="INSERT INTO review(revno,objno,writer,revdate,content,score,typeno,imgname,imgsize) VALUES("
					+ "review_revno_seq.nextval,?,?,SYSDATE,?,?,?,?,?)";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, vo.getObjno());
			ps.setString(2, vo.getWriter());
			ps.setString(3, vo.getContent());
			ps.setDouble(4, vo.getScore());
			ps.setInt(5, vo.getTypeno());
			ps.setString(6, vo.getImgname());
			ps.setInt(7, vo.getImgsize());
			ps.executeUpdate();
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			dbconn.disConnection(conn, ps);
		}
	}
}
