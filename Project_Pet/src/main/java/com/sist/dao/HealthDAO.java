package com.sist.dao;
import java.util.*;
import java.sql.*;
import com.sist.dbcp.*;
import com.sist.vo.HealthVO;

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
			String sql="SELECT pn.pno,news_subject,news_img,news_content,newsdate_1,newsdate_2  "
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
}
