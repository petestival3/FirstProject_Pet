package com.sist.dao;
import java.util.*;
import java.sql.*;
import com.sist.dbcp.*;
import com.sist.vo.FreeBoardReplyVO;
import com.sist.vo.HealthVO;
import com.sist.vo.WalkReplyVO;
import com.sist.vo.WalkVO;

public class HealthDAO {
	private Connection conn;
	private PreparedStatement ps;
	private CreateDBCPconnection dbconn=new CreateDBCPconnection();
	private static HealthDAO dao;
	
	private int row_size=12;
	public static HealthDAO newInstance()
	{
		if(dao==null)
			dao=new HealthDAO();
		return dao;
	}
	// 병원 전체 리스트 출력
	public List<HealthVO> hsptTotalList(int page)
	{
		List<HealthVO> list=new ArrayList<HealthVO>();
		
		int start=(page*row_size)-(row_size-1);
		int end=(page*row_size);
		try
		{
			conn=dbconn.getConnection();
				String sql="SELECT no,hospital_name,hospital_address,hospital_phone "
						+ "FROM(SELECT no,hospital_name,hospital_address,hospital_phone,ROWNUM AS num "
						+ "FROM(SELECT no,hospital_name,hospital_address,hospital_phone "
						+ "FROM hospital_search ORDER BY no ASC)) "
						+ "WHERE num BETWEEN ? AND ?";
				ps=conn.prepareStatement(sql);
				ps.setInt(1, start);
				ps.setInt(2, end);
				ResultSet rs=ps.executeQuery();
				while(rs.next())
				{
					HealthVO vo=new HealthVO();
					vo.setNo(rs.getInt(1));
					vo.setHospital_name(rs.getString(2));
					vo.setHospital_address(rs.getString(3));
					vo.setHospital_phone(rs.getString(4));
					list.add(vo);
				}
				rs.close();
				
			}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		finally
		{
			dbconn.disConnection(conn, ps);
		}
		
		return list;
	}

