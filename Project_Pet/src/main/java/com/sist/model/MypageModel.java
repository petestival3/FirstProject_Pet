package com.sist.model;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.Base64;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.sist.controller.RequestMapping;
import com.sist.dao.MyPageDAO;
import com.sist.vo.MyPageVO;

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
	    request.setAttribute("mypage_jsp", "../mypage/my_main.jsp");
	    request.setAttribute("main_jsp", "../mypage/mypage.jsp");
	    return "../main/main.jsp";
	}
@RequestMapping("mypage/my_res.do")
public String resList(HttpServletRequest request, HttpServletResponse response)
{
	request.setAttribute("mypage_jsp", "../mypage/my_res.jsp");
	request.setAttribute("main_jsp", "../mypage/mypage.jsp");
	
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
	    vo.setPet_weight(pet_weight);
	    
	    
	    

//	    System.out.println("pet_name: " + pet_name);
//	    System.out.println("pet_bday: " + pet_bday);
//	    System.out.println("pet_gender: " + pet_gender);
//	    System.out.println("pet_weight: " + pet_weight);
//	    System.out.println("pet_filename: " + filename);

	    dao.petRegInsert(vo);
	 

	    return "redirect:../mypage/my_petreg.do";
	
}
//	@RequestMapping("mypage/my_petinfo.do")
//	public void petInfo(HttpServletRequest request, HttpServletResponse response) throws IOException {
//	    try {
//	        request.setCharacterEncoding("UTF-8");
//	    } catch (Exception ex) {}
//
//	    HttpSession session=request.getSession();
//		session.getAttribute("id");
//
//	    MyPageVO vo = new MyPageVO();
//
////	    String pet_name = request.getParameter("pet_name");
////	    String pet_bday = request.getParameter("pet_bday");
////	    String pet_gender = request.getParameter("pet_gender");
////	    String pet_weight = request.getParameter("pet_weight");
//	    String id=(String) request.getParameter("id");
//	    
//	    
//	    JSONObject obj=new JSONObject();
//	    obj.put("pet_name", vo.getPet_name());
//	    obj.put("pet_gender", vo.getPet_gender());
//	    obj.put("pet_bday", vo.getPet_bday());
//	    obj.put("pet_weight", vo.getPet_weight());
//	    
//	    try
//		{
//			response.setContentType("application/x-www-form-urlencoded; charset=UTF-8");
//			PrintWriter out=response.getWriter();
//			out.write(obj.toString());
//		}catch(Exception ex) {}
//	   
//}


}
