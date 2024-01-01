package com.sist.dao;
import java.util.*;
import java.sql.*;
import com.sist.dbcp.*;
import com.sist.vo.MyPageVO;

public class MyPageDAO {
	private Connection conn;
	private PreparedStatement ps;
	private CreateDBCPconnection dbconn=new CreateDBCPconnection();
	private static MyPageDAO dao;
	
	public static MyPageDAO newInstance()
	{
		if(dao==null)
			dao=new MyPageDAO();
		return dao;
	}
	
	public void petRegInsert(MyPageVO vo)
	{
		try
		{
			conn=dbconn.getConnection();
			String sql="INSERT INTO pet_reg (petno, user_id, pet_image, pet_name, pet_bday, pet_gender, pet_check, pet_weight, pet_filename,pet_filesize) "
					+ "VALUES (pr_petno_seq.nextval,?,?,?,?,?,?,?,?,?)";
			ps=conn.prepareStatement(sql);
			ps.setString(1, vo.getUser_id());
			ps.setString(2, vo.getPet_image());
			ps.setString(3, vo.getPet_name());
			ps.setString(4, vo.getPet_bday());
			ps.setString(5, vo.getPet_gender());
			ps.setString(6, vo.getPet_check());
			ps.setString(7, vo.getPet_weight());
			ps.setString(8, vo.getPet_filename());
			ps.setInt(9, vo.getPet_filesize());
			
			ps.executeUpdate();
			
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		finally 
		{
			dbconn.disConnection(conn, ps);
		}
	}
		
	public MyPageVO mypagePet(String id)
	{
		MyPageVO vo=new MyPageVO();
		try
		{
			conn=dbconn.getConnection();
			String sql="SELECT pet_filename, pet_name, pet_bday, pet_gender, pet_weight "
					+ "FROM pet_reg "
					+ "WHERE user_id=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, id);
			ResultSet rs=ps.executeQuery();
			if (rs.next()) {
	            vo.setPet_filename(rs.getString(1));
	            vo.setPet_name(rs.getString(2));
	            vo.setPet_bday(rs.getString(3));
	            vo.setPet_gender(rs.getString(4));
	            vo.setPet_weight(rs.getString(5));
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
		return vo;
	}
	public MyPageVO mypagePetInfo(String id)
	{
		MyPageVO vo=new MyPageVO();
		try
		{
			conn=dbconn.getConnection();
			String sql="UPDATE pet_reg "
					+ "SET pet_filename=?, pet_name=?, pet_bday=?, pet_gender=?, pet_weight=? "
					+ "WHERE user_id=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, vo.getPet_filename());
			ps.setString(2, vo.getPet_name());
			ps.setString(3, vo.getPet_bday());
			ps.setString(4, vo.getPet_gender());
			ps.setString(5, vo.getPet_weight());
			ps.setString(6, id);
			ps.executeUpdate();

			vo.setPet_filename(vo.getPet_filename());
			vo.setPet_name(vo.getPet_name());
			vo.setPet_bday(vo.getPet_bday());
			vo.setPet_gender(vo.getPet_gender());
			vo.setPet_weight(vo.getPet_weight());

			
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