	// 병원 전체 페이지 
	public int hsptTotalPage()
	{
		int total=0;
		
		try
		{
			conn=dbconn.getConnection();
			String sql="SELECT CEIL(COUNT(*)/"+row_size+") "
		            +"FROM hospital_search";
			ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			rs.next();
			total=rs.getInt(1);
			rs.close();
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		finally
		{
			dbconn.disConnection(conn, ps);
		}
		return total;
	}
	// 병원 검색 페이지 출력 
	public List<HealthVO> hsptSearchList(int page,String fd,String st)
	{
		
		List<HealthVO> list=new ArrayList<HealthVO>();
		try
		{
			conn=dbconn.getConnection();
			int start=(page*row_size)-(row_size-1);
			int end=(page*row_size);
	
			if (st.equals("전체")&&(fd!=null))
			{
			   String sql="SELECT no,hospital_name,hospital_address,hospital_phone,num "
						+ "FROM(SELECT no,hospital_name,hospital_address,hospital_phone,ROWNUM AS num "
						+ "FROM(SELECT no,hospital_name,hospital_address,hospital_phone "
						+ "FROM hospital_search WHERE hospital_name LIKE '%'||?||'%' "
						+ "ORDER BY no ASC)) "
						+ "WHERE num BETWEEN ? AND ?";
//			   System.out.println("Executing SQL for 전체: " + sql);
//			   System.out.println("전체 출력");
			    ps=conn.prepareStatement(sql);
	            ps.setString(1, fd);
				ps.setInt(2, start);
				ps.setInt(3, end);
			}
			else{
	          String sql = "SELECT no, hospital_name, hospital_address, hospital_phone, num "
	                    + "FROM (SELECT no, hospital_name, hospital_address, hospital_phone, ROWNUM AS num "
	                    + "FROM (SELECT no, hospital_name, hospital_address, hospital_phone "
	                    + "FROM hospital_search WHERE state = ? AND hospital_name LIKE '%'||?||'%' "
	                    + "ORDER BY no ASC)) "
	                    + "WHERE num BETWEEN ? AND ?";
//	          System.out.println("Executing SQL for specific state: " + sql); 
//	          System.out.println("서울 출력");
	           ps = conn.prepareStatement(sql);
	            ps.setString(1, st);
	            ps.setString(2, fd);
	            ps.setInt(3, start);
	            ps.setInt(4, end);
	        }
			ResultSet rs = ps.executeQuery();
	        while (rs.next()) {
	            HealthVO vo = new HealthVO();
	            vo.setNo(rs.getInt(1));
	            vo.setHospital_name(rs.getString(2));
	            vo.setHospital_address(rs.getString(3));
	            vo.setHospital_phone(rs.getString(4));
	            list.add(vo);
	        }
	        rs.close();
			}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		finally
		{
			dbconn.disConnection(conn, ps);
		}
		System.out.println(list.size());
		return list;
	}
	// 병원 검색 전체 페이지 
			public int hsptSearchTotalPage(String fd, String st)
			{
			
				int total=0;
				try
				{
					if (st.equals("전체")&&(fd!=null))
					{
					conn=dbconn.getConnection();
					String sql="SELECT CEIL(COUNT(*)/"+row_size+") "
				            +"FROM hospital_search "
				            +"WHERE hospital_name LIKE '%'||?||'%'";
					ps=conn.prepareStatement(sql);
				    ps.setString(1,fd);
				    }
					else
					{
					conn=dbconn.getConnection();
					String sql="SELECT CEIL(COUNT(*)/"+row_size+") "
				            +"FROM hospital_search "
				            +"WHERE state=? AND hospital_name LIKE '%'||?||'%'";
					ps=conn.prepareStatement(sql);
				    ps.setString(1,st);
			        ps.setString(2,fd);	
				    }
					ResultSet rs=ps.executeQuery();
					rs.next();
					total=rs.getInt(1);
					rs.close();
				}
				catch(Exception ex)
				{
					ex.printStackTrace();
				}
				finally
				{
					dbconn.disConnection(conn, ps);
				}
				return total;
			}

	
	// 병원찾기상세페이지 출력
	public HealthVO hsptDetailList(int no)
	{
		HealthVO vo=new HealthVO();
		try
		{
			conn=dbconn.getConnection();
			String sql="SELECT no,hospital_name,hospital_address,hospital_phone FROM hospital_search "
					+ "WHERE no="+no;
			ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			rs.next();
			vo.setNo(rs.getInt(1));
			vo.setHospital_name(rs.getString(2));
			vo.setHospital_address(rs.getString(3));
			vo.setHospital_phone(rs.getString(4));
			rs.close();	
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		finally
		{
			dbconn.disConnection(conn, ps);
		}
		return vo;
	}
		
		// 병원 시도 정보 (Model=>list2)
		public List<HealthVO> HsptStateData()
		{
			List<HealthVO> list=new ArrayList<HealthVO>();
			try
			{
				conn=dbconn.getConnection();
				String sql="SELECT DISTINCT state "
						+ "FROM hospital_search";
				 ps=conn.prepareStatement(sql);
				 ResultSet rs=ps.executeQuery();
				   
				   while(rs.next())
				   {
					   HealthVO vo=new HealthVO();
					   vo.setState(rs.getString(1));
					   list.add(vo);
				   }
				   rs.close();
				 
			}
			catch(Exception ex)
			{
				ex.printStackTrace();
			}
			finally
			{
				dbconn.disConnection(conn, ps);
			}
			return list;
		}
	
	// 뉴스 전체 데이터
	public List<HealthVO> hsptNewsList(int page)
	{
		
		List<HealthVO> list=new ArrayList<HealthVO>();
		try
		{
			conn=dbconn.getConnection();
			String sql="SELECT pno,news_subject,news_img,num "
					+ "FROM(SELECT pno,news_subject,news_img,ROWNUM AS num "
					+ "FROM(SELECT pno,news_subject,news_img "
					+ "FROM petnews "
					+ "ORDER BY pno ASC)) "
					+ "WHERE num BETWEEN ? AND ?";
			int start=(page*row_size)-(row_size-1);
			int end=(page*row_size);
			ps=conn.prepareStatement(sql);
			ps.setInt(1, start);
			ps.setInt(2, end);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				HealthVO vo=new HealthVO();
				vo.setNo2(rs.getInt(1));
				vo.setNews_subject(rs.getString(2));
				vo.setNews_img(rs.getString(3));
				list.add(vo);
			}
			rs.close();
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		finally
		{
			dbconn.disConnection(conn, ps);
		}
		
		return list;
	}
	// 뉴스 검색 전체 페이지 
				public int newsearchTotalPage()
				{	
					int total=0;
					try
					{
						
						conn=dbconn.getConnection();
						String sql="SELECT CEIL(COUNT(*)/"+row_size+") "
					            +"FROM petnews ";
						ps=conn.prepareStatement(sql);

//						else
//						{
//						conn=dbconn.getConnection();
//						String sql="SELECT CEIL(COUNT(*)/"+row_size+") "
//					            +"FROM hospital_search "
//					            +"WHERE state=? AND hospital_name LIKE '%'||?||'%'";
//						ps=conn.prepareStatement(sql);
//					    ps.setString(1,st);
//				        ps.setString(2,fd);	
//					    }
						ResultSet rs=ps.executeQuery();
						rs.next();
						total=rs.getInt(1);
						rs.close();
					}
					catch(Exception ex)
					{
						ex.printStackTrace();
					}
					finally
					{
						dbconn.disConnection(conn, ps);
					}
					return total;
				}
// 뉴스 상세 페이지
	public HealthVO NewsDetailList(int no)
	{
		HealthVO vo=new HealthVO();
		try
		{
			conn=dbconn.getConnection();
			String sql="UPDATE petnews SET "
					+"hit=hit+1 "
					+"WHERE pno="+no;
			ps=conn.prepareStatement(sql);
			ps.executeUpdate();
			
					sql="SELECT pn.pno,news_subject,news_img,news_content,newsdate_1,newsdate_2,hit  "
					+ "FROM petnews pn "
					+ "INNER JOIN petnews_sub pns ON pn.pno=pns.pno "
					+ "INNER JOIN newsdate ON pn.pno = newsdate.pno "
					+ "WHERE pn.pno="+no;
			ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			rs.next();
			vo.setNo(rs.getInt(1));
			vo.setNews_subject(rs.getString(2));
			vo.setNews_img(rs.getString(3));
			vo.setNews_content(rs.getString(4));
			vo.setNews_date1(rs.getString(5));
			vo.setNews_date2(rs.getString(6));
			vo.setHit(rs.getInt(7));
			rs.close();	
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		finally
		{
			dbconn.disConnection(conn, ps);
		}
		return vo;
	}
	public List<HealthVO> hitnews()
	{
		
		List<HealthVO> list=new ArrayList<HealthVO>();
		try
		{
			conn=dbconn.getConnection();
			String sql="SELECT pn.pno,news_subject,news_img,newsdate_1 "
					+ "FROM petnews pn "
					+ "INNER JOIN petnews_sub pns ON pn.pno=pns.pno "
					+ "INNER JOIN newsdate ON pn.pno = newsdate.pno "
					+ "ORDER BY hit DESC";
			ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				HealthVO vo=new HealthVO();
				vo.setNo2(rs.getInt(1));
				vo.setNews_subject(rs.getString(2));
				vo.setNews_img(rs.getString(3));
				vo.setNews_date1(rs.getString(4));
				list.add(vo);
			}
			
			rs.close();
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		finally
		{
			dbconn.disConnection(conn, ps);
		}
		
		return list;
	}
	public List<WalkReplyVO> newsReplyShow(int no) // 뉴스 댓글 출력 
	{
		List<WalkReplyVO> list=new ArrayList<WalkReplyVO>();
		try {
			conn = dbconn.getConnection();
			String sql = "SELECT rno,userid,rcontent,rdate,bno "
					+ "FROM board_reply "
					+ "WHERE typeno='3' AND bno="+no+" "
					+ "ORDER BY group_id DESC ";
			ps = conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				WalkReplyVO vo=new WalkReplyVO();
				vo.setRno(rs.getInt(1));
				vo.setUserid(rs.getString(2));
				vo.setRcontent(rs.getString(3));
				vo.setDbday(rs.getString(4));
				vo.setBno(rs.getInt(5));
				list.add(vo);
			}
			rs.close();
			ps.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			dbconn.disConnection(conn, ps);
		}
		return list;

	}
		
		public void newsReply(WalkReplyVO vo,String pwd,int no) // 뉴스 댓글 인서트
		{
			try
			{
				conn=dbconn.getConnection();
				String sql="INSERT INTO board_reply(rno,typeno,group_id,userid,bno,pwd,rcontent) "
						+"VALUES(board_reply_seq.nextval,"
						+ "3,(SELECT NVL((MAX(group_id)+1),1) FROM board_reply),"
						+ "?,?,?,?)";
				ps=conn.prepareStatement(sql);
				ps.setString(1, vo.getUserid());
				ps.setInt(2, no);
				ps.setString(3, pwd);
				ps.setString(4, vo.getRcontent());
				ps.executeUpdate();
				System.out.println("뉴스댓글완료");
			}catch(Exception ex)
			{
				ex.printStackTrace();
			}
			finally
			{
				dbconn.disConnection(conn, ps);
			}
		
	}
	public String newsReplyDelete(int rno,String pwd) // 뉴스 댓글 삭제
	{
		String result="";
		try {
			conn = dbconn.getConnection();
			String sql="SELECT pwd FROM board_reply "
					 + "WHERE rno="+rno;
			ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			rs.next();
			String db_pwd=rs.getString(1);
			rs.close();
			ps.close();

			if(db_pwd.equals(pwd))
			{
				result = "yes";
				sql = "DELETE FROM board_reply WHERE typeno='3' AND rno="+rno;
				ps=conn.prepareStatement(sql);
				ps.executeUpdate();
				System.out.println("뉴스댓글삭제완료");
				ps.close();
			}
			else
			{
				result="no";
			}
			
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			dbconn.disConnection(conn, ps);
		}
		return result;

	}
}
