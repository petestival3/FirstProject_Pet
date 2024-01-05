package com.sist.dao;
import java.util.*;
import java.sql.*;

import com.sist.dbcp.CreateDBCPconnection;
import com.sist.vo.*;
public class FreeBoardReplyDAO {
	private Connection conn;
	private PreparedStatement ps;
	private CreateDBCPconnection dbconn
			=new CreateDBCPconnection();
	private static FreeBoardReplyDAO dao;
	
	public static FreeBoardReplyDAO newInstance()
	{
		if(dao==null)
			dao=new FreeBoardReplyDAO();
		return dao;
	}
	
	// 목록 출력 bno = 게시물 번호
	public List<FreeBoardReplyVO> replyListData(int bno)
	{
		List<FreeBoardReplyVO> list=new ArrayList<FreeBoardReplyVO>();
		try
		{
			conn=dbconn.getConnection();
			String sql="SELECT no,bno,id,name,msg,TO_CHAR(regdate,'yyyy-MM-dd HH24:MI:SS'),"
				     +"group_tab "
				     +"FROM free_board_reply "
				     +"WHERE bno=? "
				     +"ORDER BY group_id DESC,group_step ASC";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, bno);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				FreeBoardReplyVO vo=new FreeBoardReplyVO();
				vo.setNo(rs.getInt(1));
				vo.setBno(rs.getInt(2));
				vo.setId(rs.getString(3));
				vo.setName(rs.getString(4));
				vo.setMsg(rs.getString(5));
				vo.setDbday(rs.getString(6));
				vo.setGroup_tab(rs.getInt(7));
				list.add(vo);
			}
			rs.close();
		}catch(Exception ex)
		{
			ex.printStackTrace();
		}
		finally
		{
			dbconn.disConnection(conn, ps);
		}
		return list;
	}
	
	// 수정
	public void replyUpdate(int no,String msg)
	{
		try
		{
			conn=dbconn.getConnection();
			String sql="UPDATE free_board_reply SET "
					 + "msg=? "
					 + "WHERE no=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, msg);
			ps.setInt(2, no);
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
	
	// 입력 
	public void replyInsert(FreeBoardReplyVO vo)
	{
		try
		{
			conn=dbconn.getConnection();
			String sql="INSERT INTO free_board_reply(no,bno,id,name,msg,group_id) "
				     +"VALUES(fbr_no_seq.nextval,?,?,?,?,"
				     +"(SELECT NVL(MAX(group_id)+1,1) FROM free_board_reply))";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, vo.getBno());
			ps.setString(2, vo.getId());
			ps.setString(3, vo.getName());
			ps.setString(4, vo.getMsg());
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
	
	// 댓글 삭제
	public void replyDelete(int no)
	{
		try
		{
			conn=dbconn.getConnection();
			conn.setAutoCommit(false);
			String sql="SELECT root,dept "
					 + "FROM free_board_reply "
					 + "WHERE no=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, no);
			ResultSet rs=ps.executeQuery();
			rs.next();
			int root=rs.getInt(1);
			int dept=rs.getInt(2);
			rs.close();
			
			if(dept==0)
			{
				sql="DELETE FROM free_board_reply "
						+ "WHERE no=?";
				ps=conn.prepareStatement(sql);
				ps.setInt(1, no);
				ps.executeUpdate();
			}
			else
			{
				String msg="관리자가 삭제한 댓글입니다.";
				sql="UPDATE free_board_reply SET "
						+ "msg=? "
						+ "WHERE no=?";
				ps=conn.prepareStatement(sql);
				ps.setString(1, msg);
				ps.setInt(2, no);
				ps.executeUpdate();
			}
			
			// dept 감소
			sql="UPDATE free_board_reply SET "
					+ "dept=dept-1 "
					+ "WHERE no=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, root);
			ps.executeUpdate();
			conn.commit();
		}catch(Exception ex)
		{
			try
			{
				conn.rollback();
			}catch(Exception e) {}
			ex.printStackTrace();
		}
		finally
		{
			try
			{
				conn.setAutoCommit(true);
			}catch(Exception ex) {}
			dbconn.disConnection(conn, ps);
		}
	}
	
	
}
