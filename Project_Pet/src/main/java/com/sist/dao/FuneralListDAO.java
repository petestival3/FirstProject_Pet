package com.sist.dao;

import java.util.*;
import java.sql.*;
import com.sist.vo.*;
import com.sist.dbcp.*;

public class FuneralListDAO {
	private Connection conn;
	private PreparedStatement ps;
	private CreateDBCPconnection dbconn = new CreateDBCPconnection();
	private final String URL = "jdbc:oracle:thin:@211.238.142.102:1521:XE";
	private static FuneralListDAO dao;

	// 싱글턴
	public static FuneralListDAO newInstance() {
		// 라이브러리 => newInstance, getInstance() => 싱글턴
		if (dao == null)
			dao = new FuneralListDAO();
		return dao;
	}
	
	 // 장례식장 전체 리스트 출력
	   public List<FuneralListVO> funeralListData(int page)
	   {
		   List<FuneralListVO> list=new ArrayList<FuneralListVO>();
		   try
		   {
			   conn=dbconn.getConnection();
			   String sql="SELECT CR_COM_NO,CR_COM_SECTOR,CR_COM_NAME,CR_COM_PHONE,CR_COM_LOC,CR_COM_HOMEPAGE,num "
					     +"FROM (SELECT CR_COM_NO,CR_COM_SECTOR,CR_COM_NAME,CR_COM_PHONE,CR_COM_LOC,CR_COM_HOMEPAGE,rownum as num "
					     +"FROM (SELECT CR_COM_NO,CR_COM_SECTOR,CR_COM_NAME,CR_COM_PHONE,CR_COM_LOC,CR_COM_HOMEPAGE "
					     +"FROM FUNERAL_COMPANY_LIST ORDER BY CR_COM_NO ASC)) "
					     +"WHERE num BETWEEN ? AND ?";
			   ps=conn.prepareStatement(sql);
			   int rowSize=20;
			   int start=(rowSize*page)-(rowSize-1);
			   int end=rowSize*page;
			   
			   ps.setInt(1, start);
			   ps.setInt(2, end);
			   
			   ResultSet rs=ps.executeQuery();
			   while(rs.next())
			   {
				   FuneralListVO vo=new FuneralListVO();
				   vo.setCR_COM_NO(rs.getInt(1));
				   vo.setCR_COM_SECTOR(rs.getString(2));
				   vo.setCR_COM_NAME(rs.getString(3));
				   vo.setCR_COM_PHONE(rs.getString(4));
				   vo.setCR_COM_LOC(rs.getString(5));
				   vo.setCR_COM_HOMEPAGE(rs.getString(6));
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
	
	//장례식장 목록 페이지 나누기
	   public int funeralListTotalPage()
	   {
		   int total=0;
		   try
		   {
			   conn=dbconn.getConnection();
			   String sql="SELECT CEIL(COUNT(*)/20.0) "
					     +"FROM FUNERAL_COMPANY_LIST";
					     
			   ps=conn.prepareStatement(sql);
			   ResultSet rs=ps.executeQuery();
			   rs.next();
			   total=rs.getInt(1);
			   rs.close();
		   }catch(Exception ex)
		   {
			   ex.printStackTrace();
		   }
		   finally
		   {
			   dbconn.disConnection(conn, ps);
		   }
		   return total;
	   }
	   
	   //장례 리스트 목록 상세보기 (다이얼로그)
	   public FuneralListVO funeralFindDetailData(int CR_COM_NO)
	   {
		   FuneralListVO vo=new FuneralListVO();
		   try
		   {
			   conn=dbconn.getConnection();
			   String sql="SELECT CR_COM_NO,CR_COM_SECTOR,CR_COM_NAME,CR_COM_PHONE,CR_COM_LOC,CR_COM_HOMEPAGE "
					     +"FROM FUNERAL_COMPANY_LIST "
					     +"WHERE CR_COM_NO="+CR_COM_NO;
			   ps=conn.prepareStatement(sql);
			   ResultSet rs=ps.executeQuery();
			   rs.next();
			   vo.setCR_COM_NO(rs.getInt(1));
			   vo.setCR_COM_SECTOR(rs.getString(2));
			   vo.setCR_COM_NAME(rs.getString(3));
			   vo.setCR_COM_PHONE(rs.getString(4));
			   vo.setCR_COM_LOC(rs.getString(5));
			   vo.setCR_COM_HOMEPAGE(rs.getString(6));
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
}
