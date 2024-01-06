package com.sist.dao;

import java.util.*;
import java.sql.*;
import com.sist.vo.*;
import com.sist.dbcp.*;

public class LikeDAO {
	/*
	--<좋아요 테이블>
	CREATE TABLE GOODS_LIKE(
	 glno NUMBER,
	 id VARCHAR2(20) ,
	 pno NUMBER ,
	 CONSTRAINT gl_glno_pk PRIMARY KEY (glno),
	 CONSTRAINT gl_id_fk FOREIGN KEY(id) REFERENCES MEMBER(id),
	 CONSTRAINT gl_pno_fk FOREIGN KEY(pno) REFERENCES PRODUCT_DETAIL(pno)
	);

	--<좋아요 시퀀스>
	CREATE SEQUENCE gl_glno_seq 
	START WITH 1
	INCREMENT BY 1
	NOCYCLE
	NOCACHE;
	 */
	
	private Connection conn;
	private PreparedStatement ps;
	private CreateDBCPconnection dbconn = new CreateDBCPconnection();
	private static LikeDAO dao;

	// 싱글턴
	public static LikeDAO newInstance() {
		if (dao == null)
			dao = new LikeDAO();
		return dao;
	}
	
	// 좋아요 저장
	public void LikeInsert(LikeVO vo) {
		try {
			conn = dbconn.getConnection();
			String sql = "INSERT INTO GOODS_LIKE VALUES(gl_glno_seq.nextval,?,?)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, vo.getId());
			ps.setInt(2, vo.getPno());
			ps.executeUpdate();
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			dbconn.disConnection(conn, ps);
		}
	}
	
	// 좋아요 총 갯수 읽기 
	   public int LikeCount(int pno)
	   {
		   int count=0;
		   try
		   {
			   conn=dbconn.getConnection();
			   String sql="SELECT COUNT(*) "
					     +"FROM GOODS_LIKE "
					     +"WHERE pno=?";
			   ps=conn.prepareStatement(sql);
			   ps.setInt(1, pno);
			   ResultSet rs=ps.executeQuery();
			   rs.next();
			   count=rs.getInt(1);
			   rs.close();
		   }catch(Exception ex)
		   {
			   ex.printStackTrace();
		   }
		   finally
		   {
			   dbconn.disConnection(conn, ps);
		   }
		   return count;
	   }
	   
	   
	   public int LikeOk(int pno,String id)
	   {
		   int count=0;
		   try
		   {
			   conn=dbconn.getConnection();
			   String sql="SELECT COUNT(*) "
					     +"FROM goods_like "
					     +"WHERE pno=? AND id=?";
			   ps=conn.prepareStatement(sql);
			   ps.setInt(1, pno);
			   ps.setString(2, id);
			   ResultSet rs=ps.executeQuery();
			   rs.next();
			   count=rs.getInt(1);
			   rs.close();
		   }catch(Exception ex)
		   {
			   ex.printStackTrace();
		   }
		   finally
		   {
			   dbconn.disConnection(conn, ps);
		   }
		   return count;
	   }
}
