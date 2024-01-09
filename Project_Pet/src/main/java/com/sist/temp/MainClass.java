package com.sist.temp;
import com.sist.vo.*;
import java.util.*;
public class MainClass {
   public static void main(String[] args) {
	   
	   MyDAO dao=new MyDAO();
	   List<Integer> list=dao.funeralNumberData();
	   
	   /*
	   //1
	   String s=reserveDayInput();
	   System.out.println(s);
	   */
	   
	   /*
	   //2
	   for(int i:list)
	   {
		   FuneralListVO vo=new FuneralListVO();
		   vo.setCR_COM_NO(i);
		   vo.setRday(reserveDayInput());
		   dao.funeralDayInsert(vo);
	   }
	   System.out.println("저장 완료");
	   */
	   
	   //3
	   for(int i=1;i<=31;i++)
	   {
		   FuneralReserveDayVO vo=new FuneralReserveDayVO();
		   vo.setRd_no(i);
		   vo.setRd_time(reserveTimeInput());
		   dao.funeralTimeInsert(vo);
	   }
	   System.out.println("저장 완료!!");
	   
   }
   public static String reserveTimeInput()
   {
	   String result="";
	   int[] com=new int[(int)(Math.random()*5)+5];
	   int su=0; // 난수 
	   boolean bCheck=false; // 중복 확인
	   for(int i=0;i<com.length;i++)
	   {
		   bCheck=true;
		   while(bCheck)
		   {
			   su=(int)(Math.random()*18)+1;
			   bCheck=false;
			   for(int j=0;j<i;j++)
			   {
				   if(com[j]==su)
				   {
					   bCheck=true;
					   break;
				   }
			   }
		   }
		   com[i]=su;
	   }
	   Arrays.sort(com);
	   for(int i=0;i<com.length;i++)
	   {
		   result+=com[i]+",";
	   }
	   result=result.substring(0,result.lastIndexOf(","));
	   return result;
   }
   public static String reserveDayInput()
   {
	   String result="";
	   int[] com=new int[(int)(Math.random()*10)+11];
	   int su=0;
	   boolean bCheck=false;
	   for(int i=0;i<com.length;i++)
	   {
		   bCheck=true;
		   while(bCheck)
		   {
			   su=(int)(Math.random()*31)+1;
			   bCheck=false;
			   for(int j=0;j<i;j++)
			   {
				   if(com[j]==su)
				   {
					   bCheck=true;
					   break;
				   }
			   }
		   }
		   com[i]=su;
	   }
	   Arrays.sort(com);
	   for(int i=0;i<com.length;i++)
	   {
		   result+=com[i]+",";
	   }
	   result=result.substring(0,result.lastIndexOf(","));
	   return result;
   }
}