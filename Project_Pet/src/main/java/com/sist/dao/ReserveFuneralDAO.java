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
	  /*
	  <select id="reserveDays" resultType="string" parameterType="int">
		SELECT rday FROM FUNERAL_COMPANY_LIST
		WHERE cr_com_no=#{cr_com_no}
	  </select>
	  */
	  public static String reserveDays(int cr_com_no)
	  {
		  SqlSession session=ssf.openSession();
		  String rdays=session.selectOne("reserveDays",cr_com_no);
		  session.close();
		  return rdays;
	  }
	  /*
	  <select id="reserveTimes" resultType="string"
		parameterType="int">
		SELECT rd_time FROM res_f_day
		WHERE RD_NO=#{RD_NO }
	   </select>
	  */
	  public static String reserveTimes(int rd_no)
	  {
		  SqlSession session=ssf.openSession();
		  String rd_time=session.selectOne("reserveTimes",rd_no);
		  session.close();
		  return rd_time;
	  }
	  /*
	  <select id="reserveGetTime" resultType="string"
		parameterType="int">
		SELECT rt_time FROM res_f_time
		WHERE RT_NO=#{RT_NO}
	  </select>
	  */
	  public static String reserveGetTime(int rt_no)
	  {
		  SqlSession session=ssf.openSession();
		  String rt_time=session.selectOne("reserveGetTime",rt_no);
		  session.close();
		  return rt_time;
	  }
	  //예약 데이터 추가
	  public static void FuneralreserveInsert(FuneralReserveInfoVO vo)
	  {
		  SqlSession session=ssf.openSession(true);
		  try {
			  session.insert("FuneralreserveInsert",vo);
		  }catch(Exception ex) {
			  ex.printStackTrace();
		  }
		  session.close();
	  }
	  
	  
}
