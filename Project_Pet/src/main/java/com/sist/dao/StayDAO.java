package com.sist.dao;
import java.util.*;
import java.sql.*;
import com.sist.vo.*;
import com.sist.dbcp.*;

public class StayDAO {
	private Connection conn;
	private PreparedStatement ps;
	private CreateDBCPconnection dbconn=new CreateDBCPconnection();
	private static StayDAO dao;
	private final int ROW_SIZE=12;
	
	// 싱글턴
		public static StayDAO newInstance() {
			if(dao==null)
				dao=new StayDAO();
			return dao;
		}
	// 목록출력
		public List<StayVO> StayListData(int page){
			List<StayVO> list=new ArrayList<StayVO>();
			try {
				conn=dbconn.getConnection();
				// num BETWEEN ? AND ? => 1page 1~20
				//						  2page 21~40
				//							... 
				int start=(ROW_SIZE*page)-(ROW_SIZE-1);
				int end=ROW_SIZE*page;
				String sql="SELECT stay_no,stype,sname,score,address,price,mainimage,num "
						+ "FROM STAYIMAGE,(SELECT stay_no,stype,sname,score,address,price,rownum as num "
						+ "FROM (SELECT /*+ INDEX_ASC(stayinfo stayinfo_stay_no_pk)*/stay_no,stype,sname,score,address,price,mainimage "
						+ "FROM stayinfo,STAYIMAGE WHERE STAYIMAGE.SINO=stayinfo.STAY_NO)) "
						+ "WHERE (STAYIMAGE.SINO=STAY_NO) "
						+ "AND (num BETWEEN ? AND ?)";
				// 실무에서는 위처럼 order by를 쓰지 않고 index_asc를 쓴다
				ps=conn.prepareStatement(sql);
				ps.setInt(1, start);
				ps.setInt(2, end);
				
				ResultSet rs=ps.executeQuery();
				while(rs.next()) {
					StayVO vo=new StayVO();
					vo.setStayno(rs.getInt(1));
					vo.setType(rs.getString(2));
					vo.setName(rs.getString(3));
					vo.setScore(rs.getDouble(4));
					vo.setAddress(rs.getString(5));
					vo.setPrice(rs.getInt(6));
					vo.setImage(rs.getString(7));
					
					list.add(vo);
					// 직접구현 => 80%
					// 20% => 정보,이미지
				}
				rs.close();
			}catch(Exception ex) {
				ex.printStackTrace();
			}finally {
				dbconn.disConnection(conn, ps);
			}
			return list;
		}
		public int StayTotalPage() {
			int total=0;
			try {
				conn=dbconn.getConnection();
				String sql="SELECT CEIL(COUNT(*)/"+ROW_SIZE+") FROM stayinfo";
				ps=conn.prepareStatement(sql);
				ResultSet rs=ps.executeQuery();
				rs.next();
				total=rs.getInt(1);
				rs.close();
			}catch(Exception ex) {
				ex.printStackTrace();
			}finally {
				dbconn.disConnection(conn, ps);
			}
			return total;
		}
		
		// 상세보기
		public StayVO stayDetail(int sno) {
			StayVO vo=new StayVO();
			try {
				conn=dbconn.getConnection();
				String sql="UPDATE stayinfo SET "
						+ "hit=hit+1 "
						+ "WHERE stay_no="+sno;
				ps=conn.prepareStatement(sql);
				ps.executeUpdate();
				
				sql="SELECT stay_no,stype,sname,score,address,detail_address,price,review_count,around,basic,petinfo,other,mainimage,sub1,sub2,sub3,sub4,staymsg FROM stayinfo,STAYDETAIL,stayimage "
						+ "WHERE stay_no=sdno AND stay_no=sino AND stay_no=?";
				// 실무에서는 위처럼 order by를 쓰지 않고 index_asc를 쓴다
				ps=conn.prepareStatement(sql);
				ps.setInt(1, sno);
				// INDEX_ASC(테이블명 인덱스명,PK,UK), INDEX_DESC(), INDEX()
				ResultSet rs=ps.executeQuery();
				rs.next();
					vo.setStayno(rs.getInt(1));
					vo.setType(rs.getString(2));
					vo.setName(rs.getString(3));
					vo.setScore(rs.getDouble(4));
					vo.setAddress(rs.getString(5));
					vo.setDetailaddr(rs.getString(6));
					vo.setPrice(rs.getInt(7));
					vo.setRevcount(rs.getInt(8));
					vo.setAround(rs.getString(9));
					vo.setBasic(rs.getString(10));
					vo.setPetinfo(rs.getString(11));
					vo.setOther(rs.getString(12));
					vo.setImage(rs.getString(13));
					vo.setSub1(rs.getString(14));
					vo.setSub2(rs.getString(15));
					vo.setSub3(rs.getString(16));
					vo.setSub4(rs.getString(17));
					vo.setMsg(rs.getString(18));
				rs.close();
			}catch(Exception ex) {
				ex.printStackTrace();
			}finally {
				dbconn.disConnection(conn, ps);
			}
			return vo;
		}
		
