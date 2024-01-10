package com.sist.dao;
import java.util.*;

import javax.mail.Session;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import java.sql.*;
import com.sist.dbcp.*;
import com.sist.vo.*;

public class MyPageDAO {
	private Connection conn;
	private PreparedStatement ps;
	private CreateDBCPconnection dbconn=new CreateDBCPconnection();
	private static SqlSessionFactory ssf=CommonsDataBase.getSsf();
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
			String sql="SELECT pet_filename, pet_name, pet_bday, pet_gender, pet_check, pet_weight "
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
	            vo.setPet_check(rs.getString(5));
	            vo.setPet_weight(rs.getString(6));
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
	public void mypagePetUpdate(String id, MyPageVO vo)
	{
	    try
	    {
	        conn = dbconn.getConnection();

	        String sql = "UPDATE pet_reg "
	                + "SET pet_name=?, pet_bday=?, pet_gender=?,pet_check=?, pet_weight=?, pet_filename=? "
	                + "WHERE user_id=?";
	        ps = conn.prepareStatement(sql);
	        ps.setString(1, vo.getPet_name());
	        ps.setString(2, vo.getPet_bday());
	        ps.setString(3, vo.getPet_gender());
	        ps.setString(4, vo.getPet_check());
	        ps.setString(5, vo.getPet_weight());
	        ps.setString(6, vo.getPet_filename());
	        ps.setString(7, id);
	        ps.executeUpdate();
	    }
	       
	    catch (Exception ex)
	    {
	        ex.printStackTrace();
	    }
	    finally
	    {
	        dbconn.disConnection(conn, ps);
	    }
	}
	public MemberVO mypageMy(String id)
	{
		MemberVO vo=new MemberVO();
		try
		{
			conn=dbconn.getConnection();
			String sql="SELECT id, pwd, sex, name, birthday, email, post, addr1, addr2, phone, content "
					+ "FROM member "
					+ "WHERE id=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, id);
			ResultSet rs=ps.executeQuery();
			if (rs.next()) {
				vo.setId(rs.getString(1));
				vo.setPwd(rs.getString(2));
				vo.setSex(rs.getString(3));
	            vo.setName(rs.getString(4));
	            vo.setBirth(rs.getString(5));
	            vo.setEmail(rs.getString(6));
	            vo.setPost(rs.getString(7));
	            vo.setAddr1(rs.getString(8));
	            vo.setAddr2(rs.getString(9));
	            vo.setPhone(rs.getString(10));
	            vo.setContent(rs.getString(11));
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
	public void mypageMyUpdate(String id, MemberVO vo)
	{
	    try
	    {
	        conn = dbconn.getConnection();

	        String sql = "UPDATE member "
	                + "SET pwd=?, name=?, sex=?, email=?, post=?, addr1=?, addr2=?, phone=?, content=? "
	                + "WHERE id=?";
	        ps = conn.prepareStatement(sql);
	        ps.setString(1, vo.getPwd());
	        ps.setString(2, vo.getName());
	        ps.setString(3, vo.getSex());
	        ps.setString(4, vo.getEmail());
	        ps.setString(5, vo.getPost());
	        ps.setString(6, vo.getAddr1());
	        ps.setString(7, vo.getAddr2());
	        ps.setString(8, vo.getPhone());
	        ps.setString(9, vo.getContent());
	        ps.setString(10, id);
	        ps.executeUpdate();
	    }
	       
	    catch (Exception ex)
	    {
	        ex.printStackTrace();
	    }
	    finally
	    {
	        dbconn.disConnection(conn, ps);
	    }
	}
	public static List<ReserveStayInfoVO> myStayResList(String id)
	{
		List<ReserveStayInfoVO> list=new ArrayList<ReserveStayInfoVO>();
		SqlSession session=null;
		try
		{
			session=ssf.openSession();
			list=session.selectList("myStayResList",id);
		}catch(Exception ex) 
		{
			ex.printStackTrace();
		}
		finally
		{
			if(session!=null)
				session.close();
		}
		return list;
	}
	public static void myStayResListDelete(Map map)
	{
		SqlSession session=null;
		try 
		{
				session=ssf.openSession(true);
				
				
				session.delete("myStayResListDelete", map);
	    } 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		finally 
		{
			if(session!=null) 
				session.close();
		}
	}
	
}
