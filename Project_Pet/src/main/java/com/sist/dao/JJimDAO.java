package com.sist.dao;

import java.io.*;
import java.util.*;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import com.sist.vo.JJimVO;

public class JJimDAO {
	private static SqlSessionFactory ssf;

	static {
		try {
			// 1. XML을 읽어 온다
			Reader reader = Resources.getResourceAsReader("Config.xml");
			// 2. XML에 설정된 데이터 읽기 => Map
			ssf = new SqlSessionFactoryBuilder().build(reader);
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}

	public static List<JJimVO> JJimListData() {
		SqlSession session = ssf.openSession();
		List<JJimVO> list = session.selectList("JJimListData");
		System.out.println(list.size());
		session.close();
		return list;
	}

	public static void JJimInsert(JJimVO vo) {
		SqlSession session = ssf.openSession();
		List<JJimVO> list = session.selectList("insertJJimData", vo);
		System.out.println(list.size());
		session.close();
	}

	public static int JJimDelete(int no) {
		try {
			SqlSession session = ssf.openSession();
			int pno = session.selectOne("deleteJJimData", no);
			session.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return no;
	}

}
