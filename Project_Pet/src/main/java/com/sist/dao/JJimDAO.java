package com.sist.dao;
import java.util.*;
import java.sql.*;
import com.sist.vo.*;
import com.sist.dbcp.*;

public class JJimDAO {
	private Connection conn;
	private PreparedStatement ps;
	private CreateDBCPconnection dbconn=new CreateDBCPconnection();
	private static StayDAO dao;
	
	// 싱글턴
//		public static hotelJJimDAO newInstance() {
//			if(dao==null)
//				dao=new hotelJJimDAO()
	;
//			return dao;
//		}
//	  
}
