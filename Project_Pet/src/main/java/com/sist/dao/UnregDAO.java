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
	
	public static String delete_AllTables(Map map)
	{
		SqlSession session=null;
		String res="no";
		try 
		{
			session=ssf.openSession(true);
			String db_pwd=session.selectOne("getPassword", map);
			System.out.println("db_PWD:"+db_pwd);
			
			
			if (db_pwd.equals((String)map.get("pwd")))
			{
	            res="yes";
				session.delete("delete_Pet_reg", map);
				session.close();
				
				session=ssf.openSession(true);
				session.delete("delete_Cat_like", map);
				session.close();

				session=ssf.openSession(true);
				session.delete("delete_Dog_like", map);
				session.close();
				
				session=ssf.openSession(true);
				session.delete("delete_Cd_wish", map);
				session.close();

				session=ssf.openSession(true);
				session.delete("delete_Board_reply", map);
				session.close();
				
				session=ssf.openSession(true);
				session.delete("delete_Qnaboard", map);
				session.close();
				
				session=ssf.openSession(true);
				session.delete("delete_review", map);
				session.close();
				
				session=ssf.openSession(true);
				session.delete("delete_member", map);
				session.close();
	
	        } 
			System.out.println(res);
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
}
