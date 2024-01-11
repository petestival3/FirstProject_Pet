package com.sist.dao;
import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import java.sql.*;

import com.sist.dbcp.CreateDBCPconnection;
import com.sist.vo.*;
public class StayReserveDAO {
	private static SqlSessionFactory ssf=CommonsDataBase.getSsf();
	private Connection conn;
	private PreparedStatement ps;
	private CreateDBCPconnection dbconn=new CreateDBCPconnection();
	private static StayReserveDAO dao;
	
	public static StayReserveDAO newInstance() {
		if(dao==null)
			dao=new StayReserveDAO();
		return dao;
	}
	
	public static void stayreserveInsert(ReserveStayInfoVO vo) {
		SqlSession session=ssf.openSession(true);
		// true => Commit => insert,update,delete는 true 해주기
		session.insert("stayreserveInsert",vo);
		session.close();
	}
	
	
	public void stayroominsert(ReserveStayInfoVO vo) {
		try
		   {
			   conn=dbconn.getConnection();
			   String sql="INSERT INTO reserve_stay_info VALUES("
			   		+ "rsi_no_seq.nextval,"
			   		+ "?,?,?,?,?,SYSDATE,0,?,?"
			   		+ ")";
			   ps=conn.prepareStatement(sql);
			   ps.setString(1, vo.getId());
			   ps.setInt(2, vo.getStay_no());
			   ps.setString(3, vo.getCheckin());
			   ps.setString(4, vo.getCheckout());
			   ps.setString(5, vo.getInwon());
			   ps.setString(6, vo.getRoomname());
			   ps.setString(7, vo.getRoomimage());
			   
			   ps.executeUpdate();
			   // save(vo)
		   }catch(Exception ex)
		   {
			   ex.printStackTrace();
		   }
		   finally
		   {
			   dbconn.disConnection(conn, ps);
		   }
	}
	
	public static List<ReserveStayInfoVO> reserveAdminPageStayListData()
	  {
		  SqlSession session=ssf.openSession();
		  List<ReserveStayInfoVO> list=session.selectList("reserveAdminPageStayListData");
		  session.close();
		  return list;
	  }
	
	public static void reserveStayAdminOk(int rno)
	  {
		  SqlSession session=ssf.openSession(true);
		  session.update("reserveStayAdminOk",rno);
		  session.close();
	  }
	public static void reserveStayAdminNo(int rno)
	  {
		  SqlSession session=ssf.openSession(true);
		  session.update("reserveStayAdminNo",rno);
		  session.close();
	  }
	  public static void stayReserveDelete(int rno)
	  {
		  SqlSession session=ssf.openSession(true);
		  try {
			  session.insert("stayReserveDelete",rno);
		  }catch(Exception ex) {
			  ex.printStackTrace();
		  }
		  session.close();
	  }
	
}
