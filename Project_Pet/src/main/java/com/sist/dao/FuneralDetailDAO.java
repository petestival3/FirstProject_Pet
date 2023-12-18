package com.sist.dao;
import java.util.*;
import java.sql.*;
import com.sist.vo.*;

public class FuneralDetailDAO {
	private Connection conn;
	private PreparedStatement ps;
	private final String URL="jdbc:oracle:thin:@211.238.142.102:1521:XE";
	private static FuneralDetailDAO dao;
	
	public FuneralDetailDAO() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		}catch(Exception ex) {}
	}
	public void getConnection() {
		try {
			conn=DriverManager.getConnection(URL,"hr","happy");
		}catch(Exception ex) {}
	}
	// 오라클 닫기
	public void disConnection() {
		try {
			if(ps!=null) ps.close();
			if(conn!=null) conn.close();
		}catch(Exception ex) {}
	}
	public static FuneralDetailDAO newInstance() {
		// 라이브러리 => newInstance, getInstance() => 싱글턴
		if(dao==null) 
			dao=new FuneralDetailDAO();
		return dao;
	}
	//데이터 리스트
	public List<FuneralDetailVO> FuneralListData()
	{
		List<FuneralDetailVO> list=new ArrayList<FuneralDetailVO>();
		try{
			getConnection();
			String sql="SELECT mno, infoimage, infoh3, infop "
					+ "FROM FUNERALINFO";
			ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
			FuneralDetailVO fdvo=new FuneralDetailVO();
			fdvo.setMno(rs.getInt(1));
			fdvo.setInfoimage(rs.getString(2));
			fdvo.setInfoh3(rs.getString(3));
			fdvo.setInfop(rs.getString(4));
			list.add(fdvo);
			}
			rs.close();
		}catch(Exception ex)
		{
			ex.printStackTrace();
		}finally
		{
			disConnection();
		}
		return list;
	}
	
	//상세보기......
	public FuneralDetailVO FuneralDetailData(int mno)
	{
		FuneralDetailVO fdvo=new FuneralDetailVO();
		try {
			getConnection();
			String sql="SELECT mno, infoimage, infoh3, infop "
					+ "FROM FUNERALINFO";
			ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			rs.next();
			fdvo.setMno(rs.getInt(1));
			fdvo.setInfoimage(rs.getString(2));
			fdvo.setInfoh3(rs.getString(3));
			fdvo.setInfop(rs.getString(4));
			rs.close();
		}catch(Exception ex)
		{
			ex.printStackTrace();
		}finally
		{
			disConnection();
		}
		return fdvo;
	}
	
	
}
