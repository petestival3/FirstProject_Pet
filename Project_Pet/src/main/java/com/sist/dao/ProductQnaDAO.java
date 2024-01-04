package com.sist.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sist.vo.QnaBoardVO;

public class ProductQnaDAO {
	private static SqlSessionFactory ssf;
	
	static {
		try {
			
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
	
}
