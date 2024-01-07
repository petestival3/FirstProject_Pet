package com.sist.dao;
import java.util.*;
import java.sql.*;
import com.sist.vo.*;
import com.sist.dbcp.*;

public class WishDAO {
	
	private Connection conn;
	private PreparedStatement ps;
	private CreateDBCPconnection dbconn = new CreateDBCPconnection();
	private static WishDAO dao;

	// 싱글턴
	public static WishDAO newInstance() {
		if (dao == null)
			dao = new WishDAO();
		return dao;
	}
	/*
	--<입양희망 테이블(임시보호)>
CREATE TABLE CD_WISH(
 cdno NUMBER,
 id VARCHAR2(20) ,
 kano NUMBER ,
 CONSTRAINT cd_cdno_pk PRIMARY KEY (cdno),
 CONSTRAINT cd_id_fk FOREIGN KEY(id) REFERENCES MEMBER(id),
 CONSTRAINT cd_kano_fk FOREIGN KEY(kano) REFERENCES KEEPANIMAL2(kano)
);

--<입양희망 시퀀스(임시보호)>
CREATE SEQUENCE cd_cdno_seq 
START WITH 1
INCREMENT BY 1
NOCYCLE
NOCACHE;
	*/
	 // Jjim저장 
	   public void WishInsert(WishVO vo)
	   {
		   try
		   {
			   conn=dbconn.getConnection();
			   String sql="INSERT INTO CD_WISH VALUES(cd_cdno_seq.nextval,?,?)";
			   ps=conn.prepareStatement(sql);
			   ps.setString(1, vo.getId());
			   ps.setInt(2, vo.getKano());
			   ps.executeUpdate();
		   }catch(Exception ex)
		   {
			   ex.printStackTrace();
		   }
		   finally
		   {
			   dbconn.disConnection(conn, ps);
		   }
	   }
	   // Jjim확인 
	   public int WishCount(String id,int kano)
	   {
		   int count=0;
		   try
		   {
			   conn=dbconn.getConnection();
			   String sql="SELECT COUNT(*) "
					     +"FROM CD_WISH "
					     +"WHERE kano=? AND id=?";
			   ps=conn.prepareStatement(sql);
			   ps.setInt(1, kano);
			   ps.setString(2, id);
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
	   
	   // Jjim목록 => 마이페이지 (찜관리) 
	   public List<WishVO> wishListData(String id)
	   {
		   List<WishVO> list=new ArrayList<WishVO>();
		   try
		   {
			   conn=dbconn.getConnection();
			   String sql="SELECT cdno,kano, "
					     +"(SELECT KEEPIMAGE FROM KEEPANIMAL2 WHERE kano=CD_WISH.kano), "
					     +"(SELECT KEEPTITLE FROM KEEPANIMAL2 WHERE kano=CD_WISH.kano), "
					     +"(SELECT KEEPWRITER FROM KEEPANIMAL2 WHERE kano=CD_WISH.kano), "
					     +"(SELECT KEEPLOC FROM KEEPANIMAL2 WHERE kano=CD_WISH.kano), "
					     +"FROM CD_WISH "
					     +"WHERE id=? "
					     +"ORDER BY cdno DESC ";
			   /*String sql="SELECT no,fno,foodGetPoster(fno),"
					     +"foodGetName(fno),foodGetPhone(fno) "
					     +"FROM food_jjim "
					     +"WHERE id=? "
					     +"ORDER BY no DESC";*/
			   ps=conn.prepareStatement(sql);
			   ps.setString(1, id);
			   ResultSet rs=ps.executeQuery();
			   while(rs.next())
			   {
				   WishVO vo=new WishVO();
				   vo.setCdno(rs.getInt(1));
				   vo.setKano(rs.getInt(2));
				   /*
				   String poster=rs.getString(3);
				   poster=poster.substring(0,poster.indexOf("^"));
				   poster=poster.replace("#", "&");
				   */
				   vo.setKEEPIMAGE(rs.getString(3));
				   vo.setKEEPTITLE(rs.getString(4));
				   vo.setKEEPWRITER(rs.getString(5));
				   vo.setKEEPTITLE(rs.getString(6));
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
	   // Jjim취소
	   public void WishCancel(int cdno)
	   {
		   try
		   {
			   conn=dbconn.getConnection();
			   String sql="DELETE FROM CD_WISH "
					     +"WHERE no=?";
			   ps=conn.prepareStatement(sql);
			   ps.setInt(1, cdno);
			   ps.executeUpdate();
		   }catch(Exception ex)
		   {
			   ex.printStackTrace();
		   }
		   finally
		   {
			   dbconn.disConnection(conn, ps);
		   }
	   }
}
