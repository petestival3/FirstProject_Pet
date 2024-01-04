package com.sist.dao;

import java.util.*;
import java.sql.*;
import com.sist.vo.*;
import com.sist.dbcp.*;

import com.sist.vo.LikeVO;

public class LikeDAO {
	/*
	여기에 좋아요 테이블 만들어서 넣어두기...
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
			String sql = "INSERT INTO goods_like VALUES(" + "jj_no_seq.nextval,?,?)";
			ps = conn.prepareStatement(sql);
			//ps.setString(1, vo.getId());
			//ps.setInt(2, vo.getPno());
			ps.executeUpdate();
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			dbconn.disConnection(conn, ps);
		}
	}
	
	// 좋아요 총 갯수 읽기 
	   public int LikeCount(int fno)
	   {
		   int count=0;
		   try
		   {
			   conn=dbconn.getConnection();
			   String sql="SELECT COUNT(*) "
					     +"FROM goods_like "
					     +"WHERE pno=?";
			   ps=conn.prepareStatement(sql);
			   //ps.setInt(1, pno);
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
					     +"WHERE fno=? AND id=?";
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
