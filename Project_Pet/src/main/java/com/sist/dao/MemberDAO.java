package com.sist.dao;
import com.sist.vo.*;
import com.sist.dbcp.*;
import java.sql.*;
import java.util.*;

public class MemberDAO {
	private Connection conn;
	private PreparedStatement ps;
	private CreateDBCPconnection dbconn=new CreateDBCPconnection();
	private static MemberDAO dao;
	
	public static MemberDAO newInstance() {
		if(dao==null)
			dao=new MemberDAO();
		return dao;
	}
	
	// ID중복체크
	public int memberIdCheck(String id) {
		int count=0;
		try {
			conn=dbconn.getConnection();
			String sql="SELECT COUNT(*) FROM member "
					+ "WHERE id=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, id);
			ResultSet rs=ps.executeQuery();
			rs.next();
			count=rs.getInt(1);
			rs.close();
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			dbconn.disConnection(conn, ps);
		}
		return count;
	}
	public List<ZipcodeVO> postfind(String dong)
	   {
		   List<ZipcodeVO> list=new ArrayList<ZipcodeVO>();
		   try
		   {
			   conn=dbconn.getConnection();
			   String sql="SELECT zipcode,sido,gugun,"
					     +"dong,NVL(bunji,' ') "
					     +"FROM zipcode "
					     +"WHERE dong LIKE '%'||?||'%'";
			   ps=conn.prepareStatement(sql);
			   ps.setString(1, dong);
			   ResultSet rs=ps.executeQuery();
			   while(rs.next())
			   {
				   ZipcodeVO vo=new ZipcodeVO();
				   vo.setZipcode(rs.getString(1));
				   vo.setSido(rs.getString(2));
				   vo.setGugun(rs.getString(3));
				   vo.setDong(rs.getString(4));
				   vo.setBunji(rs.getString(5));
				   
				   list.add(vo);
			   }
			   rs.close();
		   }catch(Exception ex)
		   {
			   ex.printStackTrace();
		   }
		   finally
		   {
			   dbconn.disConnection(conn, ps);
		   }
		   return list;
	   }
	   public int postfindCount(String dong)
	   {
		   int count=0;
		   try
		   {
			   conn=dbconn.getConnection();
			   String sql="SELECT COUNT(*) "
					     +"FROM zipcode "
					     +"WHERE dong LIKE '%'||?||'%'";
			   ps=conn.prepareStatement(sql);
			   ps.setString(1, dong);
			   ResultSet rs=ps.executeQuery();
			   rs.next();
			   count=rs.getInt(1);
			   rs.close();
		   }catch(Exception ex)
		   {
			   ex.printStackTrace();
		   }
		   finally
		   {
			   dbconn.disConnection(conn, ps);
		   }
		   return count;
	   }
	
	   public void memberInsert(MemberVO vo)
	   {
		   try
		   {
			   conn=dbconn.getConnection();
			   String sql="INSERT INTO member VALUES("
					     +"?,?,?,?,?,?,?,?,?,?,?,'n')";
			   ps=conn.prepareStatement(sql);
			   ps.setString(1, vo.getId());
			   ps.setString(2, vo.getPwd());
			   ps.setString(3, vo.getName());
			   ps.setString(4, vo.getSex());
			   ps.setString(5, vo.getBirth());
			   ps.setString(6, vo.getEmail());
			   ps.setString(7, vo.getPost());
			   ps.setString(8, vo.getAddr1());
			   ps.setString(9, vo.getAddr2());
			   ps.setString(10, vo.getPhone());
			   ps.setString(11, vo.getContent());
			   ps.executeUpdate();
			   // save(vo)
		   }catch(Exception ex)
		   {
			   ex.printStackTrace();
		   }
		   finally
		   {
			   dbconn.disConnection(conn, ps);
		   }
	   }
	   public MemberVO memberLogin(String id,String pwd)
	   {
		   MemberVO vo=new MemberVO();
		   try
		   {
			   conn=dbconn.getConnection();
			   String sql="SELECT COUNT(*) "
					     +"FROM member "
					     +"WHERE id=?";
			   ps=conn.prepareStatement(sql);
			   ps.setString(1, id);
			   ResultSet rs=ps.executeQuery();
			   rs.next();
			   int count=rs.getInt(1);
			   rs.close();
			   
			   if(count==0)
			   {
				   vo.setMsg("NOID");
			   }
			   else
			   {
				  sql="SELECT id,name,pwd,phone,admin,email,addr1,addr2,post "
					 +"FROM member "
					 +"WHERE id=?";
				  ps=conn.prepareStatement(sql);
				  ps.setString(1, id);
				  rs=ps.executeQuery();
				  rs.next();
				  String db_id=rs.getString(1);
				  String name=rs.getString(2);
				  String db_pwd=rs.getString(3);
				  String phone=rs.getString(4);
				  String admin=rs.getString(5);
				  String email=rs.getString(6);
				  String addr1=rs.getString(7);
				  String addr2=rs.getString(8);
				  String post=rs.getString(9);
						  
				  rs.close();
				  
				  if(db_pwd.equals(pwd))
				  {
					  vo.setId(db_id);
					  vo.setName(name);
					  vo.setAdmin(admin);
					  vo.setPhone(phone);
					  vo.setEmail(email);
					  vo.setAddr1(addr1);
					  vo.setAddr2(addr2);
					  vo.setPost(post);
					  vo.setMsg("OK");
				  }
				  else
				  {
					  vo.setMsg("NOPWD");
				  }
			   }
			   
		   }catch(Exception ex)
		   {
			   ex.printStackTrace();
		   }
		   finally
		   {
			   dbconn.disConnection(conn, ps);
		   }
		   return vo;
	   }
	   
