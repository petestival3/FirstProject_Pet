package com.sist.model;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.sist.controller.RequestMapping;
import com.sist.dao.*; 
import java.util.*;
import com.sist.vo.*;
import java.text.*;
public class ReserveFuneralModel {
	
	@RequestMapping("reserve/reserve_funeral.do")
	public String reserve_funeral(HttpServletRequest request, HttpServletResponse response)
	{
	      // 3. 결과값 모아서 request에 저장
		  request.setAttribute("main_jsp", "../reserve/reserve_funeral.jsp");
		  commonsModel.commonsHeaderData(request);
		  return "../main/main.jsp";
	}
	 
	  @RequestMapping("reserve/res_f_list.do")
	  public String funeral_list(HttpServletRequest request, HttpServletResponse response)
	  {
		  String no=request.getParameter("no");
		  List<FuneralListVO> list=ReserveFuneralDAO.reserveFuneralListData(Integer.parseInt(no));
		  request.setAttribute("list", list);
		  return "../reserve/res_f_list.jsp";
	  }
	
	 //요기서부터 날짜, 시간, 인원, 데이터저장
	  
	  @RequestMapping("reserve/funeral_date.do")
	  public String funeral_date(HttpServletRequest request,HttpServletResponse response)
	  {
		  // 예약 가능한 날 
		  String fno=request.getParameter("fno");
		  System.out.println("fno:"+fno);
		  SimpleDateFormat sdf=new SimpleDateFormat("yyyy-M-d");
		  String today=sdf.format(new Date());
		  StringTokenizer st=new StringTokenizer(today,"-");
		  String sy=st.nextToken();
		  String sm=st.nextToken();
		  String sd=st.nextToken();
		  int year=Integer.parseInt(sy);
		  int month=Integer.parseInt(sm);
		  int day=Integer.parseInt(sd);
		  
		  // 요일 
		  String[] strWeek={"일","월","화","수","목","금","토"};
		  Calendar cal=Calendar.getInstance();
		  cal.set(Calendar.YEAR, year);
		  cal.set(Calendar.MONTH, month-1);
		  cal.set(Calendar.DATE, 1);
		  
		  // 요일 구하기 
		  int week=cal.get(Calendar.DAY_OF_WEEK);
		  int lastday=cal.getActualMaximum(Calendar.DATE);
		  week=week-1;
		  
		  request.setAttribute("year", year);
		  request.setAttribute("month", month);
		  request.setAttribute("day", day);
		  request.setAttribute("week", week);
		  request.setAttribute("lastday", lastday);
		  request.setAttribute("strWeek", strWeek);
		  // 예약 가능한 날 => DB연동 
		  String rdays=ReserveFuneralDAO.reserveDays(Integer.parseInt(fno));
		  int[] rday=new int[32];
		  System.out.println("rdays:"+rdays);
		  st=new StringTokenizer(rdays,",");
		  // 3,5,6,8,12,15,20,24,27,28,29
		  while(st.hasMoreTokens())
		  {
			  int a=Integer.parseInt(st.nextToken());
			  if(a>=day)
			  {
				  rday[a]=1;
			  }
		  }
		  System.out.println(Arrays.toString(rday));
		  request.setAttribute("rday", rday);
		  return "../reserve/funeral_date.jsp";
	  }
	  
	  @RequestMapping("reserve/funeral_time.do")
	  public String funeral_time(HttpServletRequest request,HttpServletResponse response)
	  {
		  String day=request.getParameter("day");
		  String rtimes=ReserveFuneralDAO.reserveTimes(Integer.parseInt(day));
		  // 2,3,6,7,....
		  List<String> list=new ArrayList<String>();
		  StringTokenizer st=new StringTokenizer(rtimes,",");
		  while(st.hasMoreTokens())
		  {
			  int tno=Integer.parseInt(st.nextToken());
			  String time=ReserveFuneralDAO.reserveGetTime(tno);
			  list.add(time);
		  }
		  request.setAttribute("list", list);
		  return "../reserve/funeral_time.jsp";
	  }
	  @RequestMapping("reserve/reserve_inwon.do")
	  public String reserve_inwon(HttpServletRequest request, HttpServletResponse response)
	  {
		  return "../reserve/funeral_inwon.jsp";
	  }
	  @RequestMapping("reserve/reserve_ok.do")
	  public String reserve_ok(HttpServletRequest request,HttpServletResponse response)
	  {
		  try 
		  {
			   request.setCharacterEncoding("UTF-8");  
		  }catch(Exception ex) {}
		  
		  String fno=request.getParameter("fno");
		  String rday=request.getParameter("rday");
		  String rtime=request.getParameter("rtime");
		  String rinwon=request.getParameter("rinwon");
		  HttpSession session=request.getSession();
		  String id=(String)session.getAttribute("id");
		  
		  FuneralReserveInfoVO vo=new FuneralReserveInfoVO();
		  vo.setCr_com_no(Integer.parseInt(fno));
		  vo.setId(id);
		  vo.setRf_day(rday);
		  vo.setRf_time(rtime);
		  vo.setRf_inwon(rinwon);
		  
		  /*
		  //이건 나현이가 예시로 알려준거
		  Map map=new HashMap();
		  map.put("id", id);
		  map.put("fno", fno);
		  map.put("day", rday);
		  map.put("time", rtime);
		  map.put("inwon", rinwon);
		  */
		  
		  System.out.println(vo);//vo.toString()
		  System.out.println(1);
		  // 데이터베이스 전송
		  ReserveFuneralDAO.FuneralreserveInsert(vo);
		  System.out.println(2);
		  return "redirect:../mypage/my_res_f.do";
	  }
	  /*
	  //이건 참고하려고 가져온 찜하기 취소
	  @RequestMapping("mypage/my_wish_cancel.do")
	   public String mypage_wish_cancel(HttpServletRequest request,
			   HttpServletResponse response)
	   {
		   String cdno=request.getParameter("cdno");
		   WishDAO dao=WishDAO.newInstance();
		   dao.WishCancel(Integer.parseInt(cdno));
		   return "redirect:../mypage/my_wish.do";
	   }
	  */
	  //예약 취소
	  @RequestMapping("mypage/my_res_f_cancel.do")
	  public String myres_f_cancel(HttpServletRequest request,
			   HttpServletResponse response)
	  {
		  String rf_no=request.getParameter("rf_no");
		  ReserveFuneralDAO dao=new ReserveFuneralDAO();
		  dao.Funeralreservedelete(Integer.parseInt(rf_no));
		  return "redirect:../mypage/my_res_f.do";
	  }
}
