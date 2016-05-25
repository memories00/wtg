package admin.bean;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import main.bean.SlideDTO;

@Controller
public class sliderAdmin {

	@Autowired
	private SqlMapClientTemplate sqlMap;
	
	@RequestMapping("/mainslide.nhn")
	public String mainslide(MultipartHttpServletRequest request,SlideDTO dto){
		int count=(Integer)sqlMap.queryForObject("main.slidecount",null);//슬라이드갯수
		MultipartFile mf=request.getFile("upload"); // 업로드명 갖고오기
		String orgName=mf.getOriginalFilename(); // 파일네임 가져오기
		dto.setOrgname(orgName); // dto에 파일네임 set시켜주기
		
		String path=request.getServletContext().getRealPath("")+"\\adminImg\\"; // 파일경로
		System.out.println(path);
		
		if(orgName=="") // 파일 선택
		{
			return "/main/return.jsp";
		}
		
		long time = System.currentTimeMillis(); 
		SimpleDateFormat dayTime = new SimpleDateFormat("yyMMddhhmmss");
		String str = dayTime.format(new Date(time));
		dto.setFiletime(str);

		sqlMap.insert("main.slideinsert",dto);
		
		File copy = new File(path+str+dto.getOrgname());
		try{mf.transferTo(copy);}
		catch(Exception e){e.printStackTrace();}
		
		request.setAttribute("dto", dto);
		request.setAttribute("path", path);
		request.setAttribute("count", count);
		return "redirect:pageDesignAdmin.nhn";
	}
	
	@RequestMapping("/category.nhn")
	public String category(MultipartHttpServletRequest request,SlideDTO dto){
		MultipartFile mf=request.getFile("category"); // 업로드명 갖고오기
		String orgName=mf.getOriginalFilename(); // 파일네임 가져오기
		dto.setOrgname2(orgName); // dto에 파일네임 set시켜주기
		
		String path=request.getServletContext().getRealPath("")+"\\categoryimg\\"; // 파일경로
		System.out.println(path);
		if(orgName=="") // 파일 선택
		{
			return "/main/return.jsp";
		}
		
		long time = System.currentTimeMillis(); 
		SimpleDateFormat dayTime = new SimpleDateFormat("yyMMddhhmmss");
		String str = dayTime.format(new Date(time));
		dto.setFiletime2(str);

		sqlMap.insert("main.cateinsert",dto);
		
		File copy = new File(path+str+dto.getOrgname2());
		try{mf.transferTo(copy);}
		catch(Exception e){e.printStackTrace();}
		
		request.setAttribute("dto", dto);
		request.setAttribute("path", path);
		return "redirect:pageDesignAdmin.nhn";
	}
	
	@RequestMapping("/slidedelete.nhn")
	public String slidedelete(HttpServletRequest request,SlideDTO dto){
		String ch[]=request.getParameterValues("check");
		String path=request.getServletContext().getRealPath("")+"\\adminImg\\";
		for(String c:ch)
		{
			dto=(SlideDTO) sqlMap.queryForObject("main.sldel",c);//
			File deleteFile = new File(path+dto.getFiletime()+dto.getOrgname());
			deleteFile.delete();
			sqlMap.delete("main.slidedelete",c);
		}
		return "redirect:pageDesignAdmin.nhn";
	}
	
	@RequestMapping("/categorydelete.nhn")
	public String categorydelete(HttpServletRequest request,SlideDTO dto){
		String ch[]=request.getParameterValues("check2");
		String path=request.getServletContext().getRealPath("")+"\\categoryimg\\";
		for(String c:ch)
		{
			dto=(SlideDTO) sqlMap.queryForObject("main.cadel",c);//
			File deleteFile = new File(path+dto.getFiletime2()+dto.getOrgname2());
			deleteFile.delete();
			sqlMap.delete("main.categorydelete",c);
		}
		return "redirect:pageDesignAdmin.nhn";
	}
}