		public List<StayVO> stayLikeTop() {
			List<StayVO> list=new ArrayList<StayVO>();
			int top=6;
			try {
				conn=dbconn.getConnection();
				String sql="SELECT stay_no,sname,score,address,price,jjim,likecount,mainimage,num "
						+ "FROM (SELECT stay_no,sname,score,address,price,jjim,likecount,mainimage,rownum AS num "
						+ "FROM (SELECT stay_no,sname,score,address,price,jjim,likecount,mainimage "
						+ "FROM stayinfo,stayimage WHERE stayinfo.STAY_NO=stayimage.SINO ORDER BY likecount DESC,STAY_NO ASC)) "
						+ "WHERE num<="+top;
				
				ps=conn.prepareStatement(sql);
				ResultSet rs=ps.executeQuery();
				while(rs.next()) {
					StayVO vo=new StayVO();
					vo.setStayno(rs.getInt(1));
					vo.setName(rs.getString(2));
					vo.setScore(rs.getDouble(3));
					vo.setAddress(rs.getString(4));
					vo.setPrice(rs.getInt(5));
					vo.setJjim(rs.getInt(6));
					vo.setLike(rs.getInt(7));
					vo.setImage(rs.getString(8));
					list.add(vo);
				}
				rs.close();
			}catch(Exception ex) {
				ex.printStackTrace();
			}finally {
				dbconn.disConnection(conn, ps);
			}
			return list;
		}
		
		public List<StayVO> stayAddressListData(String fd){
			List<StayVO> list=new ArrayList<StayVO>();
			try {
				conn=dbconn.getConnection();
				String sql="SELECT stay_no,sname,score,address,detail_address,price,mainimage,rownum "
						+ "FROM (SELECT stay_no,sname,score,address,detail_address,price,mainimage "
						+ "FROM stayinfo,stayimage WHERE stayinfo.STAY_NO=stayimage.SINO) "
						+ "WHERE detail_address LIKE '%'||?||'%' AND rownum<9";
				
				ps=conn.prepareStatement(sql);
				ps.setString(1, fd);
				ResultSet rs=ps.executeQuery();
				while(rs.next()) {
					StayVO vo=new StayVO();
					vo.setStayno(rs.getInt(1));
					vo.setName(rs.getString(2));
					vo.setScore(rs.getDouble(3));
					vo.setAddress(rs.getString(4));
					vo.setDetailaddr(rs.getString(5));
					vo.setPrice(rs.getInt(6));
					vo.setImage(rs.getString(7));
					list.add(vo);
				}
				rs.close();
			}catch(Exception ex) {
				ex.printStackTrace();
			}finally {
				dbconn.disConnection(conn, ps);
			}
			return list;
		}
		// 주소별 모든리스트 출력
		public List<StayVO> stayAddressListAllData(String fd){
			List<StayVO> list=new ArrayList<StayVO>();
			try {
				conn=dbconn.getConnection();
				String sql="SELECT stay_no,sname,score,address,detail_address,price,mainimage,rownum "
						+ "FROM (SELECT stay_no,sname,score,address,detail_address,price,mainimage "
						+ "FROM stayinfo,stayimage WHERE stayinfo.STAY_NO=stayimage.SINO) "
						+ "WHERE detail_address LIKE '%'||?||'%'";
				
				ps=conn.prepareStatement(sql);
				ps.setString(1, fd);
				ResultSet rs=ps.executeQuery();
				while(rs.next()) {
					StayVO vo=new StayVO();
					vo.setStayno(rs.getInt(1));
					vo.setName(rs.getString(2));
					vo.setScore(rs.getDouble(3));
					vo.setAddress(rs.getString(4));
					vo.setDetailaddr(rs.getString(5));
					vo.setPrice(rs.getInt(6));
					vo.setImage(rs.getString(7));
					list.add(vo);
				}
				rs.close();
			}catch(Exception ex) {
				ex.printStackTrace();
			}finally {
				dbconn.disConnection(conn, ps);
			}
			return list;
		}
		// 주소별 모든리스트 페이지
		public int StayAddressTotalPage(String fd) {
			int total=0;
			try {
				conn=dbconn.getConnection();
				String sql="SELECT CEIL(COUNT(*)/"+ROW_SIZE+") FROM stayinfo WHERE detail_address LIKE '%'||?||'%'";
				ps=conn.prepareStatement(sql);
				ps.setString(1, fd);
				ResultSet rs=ps.executeQuery();
				rs.next();
				total=rs.getInt(1);
				rs.close();
			}catch(Exception ex) {
				ex.printStackTrace();
			}finally {
				dbconn.disConnection(conn, ps);
			}
			return total;
		}
		
