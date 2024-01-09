package com.sist.dao;

import java.io.Reader;
import java.util.*;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.sist.vo.MyPageVO;
import com.sist.vo.QnaBoardVO;

public class UnregDAO {
	private static SqlSessionFactory ssf;
	static {
		try {
			Reader reader=Resources.getResourceAsReader("Config.xml");
			   ssf=new SqlSessionFactoryBuilder().build(reader);
		} catch (Exception e) {e.printStackTrace();}
	}
	
	public static String delete_AllTables(String pwd,String id)
	{
		SqlSession session=null;
		String res="no";
		try 
		{
			session=ssf.openSession(true);
			String db_pwd=session.selectOne("getPassword", id);
			
			if (db_pwd!=null && db_pwd.equals(pwd))
			{
	            res="yes";
				session.delete("delete_AllTables", id);
	        } 
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
		return res;
	}
//	public static String delete_Cat_like(String pwd,String id)
//	{
//		SqlSession session=null;
//		String res="no";
//		try 
//		{
//			session=ssf.openSession(true);
//			String db_pwd=session.selectOne("getPassword", id);
//			
//			if (db_pwd!=null && db_pwd.equals(pwd))
//			{
//	            res="yes";
//				session.delete("delete_Cat_like", id);
//	        } 
//		}
//		catch (Exception e) 
//		{
//			e.printStackTrace();
//		}
//		finally 
//		{
//			if(session!=null) 
//				session.close();
//		}
//		return res;
//	}
//	public static String delete_Dog_like(String pwd,String id)
//	{
//		SqlSession session=null;
//		String res="no";
//		try 
//		{
//			session=ssf.openSession(true);
//			String db_pwd=session.selectOne("getPassword", id);
//			
//			if (db_pwd!=null && db_pwd.equals(pwd))
//			{
//	            res="yes";
//				session.delete("delete_Dog_like", id);
//	        } 
//		}
//		catch (Exception e) 
//		{
//			e.printStackTrace();
//		}
//		finally 
//		{
//			if(session!=null) 
//				session.close();
//		}
//		return res;
//	}
//	public static String delete_Cd_wish(String pwd,String id)
//	{
//		SqlSession session=null;
//		String res="no";
//		try 
//		{
//			session=ssf.openSession(true);
//			String db_pwd=session.selectOne("getPassword", id);
//			
//			if (db_pwd!=null && db_pwd.equals(pwd))
//			{
//	            res="yes";
//				session.delete("delete_Cd_wish", id);
//	        } 
//		}
//		catch (Exception e) 
//		{
//			e.printStackTrace();
//		}
//		finally 
//		{
//			if(session!=null) 
//				session.close();
//		}
//		return res;
//	}
//	public static String delete_Board_reply(String pwd,String id)
//	{
//		SqlSession session=null;
//		String res="no";
//		try 
//		{
//			session=ssf.openSession(true);
//			String db_pwd=session.selectOne("getPassword", id);
//			
//			if (db_pwd!=null && db_pwd.equals(pwd))
//			{
//	            res="yes";
//				session.delete("delete_Board_reply", id);
//	        } 
//		}
//		catch (Exception e) 
//		{
//			e.printStackTrace();
//		}
//		finally 
//		{
//			if(session!=null) 
//				session.close();
//		}
//		return res;
//	}
//	public static String delete_Qnaboard(String pwd,String id)
//	{
//		SqlSession session=null;
//		String res="no";
//		try 
//		{
//			session=ssf.openSession(true);
//			String db_pwd=session.selectOne("getPassword", id);
//			
//			if (db_pwd!=null && db_pwd.equals(pwd))
//			{
//	            res="yes";
//				session.delete("delete_Qnaboard", id);
//	        } 
//		}
//		catch (Exception e) 
//		{
//			e.printStackTrace();
//		}
//		finally 
//		{
//			if(session!=null) 
//				session.close();
//		}
//		return res;
//	}
//	public static String delete_review(String pwd,String id)
//	{
//		SqlSession session=null;
//		String res="no";
//		try 
//		{
//			session=ssf.openSession(true);
//			String db_pwd=session.selectOne("getPassword", id);
//			
//			if (db_pwd!=null && db_pwd.equals(pwd))
//			{
//	            res="yes";
//				session.delete("delete_review", id);
//	        } 
//		}
//		catch (Exception e) 
//		{
//			e.printStackTrace();
//		}
//		finally 
//		{
//			if(session!=null) 
//				session.close();
//		}
//		return res;
//	}
//	public static String delete_member(String pwd,String id)
//	{
//		SqlSession session=null;
//		String res="no";
//		try 
//		{
//			session=ssf.openSession(true);
//			String db_pwd=session.selectOne("getPassword", id);
//			
//			if (db_pwd!=null && db_pwd.equals(pwd))
//			{
//	            res="yes";
//				session.delete("delete_member", id);
//	        } 
//		}
//		catch (Exception e) 
//		{
//			e.printStackTrace();
//		}
//		finally 
//		{
//			if(session!=null) 
//				session.close();
//		}
//		return res;
//	}

}
