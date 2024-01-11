package com.sist.dao;

import java.io.Reader;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.sist.vo.QnaBoardVO;
import com.sist.vo.ShoppingVO;

public class ProductAdminDAO {
	private static SqlSessionFactory ssf;
	static {
		try {
			Reader reader=Resources.getResourceAsReader("Config.xml");
			   //2. XML에 설정된 데이터 읽기 => Map
			   ssf=new SqlSessionFactoryBuilder().build(reader);
		} catch (Exception e) {
			// TODO: handle exception
		e.printStackTrace();
		}
	}
	
	
	
	public static List<ShoppingVO> productStateList(Map map) {
		SqlSession session =null;
		List<ShoppingVO> list=new ArrayList<ShoppingVO>();
	System.out.println("실행");
		try {
			
			
			
			session=ssf.openSession();
			list=session.selectList("productStateList",map);
			
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		finally {
			if(session!=null) {
				session.close();
			}
		}
		return list;
		
	}
	
	
	
	public static void productStateUpdatet(Map map) {
		SqlSession session =null;
	
	
		try {
			
			
			
			session=ssf.openSession(true);
		    session.selectList("stateUpdate",map);
			
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		finally {
			if(session!=null) {
				session.close();
			}
		}
	
		
	}
	
	
	
	public static int productStateTotal(Map map) {
		SqlSession session =null;
	
		int total=0;
		try {
			
			
			
			session=ssf.openSession();
		   total= session.selectOne("stateTotalpage",map);
			
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		finally {
			if(session!=null) {
				session.close();
			}
		}
	
		return total;
	}
	
	

}
