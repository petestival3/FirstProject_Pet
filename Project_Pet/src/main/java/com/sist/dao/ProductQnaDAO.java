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

		public static List<QnaBoardVO> productQnaListData() {
			SqlSession session =null;
			List<QnaBoardVO> list=new ArrayList<QnaBoardVO>();
			try {
				session=ssf.openSession();
				list=session.selectList("productQnaListData");
				
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
