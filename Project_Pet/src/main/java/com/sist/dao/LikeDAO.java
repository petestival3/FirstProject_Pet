package com.sist.dao;

import java.util.*;
import java.sql.*;
import com.sist.vo.*;
import com.sist.dbcp.*;

public class LikeDAO {
	/*
	--<공감해요 테이블(실종강아지)>
CREATE TABLE DOG_LIKE(
 dogno NUMBER,
 id VARCHAR2(20) ,
 ldno NUMBER ,
 CONSTRAINT dog_dogno_pk PRIMARY KEY (dogno),
 CONSTRAINT dog_id_fk FOREIGN KEY(id) REFERENCES MEMBER(id),
 CONSTRAINT dog_ldno_fk FOREIGN KEY(ldno) REFERENCES LOSEANI(ldno)
);

--<공감해요 시퀀스(실종강아지)>
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
	public void DogLikeInsert(LikeDogVO vo) {
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
	   public int DogLikeCount(int ldno)
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
	   
	   
	   public int DogLikeOk(int ldno,String id)
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
	   
	   /*
	   --<공감해요 테이블(실종고양이)>
CREATE TABLE CAT_LIKE(
 catno NUMBER,
 id VARCHAR2(20) ,
 lcno NUMBER ,
 CONSTRAINT cat_catno_pk PRIMARY KEY (catno),
 CONSTRAINT cat_id_fk FOREIGN KEY(id) REFERENCES MEMBER(id),
 CONSTRAINT cat_ldno_fk FOREIGN KEY(lcno) REFERENCES LOSECAT(lcno)
);

--<공감해요 시퀀스(실종고양이)>
CREATE SEQUENCE cat_catno_seq 
START WITH 1
INCREMENT BY 1
NOCYCLE
NOCACHE;
	   */
	// 좋아요 저장
		public void CatLikeInsert(LikeCatVO vo) {
			try {
				conn = dbconn.getConnection();
				String sql = "INSERT INTO CAT_LIKE VALUES(cat_catno_seq.nextval,?,?)";
				ps = conn.prepareStatement(sql);
				ps.setString(1, vo.getId());
				ps.setInt(2, vo.getLcno());
				ps.executeUpdate();
			} catch (Exception ex) {
				ex.printStackTrace();
			} finally {
				dbconn.disConnection(conn, ps);
			}
		}
		
		// 좋아요 총 갯수 읽기 
		   public int CatLikeCount(int lcno)
		   {
			   int count=0;
			   try
			   {
				   conn=dbconn.getConnection();
				   String sql="SELECT COUNT(*) "
						     +"FROM CAT_LIKE "
						     +"WHERE lcno=?";
				   ps=conn.prepareStatement(sql);
				   ps.setInt(1, lcno);
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
		   
		   
		   public int CatLikeOk(int lcno,String id)
		   {
			   int count=0;
			   try
			   {
				   conn=dbconn.getConnection();
				   String sql="SELECT COUNT(*) "
						     +"FROM CAT_LIKE "
						     +"WHERE lcno=? AND id=?";
				   ps=conn.prepareStatement(sql);
				   ps.setInt(1, lcno);
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
