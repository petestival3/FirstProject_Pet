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
	
	 static 
	   {
		   try
		   {
			   //1. XML을 읽어 온다 
			   Reader reader=Resources.getResourceAsReader("Config.xml");
			   //2. XML에 설정된 데이터 읽기 => Map
			   ssf=new SqlSessionFactoryBuilder().build(reader);
		   }catch(Exception ex)
		   {
			   ex.printStackTrace();
		   }
	   }
	 
	 public static List<JJimVO> JJimListData()
	   {
		   SqlSession session=ssf.openSession();
		   List<JJimVO> list=session.selectList("JJimListData");
		   session.close();
		   return list;
	   }
}
