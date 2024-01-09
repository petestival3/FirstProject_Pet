package com.sist.model;
import java.text.SimpleDateFormat;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.controller.RequestMapping;
import com.sist.vo.*;
import com.sist.dao.*;
public class StayReserveModel {
	@RequestMapping("stayreserve/stayreserve_main.do")
		public String reserve_main(HttpServletRequest request, HttpServletResponse response) {
		String rno=request.getParameter("rno");
		
		StayDAO dao=StayDAO.newInstance();
		RoomVO vo=dao.roomdetail(Integer.parseInt(rno));
		
		// 예약 가능한 날
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
				String[] strWeek= {"일","월","화","수","목","금","토"};
				Calendar cal=Calendar.getInstance();
				cal.set(Calendar.YEAR, year);
				cal.set(Calendar.MONTH, month-1);
				cal.set(Calendar.DATE, 1);
				
				// 요일구하기
				int week=cal.get(Calendar.DAY_OF_WEEK);
				int lastday=cal.getActualMaximum(Calendar.DATE);
				week=week-1;
				
				request.setAttribute("year", year);
				request.setAttribute("month", month);
				request.setAttribute("day", day);
				request.setAttribute("week", week);
				request.setAttribute("lastday", lastday);
				request.setAttribute("strWeek", strWeek);
				
				int[] rday=new int[32];
				for(int i=1;i<32;i++) {
					if(i>day) {
						rday[i]=1;
					}
				}
				request.setAttribute("rday", rday);
				
		
		request.setAttribute("rno", Integer.parseInt(rno));
		request.setAttribute("vo", vo);
		request.setAttribute("main_jsp", "../reserve/reservestay_main.jsp");
		return "../main/main.jsp";
	}
	
	@RequestMapping("reserve/reservestay_checkout.do")
	public String reserve_checkout(HttpServletRequest request, HttpServletResponse response) {
		String checkin=request.getParameter("checkin");
		
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
		String[] strWeek= {"일","월","화","수","목","금","토"};
		Calendar cal=Calendar.getInstance();
		cal.set(Calendar.YEAR, year);
		cal.set(Calendar.MONTH, month-1);
		cal.set(Calendar.DATE, 1);
		
		// 요일구하기
		int week=cal.get(Calendar.DAY_OF_WEEK);
		int lastday=cal.getActualMaximum(Calendar.DATE);
		week=week-1;
		
		request.setAttribute("year", year);
		request.setAttribute("month", month);
		request.setAttribute("day", day);
		request.setAttribute("week", week);
		request.setAttribute("lastday", lastday);
		request.setAttribute("strWeek", strWeek);
		
		int[] rdayout=new int[32];
		for(int i=1;i<32;i++) {
			if(i>Integer.parseInt(checkin)) {
				rdayout[i]=1;
			}
		}
		request.setAttribute("rdayout", rdayout);
		
		
		return "../reserve/reservestay_checkout.jsp";
	}
	
	
	@RequestMapping("reserve/stayreserve_ok.do")
	public String stayreserve_ok(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("UTF-8");
		}catch(Exception ex) {}
		
		
		String roomname=request.getParameter("resroomname");
		String roomimage=request.getParameter("resroomimage");
		String rno=request.getParameter("resrno");
		String rcheckin=request.getParameter("rcheckin");
		String rcheckout=request.getParameter("rcheckout");
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		
		
		ReserveStayInfoVO vo=new ReserveStayInfoVO();
		vo.setStay_no(Integer.parseInt(rno));
		vo.setId(id);
		vo.setCheckin(rcheckin);
		vo.setCheckout(rcheckout);
		vo.setRoomimage(roomimage);
		vo.setRoomname(roomname);
		vo.setInwon("0");
		
		StayReserveDAO dao=StayReserveDAO.newInstance();
		dao.stayroominsert(vo);
		
		System.out.println("방예약성공");
		// 데이터베이스 전송
		
		return "redirect:../mypage/my_res.do";
	}
}