	   public String idemailFind(String email) {
		   String s="";
		   try {
			   conn=dbconn.getConnection();
			   String sql="SELECT COUNT(*) FROM member "
			   		+ "WHERE email=?";
			   ps=conn.prepareStatement(sql);
			   ps.setString(1, email);
			   ResultSet rs=ps.executeQuery();
			   rs.next();
			   int count=rs.getInt(1);
			   rs.close();
			   ps.close();
			   
			   if(count==0) {
				   s="NO";
			   }else {
				   sql="SELECT RPAD(SUBSTR(id,1,len),LENGTH(id),'*') "
						+"FROM (SELECT CEIL(LENGTH(id)/2) AS len,id,email FROM MEMBER) "
						+"WHERE email=?";
				   // id 절반길이까지 공개 나머지 *
				   ps=conn.prepareStatement(sql);
				   ps.setString(1, email);
				   rs=ps.executeQuery();
				   rs.next();
				   s=rs.getString(1);
				   rs.close();
			   }
					   
		   }catch(Exception ex) {
			   ex.printStackTrace();
		   }finally {
			   dbconn.disConnection(conn, ps);
		   }
		   
		   return s;
	   }
	
	   public String idphoneFind(String phone) {
		   String s="";
		   try {
			   conn=dbconn.getConnection();
			   String sql="SELECT COUNT(*) FROM member "
					   + "WHERE phone=?";
			   ps=conn.prepareStatement(sql);
			   ps.setString(1, phone);
			   ResultSet rs=ps.executeQuery();
			   rs.next();
			   int count=rs.getInt(1);
			   rs.close();
			   ps.close();
			   
			   if(count==0) {
				   s="NO";
			   }else {
				   sql="SELECT RPAD(SUBSTR(id,1,len),LENGTH(id),'*') "
						   +"FROM (SELECT CEIL(LENGTH(id)/2) AS len,id,phone FROM MEMBER) "
						   +"WHERE phone=?";
				   // id 절반길이까지 공개 나머지 *
				   ps=conn.prepareStatement(sql);
				   ps.setString(1, phone);
				   rs=ps.executeQuery();
				   rs.next();
				   s=rs.getString(1);
				   rs.close();
			   }
			   
		   }catch(Exception ex) {
			   ex.printStackTrace();
		   }finally {
			   dbconn.disConnection(conn, ps);
		   }
		   
		   return s;
	   }
	   
	   // id와 이메일 확인후 맞으면 임시비번으로 변경, 메일전송은 모델에서
	   public String pwdFind(String id,String email,String temp) {
		   String s="";
		   try {
			   conn=dbconn.getConnection();
			   String sql="SELECT COUNT(*) FROM member "
					   + "WHERE id=?";
			   ps=conn.prepareStatement(sql);
			   ps.setString(1, id);
			   ResultSet rs=ps.executeQuery();
			   rs.next();
			   int count=rs.getInt(1);
			   rs.close();
			   ps.close();
			   
			   if(count==0) {
				   s="IDNO";  // 아이디없음
			   }else {
				   sql="SELECT COUNT(*) FROM member WHERE id=? AND email=?";
				   // 이메일 확인
				   ps=conn.prepareStatement(sql);
				   ps.setString(1, id);
				   ps.setString(2, email);
				   rs=ps.executeQuery();
				   rs.next();
				   int co=rs.getInt(1);
				   rs.close();
				   ps.close();
				   if(co==1) {
					   s="SEND";
					   sql="UPDATE member SET pwd=? "
					   		+ "WHERE id=?";
					   ps=conn.prepareStatement(sql);
					   ps.setString(1, temp);
					   ps.setString(2, id);
					   ps.executeUpdate();
					   ps.close();
				   }else {
					   s="EMAILNO";
				   }
			   }
			   
		   }catch(Exception ex) {
			   ex.printStackTrace();
		   }finally {
			   dbconn.disConnection(conn, ps);
		   }
		   
		   return s;
	   }
}
