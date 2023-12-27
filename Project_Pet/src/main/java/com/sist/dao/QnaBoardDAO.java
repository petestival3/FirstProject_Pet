package com.sist.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;

import com.sist.dbcp.CreateDBCPconnection;
import com.sist.vo.QnaBoardVO;

public class QnaBoardDAO {
	private Connection conn;
	private PreparedStatement ps;
	private CreateDBCPconnection dbconn
			=new CreateDBCPconnection();
	private static QnaBoardDAO dao;
	
	// 싱글턴 
	public static QnaBoardDAO newInstance()
	{
		if(dao==null)
			dao=new QnaBoardDAO();
		return dao;
	}
	
	public List<QnaBoardVO> qnaBoardListData(int page)
	{
		List<QnaBoardVO> list=dao.qnaBoardListData(page);
		try
		{
			conn=dbconn.getConnection();
			String sql="SELECT qno,qtitle,qwriter,"
					 + "TO_CHAR(qregdate,'YYYY-MM-DD'),qhit,group_tab,num "
					 + "FROM (SELECT qno,qtitle,qwriter,qregdate,qhit,group_tab,rownum as num "
					 + "FROM (SELECT qno,qtitle,qwriter,qregdate,qhit,group_tab "
					 + "FROM QnaBoard ORDER BY group_id DESC,group_step ASC)) "
					 + "WHERE num BETWEEN ? AND ?";
			ps=conn.prepareStatement(sql);
			int rowSize=10;
			int start=(rowSize*page)-(rowSize-1);
			int end=rowSize*page;
			
			ps.setInt(1, start);
			ps.setInt(2, end);
			
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				QnaBoardVO vo=new QnaBoardVO();
				vo.setQno(rs.getInt(1));
				vo.setQtitle(rs.getString(2));
				vo.setQwriter(rs.getString(3));
				vo.setDbday(rs.getString(4));
				vo.setQhit(rs.getInt(5));
				vo.setGroup_tab(rs.getInt(6));
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
	public int qnaBoardRowCount()
	{
		int count=0;
		try
		{
			conn=dbconn.getConnection();
			String sql="SELECT COUNT(*) FROM qnaBoard";
			ps=conn.prepareStatement(sql);
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
	public void qnaBoardInsert(QnaBoardVO vo)
	{
		try
		{
			conn=dbconn.getConnection();
			String sql="INSERT INTO qnaBoard("
					 + "qno,qwriter,qtitle,qcontent,qpwd,group_id) "
					 + "VALUES(qna_qno_seq.nextval,?,?,?,?,"
					 + "(SELECT NVL(MAX(group_id)+1,1) FROM qnaBoard))";
			ps=conn.prepareStatement(sql);
			ps.setString(1, vo.getQwriter());
			ps.setString(2, vo.getQtitle());
			ps.setString(3, vo.getQcontent());
			ps.setString(4, vo.getQpwd());
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
	
	// 상세보기 => 기능처리 (모든 메소드에 SQL 문장이 1개가 아니다)
	public QnaBoardVO qnaBoardDetailData(int qno)
	{
		QnaBoardVO vo=new QnaBoardVO();
		try
		{
			conn=dbconn.getConnection();
			String sql="UPDATE qnaBoard SET "
					+ "hit=hit+1 "
					+ "WHERE qno="+qno; // 여기까지는 같은 사람이 왔다 갔다해도 조회수 증가
			ps=conn.prepareStatement(sql);
			ps.executeUpdate();
			
			// 조회수 증가
			sql="SELECT qno,qwriter,qtitle,qcontent,TO_CHAR(qregdate,'YYYY-MM-DD HH24:MI:SS'),hit "
					+ "FROM qnaBoard "
					+ "WHERE qno="+qno;
			ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			rs.next();
			vo.setQno(rs.getInt(1));
			vo.setQwriter(rs.getString(2));
			vo.setQtitle(rs.getString(3));
			vo.setQcontent(rs.getString(4));
			vo.setDbday(rs.getString(5));
			vo.setQhit(rs.getInt(6));
			rs.close();
		}catch(Exception ex)
		{
			ex.printStackTrace();
		}
		finally
		{
			dbconn.disConnection(conn, ps);
		}
		return vo;
	}
	
	// 수정 데이터 읽기(수정은 메소드 2개로 이루어져 있다)
	public QnaBoardVO qnaBoardUpdateData(int qno)
	{
		QnaBoardVO vo=new QnaBoardVO();
		try
		{
			conn=dbconn.getConnection();
			String sql="SELECT qno,qwriter,qtitle,qcontent "
					+ "FROM qnaBoard "
					+ "WHERE qno="+qno;
			ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			rs.next();
			vo.setQno(rs.getInt(1));
			vo.setQwriter(rs.getString(2));
			vo.setQtitle(rs.getString(3));
			vo.setQcontent(rs.getString(4));
			rs.close();
		}catch(Exception ex)
		{
			ex.printStackTrace();
		}
		finally
		{
			dbconn.disConnection(conn, ps);
		}
		return vo;
	}
	
	// 실제 수정 => request,response => Ajax (70%)
	public boolean qnaBoardUpdate(QnaBoardVO vo)
	{
		boolean bCheck=false;
		try
		{
			conn=dbconn.getConnection();
			String sql="SELECT qpwd FROM qnaBoard "
					+ "WHERE qno="+vo.getQno();
			ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			rs.next();
			String db_pwd=rs.getString(1);
			rs.close();
			
			if(db_pwd.equals(vo.getQpwd()))
			{
				bCheck=true;
				sql="UPDATE qnaBoard SET "
				  + "qwriter=?,qtitle=?,qcontent=? "
				  + "WHERE qno=?";
				ps=conn.prepareStatement(sql);
				ps.setString(1, vo.getQwriter());
				ps.setString(2, vo.getQtitle());
				ps.setString(3, vo.getQcontent());
				ps.setInt(4, vo.getQno());
				
				ps.executeUpdate();
			}
		}catch(Exception ex)
		{
			ex.printStackTrace();
		}
		finally
		{
			dbconn.disConnection(conn, ps);
		}
		return bCheck;
	}
	
	// 답변
	public void qnaBoardReplyInsert(int pno,QnaBoardVO vo)
	{
		// 1. pno가 갖고 있는 group_id,step,tab 가지고 온다
				// 2. => 답변형의 핵심
				/* 
				                  gi   gs   gt
				 	AAAAA         1    0    0
				 	  =>BBBBB     1    1    1
				 	   =>CCCCC    1    2    2
				 	  =>KKKKK     1    1    1   ASC => BBBBB아래로 붙어버리는 오류 발생
				 	DDDDD         2    0    0
				 	  (새로운 답변이 달리면 그 그룹의 맨위에 붙일지 아래에 붙일지 정해야 한다)
				 */
				// 3. 실제 INSERT
				// 4. depth 증가시키기 (답글이 몇개 달렸냐)
		try
		{
			conn=dbconn.getConnection();
			String sql="SELECT group_id,group_step,group_tab "
					 + "FROM qnaBoard "
					 + "WHERE qno="+pno;
			ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			rs.next();
			int group_id=rs.getInt(1);
			int group_step=rs.getInt(2);
			int group_tab=rs.getInt(3);
			rs.close();
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








