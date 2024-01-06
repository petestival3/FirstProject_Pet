package com.sist.dao;

import java.util.*;
import java.sql.*;
import com.sist.vo.*;
import com.sist.dbcp.*;

public class LikeDAO {
	/*
	--<좋아요 테이블(실종강아지)>
CREATE TABLE DOG_LIKE(
 dogno NUMBER,
 id VARCHAR2(20) ,
 ldno NUMBER ,
 CONSTRAINT dog_dogno_pk PRIMARY KEY (dogno),
 CONSTRAINT dog_id_fk FOREIGN KEY(id) REFERENCES MEMBER(id),
 CONSTRAINT dog_ldno_fk FOREIGN KEY(ldno) REFERENCES LOSEANI(ldno)
);

--<좋아요 시퀀스(강아지)>
CREATE SEQUENCE dog_dogno_seq 
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
			String sql = "INSERT INTO DOG_LIKE VALUES(dog_dogno_seq.nextval,?,?)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, vo.getId());
			ps.setInt(2, vo.getLdno());
			ps.executeUpdate();
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			dbconn.disConnection(conn, ps);
		}
	}
	
	// 좋아요 총 갯수 읽기 
	   public int LikeCount(int ldno)
	   {
		   int count=0;
		   try
		   {
			   conn=dbconn.getConnection();
			   String sql="SELECT COUNT(*) "
					     +"FROM DOG_LIKE "
					     +"WHERE ldno=?";
			   ps=conn.prepareStatement(sql);
			   ps.setInt(1, ldno);
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
	   
	   
	   public int LikeOk(int ldno,String id)
	   {
		   int count=0;
		   try
		   {
			   conn=dbconn.getConnection();
			   String sql="SELECT COUNT(*) "
					     +"FROM DOG_LIKE "
					     +"WHERE ldno=? AND id=?";
			   ps=conn.prepareStatement(sql);
			   ps.setInt(1, ldno);
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
