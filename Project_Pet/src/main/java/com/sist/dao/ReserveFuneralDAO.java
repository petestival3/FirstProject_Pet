package com.sist.dao;
import com.sist.vo.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.*;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

public class ReserveFuneralDAO {
	private Connection conn;
	  private PreparedStatement ps;
	  private static SqlSessionFactory ssf=CommonsDataBase.getSsf();
	  private static ReserveFuneralDAO dao;
	  
	  public static List<FuneralListVO> reserveFuneralListData(int no)
	  {
		  SqlSession session=ssf.openSession();
		  Map map=new HashMap();
		  map.put("no", no);
		  List<FuneralListVO> list=session.selectList("reserveFuneralListData",map);
		  session.close();
		  return list;
	  }
}
