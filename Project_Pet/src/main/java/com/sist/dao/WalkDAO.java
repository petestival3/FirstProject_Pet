package com.sist.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.sist.dbcp.CreateDBCPconnection;
import com.sist.dao.*;
import com.sist.vo.ProductVO;
import com.sist.vo.WalkReplyVO;
import com.sist.vo.WalkVO;

public class WalkDAO {
	
private PreparedStatement ps;
private Connection conn;
private static WalkDAO dao;
private CreateDBCPconnection dbconn = new CreateDBCPconnection();
private final int ROW_SIZE=15;
private final int REPLY_ROW_SIZE=10;

public static WalkDAO newInstance() {
	if(dao==null) {
		dao=new WalkDAO();
	}
	return dao;
	
}

public int walkTotalPage(String loc) {
	String msg="";
	if(!(loc.equals("전체"))){
		
		msg="WHERE signgu_name LIKE '%'||?||'%'";
	}
	
	
	
	
	
	int total=0;
	try {
		conn=dbconn.getConnection();
		String sql= "Select CEIL(COUNT(*)/"+ROW_SIZE+") FROM walk_name_info "+msg;
		ps=conn.prepareStatement(sql);
		if(!(loc.equals("전체"))){
			
			ps.setString(1, loc);
		}
		
		
		ResultSet rs= ps.executeQuery();
		rs.next();
		total = rs.getInt(1);
	
		rs.close();
		
		
	} catch (Exception e) {
		// TODO: handle exception
		e.printStackTrace();
	}
	finally {
		dbconn.disConnection(conn, ps);
	}
	
	return total;
	
}



public List<WalkVO> walkList(String loc,int page){
	
	List<WalkVO> list= new ArrayList<WalkVO>();
	String msg="";
	
	if(!(loc.equals("전체"))){
		
		msg="WHERE signgu_name LIKE '%'||?||'%'";
	}
	
	
	
	try {
		
		conn= dbconn.getConnection();
		String sql="SELECT wno,w_name,signgu_name,lnm_addr,cours_spot_la,cours_spot_lo,num "
					+"FROM (SELECT wno,w_name,signgu_name,lnm_addr,cours_spot_la,cours_spot_lo,rownum as num "
					+"FROM (SELECT wno,w_name,signgu_name,lnm_addr,cours_spot_la,cours_spot_lo FROM walk_name_info "
					+msg+ ")) "
					+"WHERE num BETWEEN ? AND ?";
		ps=conn.prepareStatement(sql);
		
		int start=(ROW_SIZE*page)-(ROW_SIZE-1);
		int end= ROW_SIZE*page;
		
		if(!(loc.equals("전체"))){
			ps.setString(1, loc);
			ps.setInt(2,start);
			ps.setInt(3, end);
			
		}
		else {
			ps.setInt(1, start);
			ps.setInt(2, end);
		}
		
		
		
	
		ResultSet rs= ps.executeQuery();
		while(rs.next()) {
			WalkVO vo=new WalkVO();
			vo.setWno(rs.getInt(1));
			vo.setWname(rs.getString(2));
			vo.setSigngu_name(rs.getString(3));
			vo.setAddress(rs.getString(4));
			vo.setcLa(rs.getString(5));
			vo.setcLo(rs.getString(6));
			list.add(vo);
			
		}
		rs.close();
		
	} catch (Exception e) {
		// TODO: handle exception
		e.printStackTrace();
	}
	finally {
		dbconn.disConnection(conn, ps);
	}
	
	return list;
}




public synchronized List<WalkVO> walkSearchList(String loc,String w_name,int page){
	List<WalkVO>list=new ArrayList<WalkVO>();
	try {
		String msg="";
		if(!loc.equals("전체")) {
			msg="si_name=? AND ";
		}
		
		conn=dbconn.getConnection();
		
		String sql="SELECT wno,w_name,signgu_name,lnm_addr,cours_spot_la,cours_spot_lo,num "
				+"FROM (SELECT wno,w_name,signgu_name,lnm_addr,cours_spot_la,cours_spot_lo,rownum as num "
				+"FROM (SELECT wno,w_name,signgu_name,lnm_addr,cours_spot_la,cours_spot_lo FROM walk_name_info "
				+"WHERE "+msg+" w_name LIKE '%'||?||'%' )) "
				+"WHERE num BETWEEN ? AND ?";
		
		ps=conn.prepareStatement(sql);
		
		int start=(ROW_SIZE*page)-(ROW_SIZE-1);
		int end= ROW_SIZE*page;
		
		if(!loc.equals("전체")) {
			ps.setString(1, msg);
			ps.setString(2, w_name);
			ps.setInt(3, start);
			ps.setInt(4, end);
		}
		else {
			ps.setString(1, w_name);
			ps.setInt(2, start);
			ps.setInt(3, end);
		}
		
		
		ResultSet rs= ps.executeQuery();
		while(rs.next()) {
			WalkVO vo=new WalkVO();
			vo.setWno(rs.getInt(1));
			vo.setWname(rs.getString(2));
			vo.setSigngu_name(rs.getString(3));
			vo.setAddress(rs.getString(4));
			vo.setcLa(rs.getString(5));
			vo.setcLo(rs.getString(6));
			list.add(vo);
			
		}
		rs.close();
		ps.close();
		
	} catch (Exception e) {
		e.printStackTrace();
	}
	finally {
		dbconn.disConnection(conn, ps);
	}
	
	return list;
	
}


public WalkVO walkDetail(int wno) {
	WalkVO vo =new WalkVO();
	try {
		
		conn=dbconn.getConnection();
		String sql="SELECT wno,w_name,signgu_name,lnm_addr,cours_spot_la,cours_spot_lo FROM WALK_NAME_INFO "
					+"WHERE wno="+wno;
			ps=conn.prepareStatement(sql);
		
			
			ResultSet rs=ps.executeQuery();
			rs.next();
			vo.setWno(rs.getInt(1));
			vo.setWname(rs.getString(2));
			vo.setSigngu_name(rs.getString(3));
			vo.setAddress(rs.getString(4));
			vo.setcLa(rs.getString(5));
			vo.setcLo(rs.getString(6));
			
			rs.close();
	} catch (Exception e) {
		// TODO: handle exception
		e.printStackTrace();
	}
	finally {
		dbconn.disConnection(conn, ps);
	}
	return vo;
}

public List<WalkVO> walkCourseData(int wno){
	List<WalkVO>list =new ArrayList<WalkVO>();
	
	try {
		conn=dbconn.getConnection();
		String sql="SELECT wcno,w_course_name,course_length FROM WALK_COURSE_INFO WHERE wno=?";
		ps=conn.prepareStatement(sql);
		ps.setInt(1, wno);
		ResultSet rs=ps.executeQuery();
		
		while(rs.next()) {
			WalkVO vo=new WalkVO();
			vo.setWcno(rs.getInt(1));
			vo.setW_course_name(rs.getString(2));
			vo.setCourse_length(rs.getString(3));
			
			list.add(vo);
		}
		rs.close();
	} catch (Exception e) {
		// TODO: handle exception
		e.printStackTrace();
	}
	finally {
		dbconn.disConnection(conn, ps);
	}
	
	return list;
}


public synchronized WalkVO walkCourseAjaxInform(int wcno) {
	WalkVO vo =new WalkVO();
try {
	conn=dbconn.getConnection();
	String sql="SELECT w_course_name,course_inform,lnm_addr,course_length_detail,course_time,optn_dc,toilet_dc,conventional_name,level_image,course_level "
			+"FROM WALK_COURSE_INFO WHERE wcno=?";
	
	ps=conn.prepareStatement(sql);
	ps.setInt(1, wcno);
	
	ResultSet rs =ps.executeQuery();
	if(rs.next()) {
		vo.setW_course_name(rs.getString(1));
		vo.setCourse_inform(rs.getString(2));
		vo.setAddress(rs.getString(3));
		vo.setCourse_lengthDetail(rs.getString(4)+"km");
		vo.setCourse_time(rs.getString(5));
		vo.setOptn(rs.getString(6));
		vo.setToilet(rs.getString(7));
		vo.setConventionName(rs.getString(8));
		vo.setLevel_image(rs.getString(9));
		vo.setCourse_level(rs.getString(10));
		
	}
} catch (Exception e) {
	// TODO: handle exception
	e.printStackTrace();
}
finally {
	dbconn.disConnection(conn, ps);
}
	return vo;
}

public synchronized void walkReplyInsert(WalkReplyVO vo,String pwd) {
	try {
		
		
		conn=dbconn.getConnection();
		
		
		String sql="INSERT INTO board_reply(rno,typeno,group_id,userid,bno,pwd,rcontent) "
					+"VALUES(board_reply_seq.nextval,2,(SELECT NVL((MAX(group_id)+1),1) FROM board_reply),?,?,?,?)";
		
	
		ps=conn.prepareStatement(sql);
		
		
		
	
		
		ps.setString(1,vo.getUserid());
		
		
	
		
		ps.setInt(2, vo.getBno());
		
		
		
		
		ps.setString(3, pwd);
		
		
		
		
		ps.setString(4, vo.getRcontent());
		
		
		ps.executeUpdate();
	
		dbconn.disConnection(conn, ps);
		
	} catch (Exception e) {
		// TODO: handle exception
	e.printStackTrace();
	}
	finally {
		dbconn.disConnection(conn, ps);
	}

	
}

public synchronized int walkReplyTotalPage(int wno) {
	
	int totalpage=0;
	
	
	try {
		conn=dbconn.getConnection();
		String sql="SELECT CEIL(COUNT(*)/10.0) FROM BOARD_REPLY WHERE bno=?";
		ps=conn.prepareStatement(sql);
		ps.setInt(1, wno);
		ResultSet rs= ps.executeQuery();
		if(rs.next()) {
			totalpage=rs.getInt(1);
		}
		rs.close();
		
	} catch (Exception e) {
		// TODO: handle exception
		e.printStackTrace();
	}
	finally {
		dbconn.disConnection(conn, ps);
	}
	
	return totalpage;
	
}

public synchronized List<WalkReplyVO> walkReplyListData(int wno,int page){
	List<WalkReplyVO>list=new ArrayList<WalkReplyVO>();
	try {
		conn=dbconn.getConnection();
		String sql="SELECT rno,rcontent,TO_CHAR(rdate,'YYYY-MM-dd HH24:MI:SS'),like_count,group_tab,userid,bno,root,group_id,num "
					+"FROM (SELECT rno,rcontent,rdate,like_count,group_tab,userid,bno,root,group_id,rownum as num "
					+"FROM (SELECT rno,rcontent,rdate,like_count,group_tab,userid,bno,root,group_id "
					+"FROM BOARD_REPLY WHERE typeno=2 AND bno=? ORDER BY GROUP_ID DESC,GROUP_STEP ASC)) "
					+"WHERE num BETWEEN ? AND ?";
		ps=conn.prepareStatement(sql);
		int start=(REPLY_ROW_SIZE*page)-(REPLY_ROW_SIZE-1);
		int end= REPLY_ROW_SIZE*page;
		
		ps.setInt(1, wno);
		ps.setInt(2, start);
		ps.setInt(3, end);
		ResultSet rs=ps.executeQuery();

		while(rs.next()) {
			WalkReplyVO vo=new WalkReplyVO();
			vo.setRno(rs.getInt(1));
			vo.setRcontent(rs.getString(2));
			vo.setDbday(rs.getString(3));
			vo.setLike_count(rs.getInt(4));
			vo.setGroup_tab(rs.getInt(5));
			vo.setUserid(rs.getString(6));
			vo.setBno(rs.getInt(7));
			vo.setRoot(rs.getInt(8));
			vo.setGroup_id(rs.getInt(9));
			list.add(vo);
		}
		
		rs.close();
		
					
	} catch (Exception e) {
		e.printStackTrace();
		// TODO: handle exception
	}
	finally {
		dbconn.disConnection(conn, ps);
	}
	return list;
}

public synchronized int walkReplyAmount(int wno) {
	int replyAmount=0;
	try {
		conn=dbconn.getConnection();
		String sql="SELECT COUNT(*) FROM BOARD_REPLY WHERE typeno=2 AND bno=?";
		ps=conn.prepareStatement(sql);
		ps.setInt(1, wno);
		ResultSet rs= ps.executeQuery();
		if(rs.next()) {
		replyAmount=rs.getInt(1);
		}
		rs.close();
		
		} catch (Exception e) {
		// TODO: handle exception
		e.printStackTrace();
	}
	finally {
		dbconn.disConnection(conn, ps);
	}
	
	return replyAmount;
}


public synchronized void walkAddReplyInsert(String pwd,WalkReplyVO vo) {
	try {
		conn=dbconn.getConnection();
		
		int db_gstep=0;
		int db_gi=0;
		int db_gtab=0;
		int bno=0;
		int rno=vo.getRno();
		
		
	String	sql="SELECT group_id,group_tab ,group_step,bno FROM BOARD_REPLY WHERE typeno=2 AND rno=?";
	
	
				
		ps=conn.prepareStatement(sql);
		ps.setInt(1, rno);
		ResultSet rs=ps.executeQuery();
		
		if(rs.next()) {
		
		db_gi=rs.getInt(1);
		db_gtab=rs.getInt(2);
		db_gstep=rs.getInt(3);
		bno=rs.getInt(4);
		}
		rs.close();
		
		dbconn.disConnection(conn, ps);
		
		
		conn=dbconn.getConnection();
		sql="UPDATE BOARD_REPLY SET "
				+"group_step=group_step+1 "
				+"WHERE group_id=? AND group_step>?";
		
		ps=conn.prepareStatement(sql);
		ps.setInt(1, db_gi);
		ps.setInt(2, db_gstep);
		ps.executeUpdate();
		dbconn.disConnection(conn, ps);
		
		
		conn=dbconn.getConnection();
		
		sql="INSERT INTO BOARD_REPLY (rno,rcontent,group_id,group_step,group_tab,root,userid,pwd,bno,typeno) "
				+"VALUES(board_reply_seq.nextval,?,?,?,?,?,?,?,?,2)";
		
		ps=conn.prepareStatement(sql);
		ps.setString(1,vo.getRcontent());
		ps.setInt(2,db_gi);
		ps.setInt(3, db_gstep+1);
		ps.setInt(4, db_gtab+1);
		ps.setInt(5, rno);
		ps.setString(6, vo.getUserid());
		ps.setString(7, pwd);
		ps.setInt(8, bno);
		
		
		ps.executeUpdate();
		
		dbconn.disConnection(conn, ps);
		conn=dbconn.getConnection();
		
		sql="UPDATE BOARD_REPLY SET "
				+"depth=depth+1 "
				+"WHERE rno=?";
		ps=conn.prepareStatement(sql);
		ps.setInt(1, rno);
		ps.executeUpdate();
		dbconn.disConnection(conn, ps);
		
		} catch (Exception e) {
		// TODO: handle exception
	e.printStackTrace();
	}
	finally {
		dbconn.disConnection(conn, ps);
	}
	
	
}

public  synchronized boolean walkDeleteReply(int rno,String pwd) {
	boolean bCheck=false;
	String db_pwd="";
	
	String msg="삭제한 댓글입니다.";
	try {
		conn=dbconn.getConnection();
		
			String sql="SELECT pwd FROM BOARD_REPLY WHERE rno=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, rno);
			ResultSet rs=ps.executeQuery();
		
			if(rs.next()) {
			
			db_pwd=rs.getString(1);
			}
			rs.close();
			dbconn.disConnection(conn, ps);
			
			
			conn=dbconn.getConnection();
		
	if(db_pwd.equals(pwd)) {		
				
		int db_root=0;
		int db_depth=0;
		
		sql="select root,depth FROM BOARD_REPLY WHERE rno=?";
		ps=conn.prepareStatement(sql);
		ps.setInt(1, rno);
		rs=ps.executeQuery();
	if(rs.next()) {
		db_root=rs.getInt(1);
		db_depth=rs.getInt(2);
	}
		rs.close();
	
		dbconn.disConnection(conn, ps);
		
		
		conn=dbconn.getConnection();
		
		if (db_depth==0) {
				sql="DELETE FROM BOARD_REPLY WHERE rno=?";
					ps=conn.prepareStatement(sql);
					ps.setInt(1, rno);

					ps.executeUpdate();
					ps.close();
					
					dbconn.disConnection(conn, ps);
					
					conn=dbconn.getConnection();
					
					 sql="UPDATE BOARD_REPLY SET "
								+"depth=depth-1 "
								+"WHERE rno=?";
						ps=conn.prepareStatement(sql);
						ps.setInt(1, db_root);
						ps.executeUpdate();
						
						
						dbconn.disConnection(conn, ps);
						conn=dbconn.getConnection();
			
		}
		
		else {
			
			
			sql="UPDATE BOARD_REPLY SET "
					+"rcontent=? "
				+"WHERE rno=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1,msg);
			ps.setInt(2, rno);
			
			ps.executeUpdate();
		
			
			dbconn.disConnection(conn, ps);
			conn=dbconn.getConnection();
		}
		
			
		
				bCheck=true;
			
		}
	}
	catch (Exception e) {
		// TODO: handle exception
	e.printStackTrace();
	}
	finally {
	dbconn.disConnection(conn, ps);
	}
	
	

	return bCheck;
	
}

public synchronized boolean walkReplyUpdate(WalkReplyVO vo,String pwd) {
	
	boolean bCheck=false;
	String db_pwd="";
	int rno=vo.getRno();
	try {
		conn=dbconn.getConnection();
		String sql="SELECT pwd FROM BOARD_REPLY WHERE rno=?";
		ps=conn.prepareStatement(sql);
		ps.setInt(1, rno);
		ResultSet rs=ps.executeQuery();
		
		if(rs.next()) {
		
		db_pwd=rs.getString(1);
		}
		rs.close();
		dbconn.disConnection(conn, ps);
		
		conn=dbconn.getConnection();
		
		if(db_pwd.equals(pwd)) {
		
			sql="UPDATE BOARD_REPLY SET "
				+"rcontent=?, "
				+"rdate= sysdate "	
				+"WHERE rno=?";
		ps=conn.prepareStatement(sql);
		
		ps.setString(1, vo.getRcontent());
		ps.setInt(2, rno);
		ps.executeUpdate();
		
		
		bCheck=true;
		
		}
		} catch (Exception e) {
		// TODO: handle exception
	e.printStackTrace();
	}
	finally {
		dbconn.disConnection(conn, ps);
	}
	
	
	return bCheck;
}


public synchronized String rootId(int root) {
	String rootId="";
	try {
		conn=dbconn.getConnection();
		String sql="SELECT userid FROM BOARD_REPLY WHERE rno=?";
		ps=conn.prepareStatement(sql);
		ps.setInt(1, root);
		ResultSet rs=ps.executeQuery();
		if(rs.next()) {
		rootId=rs.getString(1);
		}
		rs.close();
		

		
	} catch (Exception e) {
		// TODO: handle exception
		e.printStackTrace();
	}
	finally {
		dbconn.disConnection(conn, ps);
	}
	
	return rootId;
}

 

}