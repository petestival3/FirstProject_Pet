package com.sist.dao;

import java.util.*;
import java.sql.*;
import com.sist.vo.*;
import com.sist.dbcp.*;

public class JJimDAO {

	private Connection conn;
	private PreparedStatement ps;
	private CreateDBCPconnection dbconn = new CreateDBCPconnection();
	private static JJimDAO dao;

	// 싱글턴
	public static JJimDAO newInstance() {
		if (dao == null)
			dao = new JJimDAO();
		return dao;
	}

	// 찜하기 저장
	public void JJimInsert(JJimVO vo) {
		try {
			conn = dbconn.getConnection();
			String sql = "INSERT INTO goods_jjim VALUES(" + "jj_no_seq.nextval,?,?)";
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
	// 찜하기 확인(같은아이디로 1번만 넣도록)
	// 찜하기 목록 출력
	// 찜하기 취소
	 public void JJimCancel(int no)
	   {
		   try
		   {
			   conn=dbconn.getConnection();
			   String sql="DELETE FROM goods_jjim "
					     +"WHERE no=?";
			   ps=conn.prepareStatement(sql);
			   ps.setInt(1, no);
			   ps.executeUpdate();
		   }catch(Exception ex)
		   {
			   ex.printStackTrace();
		   }
		   finally
		   {
			   dbconn.disConnection(conn, ps);
		   }
	   }
}
