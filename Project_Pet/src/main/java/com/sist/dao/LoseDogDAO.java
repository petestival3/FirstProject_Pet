package com.sist.dao;
import java.util.*;

import com.sist.dbcp.CreateDBCPconnection;
import com.sist.vo.LoseDogVO;

import java.sql.*;
public class LoseDogDAO {
	private Connection conn;
	private PreparedStatement ps;
	private CreateDBCPconnection dbconn=
			new CreateDBCPconnection();
	private static LoseDogDAO dao;
	public static LoseDogDAO newInstance() // 싱글턴 
	{
		if(dao==null)
			dao=new LoseDogDAO();
		return dao;
	}
	// 실종 강아지 목록 
	public List<LoseDogVO> loseDogListData(int page)
	{
		List<LoseDogVO> list=new ArrayList<LoseDogVO>();
		try
		{
			conn=dbconn.getConnection();
			String sql="SELECT ldno,image,title,loseinfo,num "
					 + "FROM (SELECT ldno,image,title,loseinfo,rownum as num "
					 + "FROM (SELECT ldno,image,title,loseinfo "
					 + "FROM loseani ORDER BY hit DESC)) "
					 + "WHERE num BETWEEN ? AND ?";
			ps=conn.prepareStatement(sql);
			
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
	// 실종 강아지 총페이지
	// 실종 강아지 상세보기
}
