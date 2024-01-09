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

public class ShoppingDAO {
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
	
	
	
	public static String shoppingInsert(Map map) {
		SqlSession session =null;
		String msg="";
		int quantity=(int)map.get("buy_count");
	
		try {
			
			
			if(map.get("userid")!=null) {
			session=ssf.openSession();
			int count=session.selectOne("shoppingCheck",map);
			session.close();
			
			session=ssf.openSession();
			int p_stackCheckCount=session.selectOne("shoppingStackCheck",map);
			session.close();
			
			if(p_stackCheckCount==0) {
				msg="NOSTACK";
			}
			else if(p_stackCheckCount<quantity) {
				msg="FULLSTACK";
			}
			
			else if(count>0) {
				msg="NO";
				
			}
			else {
				
				session=ssf.openSession(true);
				session.insert("addShoppingCart",map);
				session.close();
				msg="YES";
			}
			
			}	
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		finally {
			if(session!=null) {
				session.close();
			}
		}
		return msg;
		
	}
	
	
	
	
	public static List<ShoppingVO> shoppingCartList(String userid) {
		SqlSession session =null;
		List<ShoppingVO>list=new ArrayList<ShoppingVO>();
		
	
		try {
			
			
			
			session=ssf.openSession();
			System.out.println(userid);
			list= session.selectList("shoppingCartList",userid);
			
			
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
}
