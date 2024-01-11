package com.sist.model;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.Base64;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.sist.controller.RequestMapping;
import com.sist.dao.MyPageDAO;
import com.sist.dao.ReserveFuneralDAO;
import com.sist.dao.UnregDAO;
import com.sist.dao.WishDAO;
import com.sist.vo.FuneralReserveInfoVO;
import com.sist.vo.MemberVO;
import com.sist.vo.MyPageVO;
import com.sist.vo.ReserveStayInfoVO;
import com.sist.vo.RoomVO;
import com.sist.vo.ShoppingVO;
import com.sist.vo.WishVO;


public class MypageModel {
	@RequestMapping("mypage/mypage.do")
	public String mypageMain(HttpServletRequest request, HttpServletResponse response) {
	    try {
	        request.setCharacterEncoding("UTF-8");
	    } catch (Exception ex) {}

	    HttpSession session = request.getSession();
	    String id = (String) session.getAttribute("id");
	    MyPageDAO dao = MyPageDAO.newInstance();
	    MyPageVO vo = dao.mypagePet(id);
	    MemberVO myvo=dao.mypageMy(id);
	    
	    String filename = vo.getPet_filename();
	    String path = "c://download";
	    File file = new File(path + "\\" + filename);

	    try {
	        // 파일이 존재하면 읽어오고 Base64로 인코딩
	        if (file.exists()) {
	            // 파일의 확장자 추출
	            String extension = filename.substring(filename.lastIndexOf(".") + 1);

	            // 이미지를 바이트 배열로 읽어오기
	            byte[] imageData = Files.readAllBytes(file.toPath());

	            // 바이트 배열을 Base64 인코딩으로 변환
	            String petimg = "data:image/" + extension + ";base64," + Base64.getEncoder().encodeToString(imageData);

	            // JSP에 전달할 속성 설정
	            request.setAttribute("petimg", petimg);
	        } 
	    } catch (Exception ex) {}
	    request.setAttribute("vo", vo);
	    request.setAttribute("myvo", myvo);
	    request.setAttribute("mypage_jsp", "../mypage/my_main.jsp");
	    request.setAttribute("main_jsp", "../mypage/mypage.jsp");
	    return "../main/main.jsp";
	}

@RequestMapping("mypage/my_res_f.do")
public String resList_f(HttpServletRequest request, HttpServletResponse response)
{
	HttpSession session=request.getSession();
	String id=(String)session.getAttribute("id");
    List<FuneralReserveInfoVO> list=
			     ReserveFuneralDAO.mypageReserveListData(id);
    request.setAttribute("list", list);
	request.setAttribute("mypage_jsp", "../mypage/my_res_f.jsp");
	request.setAttribute("main_jsp", "../mypage/mypage.jsp");
	
	return "../main/main.jsp";
}

//장례식장 예약 취소
@RequestMapping("mypage/my_res_f_cancel.do")
public String myres_f_cancel(HttpServletRequest request,
		   HttpServletResponse response)
{
	  String rf_no=request.getParameter("rf_no");
	  ReserveFuneralDAO dao=new ReserveFuneralDAO();
	  dao.Funeralreservedelete(Integer.parseInt(rf_no));
	  return "redirect:../mypage/my_res_f.do";
}

@RequestMapping("mypage/my_wish.do")
public String wishList(HttpServletRequest request, HttpServletResponse response)
{
	
	  HttpSession session=request.getSession();
	  String id=(String)session.getAttribute("id");
	  WishDAO dao=WishDAO.newInstance();
	  List<WishVO> list=dao.wishListData(id);
	  request.setAttribute("list", list);
	  request.setAttribute("mypage_jsp", "../mypage/my_wish.jsp");
	  request.setAttribute("main_jsp", "../mypage/mypage.jsp");
	  //CommonModel.commonRequestData(request);
	
	return "../main/main.jsp";
}

@RequestMapping("mypage/my_petreg.do")
public String petregData(HttpServletRequest request, HttpServletResponse response) throws IOException
{

	
	request.setAttribute("main_jsp", "../mypage/my_petreg.jsp");
	return "../main/main.jsp";
}

