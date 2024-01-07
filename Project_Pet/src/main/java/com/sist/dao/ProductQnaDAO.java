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
		
		
		public static int productQnaCount(Map map) {
			int count=0;
			SqlSession session =null;
			
			try {
				session=ssf.openSession();
				count=session.selectOne("productQnaCount",map);
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
		
		
		
		
		public static String ProductQnaGetPname(int qno) {
			String p_name="";
			SqlSession session =null;
			
			try {
				session=ssf.openSession();
				p_name=session.selectOne("ProductQnaGetPname",qno);
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			finally {
				if(session!=null) {
					session.close();
				}
			}
			return p_name;
		}
		
		
		public static QnaBoardVO productQnaAnswerData(int qno) {
			
			SqlSession session =null;
			QnaBoardVO vo=new QnaBoardVO();
			try {
				session=ssf.openSession();
				vo=session.selectOne("productQnaAnswerData",qno);
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			finally {
				if(session!=null) {
					session.close();
				}
			}
			return vo;
		}
	
		
public static QnaBoardVO productQnaNoAnswerData(int qno) {
			
			SqlSession session =null;
			QnaBoardVO vo=new QnaBoardVO();
			try {
				session=ssf.openSession();
				vo=session.selectOne("productQnaAnswerNotData",qno);
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			finally {
				if(session!=null) {
					session.close();
				}
			}
			return vo;
		}


public static int productAdminQnaCount(int type) {
	
	SqlSession session =null;
	int count =0;
	try {
		session=ssf.openSession();
		count=session.selectOne("productAdminQnaCount",type);
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


public static List<QnaBoardVO> productQnaAdminListData(Map map) {
	SqlSession session =null;
	List<QnaBoardVO> list=new ArrayList<QnaBoardVO>();

	try {
		
		
		
		session=ssf.openSession();
		list=session.selectList("productQnaAdminListData",map);
		
		
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



public static void productQnaAnswerInsert(Map map,int qno) {
	SqlSession session =null;
	
	try {
		
		
		
		session=ssf.openSession(true);
		session.insert("productQnaAnswerInsert",map);
		session.close();
		session=ssf.openSession(true);
		session.update("productQnaUpdateAnswerCheck",qno);
				
		
		
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


}
