package com.sist.temp;
import java.util.*;
import com.sist.vo.*;

import java.sql.*;
public class MyDAO {
  private Connection conn;
  private PreparedStatement ps;
  private final String URL="jdbc:oracle:thin:@localhost:1521:XE";
  
  // Config.xml
  public MyDAO()
  {
	  try
	  {
		  Class.forName("oracle.jdbc.driver.OracleDriver");
	  }catch(Exception ex) {}
  }
  public void getConnection()
  {
	  try
	  {
		  conn=DriverManager.getConnection(URL,"hr","happy");
	  }catch(Exception ex) {}
  }
  public void disConnection()
  {
	  try
	  {
		  if(ps!=null) ps.close();
		  if(conn!=null) conn.close();
	  }catch(Exception ex) {}
  }
  public List<Integer> funeralNumberData()
  {
	  List<Integer> list=new ArrayList<Integer>();
	  try
	  {
		  getConnection();// session=ssf.openSession()
		  String sql="SELECT CR_COM_NO FROM FUNERAL_COMPANY_LIST "
				    +"ORDER BY CR_COM_NO ASC";
		  ps=conn.prepareStatement(sql);
		  ResultSet rs=ps.executeQuery();
		  while(rs.next())
		  {
			  int CR_COM_NO=rs.getInt(1);
			  list.add(CR_COM_NO);
		  }
		  rs.close();
	  }catch(Exception ex)
	  {
		  ex.printStackTrace();
	  }
	  finally
	  {
		  disConnection();//session.close()
	  }
	  return list;
  }
  
  public void funeralTimeInsert(FuneralReserveDayVO vo)
  {
	  try
	  {
		  getConnection();
		  String sql="INSERT INTO res_f_day VALUES("
				    +"?,?)";
		  ps=conn.prepareStatement(sql);
		  ps.setInt(1, vo.getRd_no());
		  ps.setString(2, vo.getRd_time());
		  ps.executeUpdate();
	  }catch(Exception ex)
	  {
		  ex.printStackTrace();
	  }
	  finally
	  {
		  disConnection();
	  }
  }
  public void funeralDayInsert(FuneralListVO vo)
  {
	  try
	  {
		  getConnection();
		  String sql="UPDATE FUNERAL_COMPANY_LIST SET "
				    +"rday=? "
				    +"WHERE CR_COM_NO=?";
		  ps=conn.prepareStatement(sql);
		  ps.setString(1, vo.getRday());
		  ps.setInt(2, vo.getCR_COM_NO());
		  ps.executeUpdate();
	  }catch(Exception ex) 
	  {
		  ex.printStackTrace();
	  }
	  finally
	  {
		  disConnection();
	  }
  }
}