package com.sist.model;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.sist.controller.RequestMapping;
import com.sist.dao.MyPageDAO;
import com.sist.vo.MyPageVO;

public class MypageModel {
@RequestMapping("mypage/mypage.do")
public String mypageMain(HttpServletRequest request, HttpServletResponse response)
{
	
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
	    String pet_name = mr.getParameter("pet_name");
	    String pet_bday = mr.getParameter("pet_bday");
	    String pet_gender = mr.getParameter("pet_gender");
	    String pet_weight = mr.getParameter("pet_weight");

	    vo.setPet_name(pet_name);
	    vo.setPet_bday(pet_bday);
	    vo.setPet_gender(pet_gender);
	    vo.setPet_weight(pet_weight);

//	    System.out.println("pet_name: " + pet_name);
//	    System.out.println("pet_bday: " + pet_bday);
//	    System.out.println("pet_gender: " + pet_gender);
//	    System.out.println("pet_weight: " + pet_weight);
//	    System.out.println("pet_filename: " + filename);

	    dao.petRegInsert(vo);

	    return "redirect:../mypage/my_petreg.do";
	
}

}