		// 
		public List<RoomVO> RoomListData(int stno){
			List<RoomVO> list=new ArrayList<RoomVO>();
			try {
				conn=dbconn.getConnection();
				String sql="SELECT rno,roomno,room_image,room_name,room_price,stayno FROM roominfo "
						+ "WHERE stayno="+stno+" ORDER BY rno";
				ps=conn.prepareStatement(sql);
				ResultSet rs=ps.executeQuery();
				while(rs.next()) {
					RoomVO vo=new RoomVO();
					vo.setRno(rs.getInt(1));
					vo.setRoomno(rs.getInt(2));
					vo.setImage(rs.getString(3));
					vo.setName(rs.getString(4));
					vo.setPrice(rs.getInt(5));
					vo.setStayno(rs.getInt(6));
					list.add(vo);
				}
				rs.close();
			}catch(Exception ex) {
				ex.printStackTrace();
			}finally {
				dbconn.disConnection(conn, ps);
			}
			return list;
		}
		// 타입별 카운트
		public int stayTypeCount(String type) {
			int count=0;
			try {
				conn=dbconn.getConnection();
				String sql="SELECT COUNT(*) FROM stayinfo "
						+ "WHERE stype LIKE '%'||?||'%'";
				ps=conn.prepareStatement(sql);
				ps.setString(1, type);
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
		
		// 타입별 모든 리스트 출력
		public List<StayVO> stayTypeListAllData(String fd,int page){
			List<StayVO> list=new ArrayList<StayVO>();
			try {
				conn=dbconn.getConnection();
				String sql="SELECT stay_no,stype,sname,score,address,detail_address,price,mainimage,num "
						+ "FROM (SELECT stay_no,stype,sname,score,address,detail_address,price,mainimage,rownum as num "
						+ "FROM (SELECT stay_no,stype,sname,score,address,detail_address,price,mainimage "
						+ "FROM stayinfo,stayimage WHERE stayinfo.STAY_NO=stayimage.SINO AND stype LIKE '%'||?||'%')) "
						+ "WHERE num BETWEEN ? AND ?";
				
				ps=conn.prepareStatement(sql);
				int start=(ROW_SIZE*page)-(ROW_SIZE-1);
				int end=ROW_SIZE*page;
				ps.setString(1, fd);
				ps.setInt(2, start);
				ps.setInt(3, end);
				ResultSet rs=ps.executeQuery();
				while(rs.next()) {
					StayVO vo=new StayVO();
					vo.setStayno(rs.getInt(1));
					vo.setType(rs.getString(2));
					vo.setName(rs.getString(3));
					vo.setScore(rs.getDouble(4));
					vo.setAddress(rs.getString(5));
					vo.setDetailaddr(rs.getString(6));
					vo.setPrice(rs.getInt(7));
					vo.setImage(rs.getString(8));
					list.add(vo);
				}
				rs.close();
			}catch(Exception ex) {
				ex.printStackTrace();
			}finally {
				dbconn.disConnection(conn, ps);
			}
			return list;
		}
		
		// 타입별 페이지
		public int StayTypeTotalPage(String fd) {
			int total=0;
			try {
				conn=dbconn.getConnection();
				String sql="SELECT CEIL(COUNT(*)/"+ROW_SIZE+") FROM stayinfo WHERE stype LIKE '%'||?||'%'";
				ps=conn.prepareStatement(sql);
				ps.setString(1, fd);
				ResultSet rs=ps.executeQuery();
				rs.next();
				total=rs.getInt(1);
				rs.close();
			}catch(Exception ex) {
				ex.printStackTrace();
			}finally {
				dbconn.disConnection(conn, ps);
			}
			return total;
		}
		
		public int totalcount() {
			int count=0;
			try {
				conn=dbconn.getConnection();
				String sql="SELECT COUNT(*) FROM stayinfo";
				ps=conn.prepareStatement(sql);
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
		
		// Sort리스트(타입별)
		public List<StayVO> staySortDESCListData(String fd,int page,String sb){
			List<StayVO> list=new ArrayList<StayVO>();
			try {
				conn=dbconn.getConnection();
				String sql="SELECT stay_no,stype,sname,score,address,detail_address,price,mainimage,num "
						+ "FROM (SELECT stay_no,stype,sname,score,address,detail_address,price,mainimage,rownum as num "
						+ "FROM (SELECT stay_no,stype,sname,score,address,detail_address,price,mainimage "
						+ "FROM stayinfo,stayimage WHERE stayinfo.STAY_NO=stayimage.SINO AND stype LIKE '%'||?||'%'"
						+ " ORDER BY "+sb+" DESC )) "
						+ "WHERE num BETWEEN ? AND ?";
				
				ps=conn.prepareStatement(sql);
				int start=(ROW_SIZE*page)-(ROW_SIZE-1);
				int end=ROW_SIZE*page;
				ps.setString(1, fd);
				ps.setInt(2, start);
				ps.setInt(3, end);
				ResultSet rs=ps.executeQuery();
				while(rs.next()) {
					StayVO vo=new StayVO();
					vo.setStayno(rs.getInt(1));
					vo.setType(rs.getString(2));
					vo.setName(rs.getString(3));
					vo.setScore(rs.getDouble(4));
					vo.setAddress(rs.getString(5));
					vo.setDetailaddr(rs.getString(6));
					vo.setPrice(rs.getInt(7));
					vo.setImage(rs.getString(8));
					list.add(vo);
				}
				rs.close();
			}catch(Exception ex) {
				ex.printStackTrace();
			}finally {
				dbconn.disConnection(conn, ps);
			}
			return list;
		}
		
		// 후기 갯수 업데이트
		public void stayRevCountUpdate(int stayno,int typeno) {
			try {
				conn=dbconn.getConnection();
				String sql="SELECT COUNT(*) FROM review "
						+ "WHERE objno=? AND typeno=?";
				ps=conn.prepareStatement(sql);
				ps.setInt(1, stayno);
				ps.setInt(2, typeno);
				int revcount=0;
				ResultSet rs=ps.executeQuery();
				rs.next();
				revcount=rs.getInt(1);
				rs.close();
				ps.close();
				
				sql="UPDATE stayinfo SET review_count="+revcount+" WHERE stay_no="+stayno;
				ps=conn.prepareStatement(sql);
				ps.executeUpdate();
				
			}catch(Exception ex) {
				ex.printStackTrace();
			}finally {
				dbconn.disConnection(conn, ps);
			}
		}
		
		
		// 후기 점수 업데이트
		public void stayScoreUpdate(int stayno,int typeno) {
			try {
				conn=dbconn.getConnection();
				String sql="SELECT AVG(score) FROM review "
						+ "WHERE objno=? AND typeno=?";
				ps=conn.prepareStatement(sql);
				ps.setInt(1, stayno);
				ps.setInt(2, typeno);
				int avg=0;
				ResultSet rs=ps.executeQuery();
				rs.next();
				avg=rs.getInt(1);
				rs.close();
				ps.close();
				
				sql="UPDATE stayinfo SET score="+avg+" WHERE stay_no="+stayno;
				ps=conn.prepareStatement(sql);
				ps.executeUpdate();
				
			}catch(Exception ex) {
				ex.printStackTrace();
			}finally {
				dbconn.disConnection(conn, ps);
			}
		}
}