	@RequestMapping("mypage/my_petInsert.do")
	public String petInsert(HttpServletRequest request, HttpServletResponse response) throws IOException {
	    try {
	        request.setCharacterEncoding("UTF-8");
	    } catch (Exception ex) {}
 
	    MyPageDAO dao = MyPageDAO.newInstance();
	    MyPageVO vo = new MyPageVO();

	    // 파일 업로드
	    String path = "c://download";
	    int max = 1024 * 1024 * 100;

	    MultipartRequest mr = new MultipartRequest(request, path, max, "UTF-8", new DefaultFileRenamePolicy());
	    String filename = mr.getFilesystemName("upload");

	    if (filename == null) {
	        vo.setPet_filename("");
	        vo.setPet_filesize(0);
	    } else {
	        File file = new File(path + "\\" + filename);
	        vo.setPet_filename(filename);
	        vo.setPet_filesize((int) file.length());
	    }

	    // 파라미터값 받기
	    HttpSession session=request.getSession();
	    String user_Id = (String) session.getAttribute("id");
	    
	    String pet_name = mr.getParameter("pet_name");
	    String pet_bday = mr.getParameter("pet_bday");
	    String pet_gender = mr.getParameter("pet_gender");
	    String pet_check = mr.getParameter("pet_check");
	    String pet_weight = mr.getParameter("pet_weight");

	    vo.setUser_id(user_Id);
	    vo.setPet_name(pet_name);
	    vo.setPet_bday(pet_bday);
	    vo.setPet_gender(pet_gender);
	    vo.setPet_check(pet_check);
	    System.out.println(vo.getPet_check());
	    vo.setPet_weight(pet_weight);

	    System.out.println("pet_name: " + pet_name);
	    System.out.println("pet_bday: " + pet_bday);
	    System.out.println("pet_gender: " + pet_gender);
	    System.out.println("pet_weight: " + pet_weight);
	    System.out.println("pet_filename: " + filename);

	    dao.petRegInsert(vo);
	 

	    return "redirect:../mypage/my_petreg.do";
	
}
	
