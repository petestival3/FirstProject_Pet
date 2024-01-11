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
	  
	  //예약 데이터 마이페이지 출력
	  public static List<FuneralReserveInfoVO> mypageReserveListData(String id)
	  {
		  SqlSession session=ssf.openSession();
		  List<FuneralReserveInfoVO> list=new ArrayList<FuneralReserveInfoVO>();
		  try {
			  list=session.selectList("mypageReserveListData",id);
			  session.close();
		  }catch(Exception ex) {
			  ex.printStackTrace();
		  }
		  return list;
	  }
	  
	//예약 데이터 삭제(취소)
	  public static void Funeralreservedelete(int rf_no)
	  {
		  SqlSession session=ssf.openSession(true);
		  try {
			  session.insert("Funeralreservedelete",rf_no);
		  }catch(Exception ex) {
			  ex.printStackTrace();
		  }
		  session.close();
	  }
	  
	  /*<!-- 어드민페이지 예약정보 읽기-->
  <select id="reserveAdminPageListData" resultType="FuneralReserveInfoVO">
    SELECT RF_NO, RF_DAY, RF_TIME, RF_INWON, RF_OK, id
     FROM RES_FUNERAL_INFO
     ORDER BY RF_NO DESC
  </select>
	   */
	  public static List<FuneralReserveInfoVO> reserveAdminPageListData()
	  {
		  SqlSession session=ssf.openSession();
		  List<FuneralReserveInfoVO> list=session.selectList("reserveAdminPageListData");
		  session.close();
		  return list;
	  }
	  /*<!-- 예약 대기 (0)--> 
  <!-- 어드민 예약 승인 (1)--> 
  <update id="reserveAdminOk" parameterType="int">
    UPDATE RES_FUNERAL_INFO SET
    rf_ok=1
    WHERE rf_no=#{rf_no}
  </update>
  */
	  public static void reserveAdminOk(int rf_no)
	  {
		  SqlSession session=ssf.openSession(true);
		  session.update("reserveAdminOk",rf_no);
		  session.close();
	  }
	  
  /*
  <!-- 어드민 예약 반려 (2)-->
  <update id="reserveAdminNo" parameterType="int">
    UPDATE RES_FUNERAL_INFO SET
    rf_ok=2
    WHERE rf_no=#{rf_no}
  </update>
  */
	  public static void reserveAdminNo(int rf_no)
	  {
		  SqlSession session=ssf.openSession(true);
		  session.update("reserveAdminNo",rf_no);
		  session.close();
	  }

}
