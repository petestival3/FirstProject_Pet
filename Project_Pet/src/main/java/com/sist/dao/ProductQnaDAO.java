package com.sist.dao;

import java.io.Reader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.sist.vo.QnaBoardVO;

public class ProductQnaDAO {
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

		public static List<QnaBoardVO> productQnaListData(Map map) {
			SqlSession session =null;
			List<QnaBoardVO> list=new ArrayList<QnaBoardVO>();
		
			try {
				
				
				
				session=ssf.openSession();
				list=session.selectList("productQnaListData",map);
				
				
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
		
		
		public static int productQnaCount(int pno) {
			int count=0;
			SqlSession session =null;
			
			try {
				session=ssf.openSession();
				count=session.selectOne("productQnaCount",pno);
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			finally {
				if(session!=null) {
					session.close();
				}
			}
			return count;
		}
		
		
		
		
		public static void productQnaInsert(QnaBoardVO vo) {
			SqlSession session =null;
			
		
			try {
				
				session=ssf.openSession(true);
				
				session.insert("productQnaInsert",vo);
			
				
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
		
		public static int productQnaUserCountCheck(Map map) {
			int count=0;
			SqlSession session =null;
			
			try {
				session=ssf.openSession();
				count=session.selectOne("productQnaUserCountCheck",map);
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			finally {
				if(session!=null) {
					session.close();
				}
			}
			return count;
		}
	
}