	@RequestMapping("mypage/my_petinfo.do")
	public String mypetInfo(HttpServletRequest request, HttpServletResponse response) {
	    try {
	        request.setCharacterEncoding("UTF-8");
	    } catch (Exception ex) {}

	    HttpSession session = request.getSession();
	    String id = (String) session.getAttribute("id");
	    MyPageDAO dao = MyPageDAO.newInstance();
	    MyPageVO vo = dao.mypagePet(id);
	    String filename = vo.getPet_filename();
	    String path = "c://download";
	    File file = new File(path + "\\" + filename);

	    try {
	        // 파일이 존재하면 읽어오고 Base64로 인코딩
	        if (file.exists()) {
	            // 파일의 확장자 추출
	            String extension = filename.substring(filename.lastIndexOf(".") + 1);

	            // 이미지를 바이트 배열로 읽어오기
	            byte[] imageData = Files.readAllBytes(file.toPath());

	            // 바이트 배열을 Base64 인코딩으로 변환
	            String petimg = "data:image/" + extension + ";base64," + Base64.getEncoder().encodeToString(imageData);

	            // JSP에 전달할 속성 설정
	            request.setAttribute("petimg", petimg);
	        } 
	    } catch (Exception ex) {}
	    request.setAttribute("vo", vo);
	    request.setAttribute("main_jsp", "../mypage/my_petinfo.jsp");
	    return "../main/main.jsp";
	}


	
@RequestMapping("mypage/my_petupdate.do")
public String petUpdate(HttpServletRequest request, HttpServletResponse response) throws IOException {
    try {
        request.setCharacterEncoding("UTF-8");
    } catch (Exception ex) {}

    HttpSession session=request.getSession();
    String id = (String) session.getAttribute("id");
    MyPageDAO dao = MyPageDAO.newInstance();
    MyPageVO vo = new MyPageVO();

    // 파일 업로드
    String path = "c://download";
    int max = 1024 * 1024 * 100;

    MultipartRequest mr = new MultipartRequest(request, path, max, "UTF-8", new DefaultFileRenamePolicy());
    String filename = mr.getFilesystemName("upload");

    if (filename == null) {
        vo.setPet_filename("");
        vo.setPet_filesize(0);
    } else {
        File file = new File(path + "\\" + filename);
        vo.setPet_filename(filename);
        vo.setPet_filesize((int) file.length());
    }

    // 파라미터값 받기
    
    
    String pet_name = mr.getParameter("pet_name");
    String pet_bday = mr.getParameter("pet_bday");
    String pet_gender = mr.getParameter("pet_gender");
    String pet_check = mr.getParameter("pet_check");
    String pet_weight = mr.getParameter("pet_weight");

    vo.setPet_name(pet_name);
    vo.setPet_bday(pet_bday);
    vo.setPet_gender(pet_gender);
    vo.setPet_check("y".equals(pet_check) ? "y" : null);
    vo.setPet_weight(pet_weight);

    dao.mypagePetUpdate(id,vo);
 

    return "redirect:../mypage/my_petinfo.do";

}
@RequestMapping("mypage/my_info.do")
public String myInfo(HttpServletRequest request, HttpServletResponse response) {
    try {
        request.setCharacterEncoding("UTF-8");
    } catch (Exception ex) {}

    HttpSession session = request.getSession();
    String id = (String) session.getAttribute("id");
    MyPageDAO dao = MyPageDAO.newInstance();
    MemberVO vo = dao.mypageMy(id);

    request.setAttribute("vo", vo);
    request.setAttribute("main_jsp", "../mypage/my_info.jsp");
    return "../main/main.jsp";
}
@RequestMapping("mypage/my_update.do")
public String myUpdate(HttpServletRequest request, HttpServletResponse response) {
    try {
        request.setCharacterEncoding("UTF-8");
    } catch (Exception ex) {}

    HttpSession session = request.getSession();
    String id = (String) session.getAttribute("id");
    MyPageDAO dao = MyPageDAO.newInstance();
    MemberVO vo=new MemberVO();

    
    String pwd=request.getParameter("pwd");
    String name=request.getParameter("name");
    String sex=request.getParameter("sex");
    String email=request.getParameter("email");
    String post=request.getParameter("post");
    String addr1=request.getParameter("addr1");
    String addr2=request.getParameter("addr2");
    String phone=request.getParameter("phone");
    String content=request.getParameter("content");
    
   vo.setPwd(pwd);
   vo.setSex(sex);
   vo.setName(name);
   vo.setEmail(email);
   vo.setPost(post);
   vo.setAddr1(addr1);
   vo.setAddr2(addr2);
   vo.setPhone(phone);
   vo.setContent(content);
   
   System.out.println(vo.getSex());
   
   dao.mypageMyUpdate(id, vo);

    request.setAttribute("vo", vo);
    request.setAttribute("main_jsp", "../mypage/my_info.jsp");
    return "../main/main.jsp";
}
@RequestMapping("mypage/my_unreg.do")
public String myunreg(HttpServletRequest request, HttpServletResponse response) {
    
	request.setAttribute("main_jsp", "../mypage/my_unreg.jsp");
    return "../main/main.jsp";
    
}
@RequestMapping("mypage/my_unreg_ok.do")
public void myunreg_ok(HttpServletRequest request, HttpServletResponse response) {
	try {
        request.setCharacterEncoding("UTF-8");
    } catch (Exception ex) {}
    
    HttpSession session=request.getSession();
	String id=(String)session.getAttribute("id");
	String pwd=request.getParameter("pwd");
	
	Map map=new HashMap();
	map.put("id", id);
	map.put("pwd", pwd);
	System.out.println(pwd);
	
	String res=UnregDAO.delete_AllTables(map);
	
	try
	{
		PrintWriter out=response.getWriter();
		out.write(res);
		System.out.println("model:"+res);
	}catch(Exception ex) {}
	session.invalidate();
	
    
}
@RequestMapping("mypage/my_res.do")
public String resList(HttpServletRequest request, HttpServletResponse response)
{
	 HttpSession session=request.getSession();
	 String id=(String)session.getAttribute("id");
	 List<ReserveStayInfoVO> list=MyPageDAO.myStayResList(id);
//	    System.out.println("예약내역 호출");
	 request.setAttribute("list", list);
	request.setAttribute("mypage_jsp", "../mypage/my_res.jsp");
	request.setAttribute("main_jsp", "../mypage/mypage.jsp");
	
	return "../main/main.jsp";
}

@RequestMapping("mypage/my_res_cancel.do")
public void my_res_cancel(HttpServletRequest request, HttpServletResponse response) {
	
	
	 HttpSession session=request.getSession();
	 String id=(String)session.getAttribute("id");
	 String rno=request.getParameter("rno");
	 Map map=new HashMap();
	 map.put("id", id);
	 map.put("rno", rno);
	 System.out.println(id);
	 System.out.println(rno);
	 MyPageDAO.myStayResListDelete(map);
  
}
@RequestMapping("mypage/my_buy.do")
public String buyList(HttpServletRequest request, HttpServletResponse response)
{
	 HttpSession session=request.getSession();
	 String id=(String)session.getAttribute("id");
	 List<ShoppingVO> bList=MyPageDAO.mybuyList(id);
//	    System.out.println("결제내역 호출");
	 request.setAttribute("bList", bList);
	request.setAttribute("mypage_jsp", "../mypage/my_buy.jsp");
	request.setAttribute("main_jsp", "../mypage/mypage.jsp");
	
	return "../main/main.jsp";
}
@RequestMapping("mypage/my_buy_delete.do")
public void my_buy_delete(HttpServletRequest request, HttpServletResponse response) {
	
	
	 HttpSession session=request.getSession();
	 String id=(String)session.getAttribute("id");
	 String cbno=request.getParameter("cbno");
	 Map map=new HashMap();
	 map.put("id", id);
	 map.put("cbno", cbno);
	 System.out.println(id);
	 System.out.println(cbno);
	 MyPageDAO.mybuyCancel(map);
  
}


}
