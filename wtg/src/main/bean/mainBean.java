package main.bean;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.jdom.Document;
import org.jdom.Element;
import org.jdom.JDOMException;
import org.jdom.input.SAXBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Controller
public class mainBean 
{
	@Autowired
	private SqlMapClientTemplate sqlMap;
	
	@RequestMapping("/main.nhn")
	public String main(HttpSession session, HttpServletRequest request) throws JDOMException, IOException
	{	
		List<SlideDTO> list = new ArrayList<SlideDTO>();
		list = sqlMap.queryForList("main.selectAll",null);
		List<SlideDTO> list2 = new ArrayList<SlideDTO>();
		list2 = sqlMap.queryForList("main.cateselect",null);
		request.setAttribute("list2", list2);
		request.setAttribute("list", list);
		
		SAXBuilder builder = new SAXBuilder();
		Document doc=builder.build("C:/Users/user1/git/wtg/wtg/WebContent/main/get_today.xml");
		//C:/DATA/XML/get_today.xml
		Element root=doc.getRootElement();
		List children = root.getChildren();
		
		for(int i=0;i<children.size();i++)
		{
			Element e =(Element)children.get(i);
			String tagName = e.getName();
			
			if(tagName.equals("state_ko")) // 지역
			{request.setAttribute("state_ko", e.getValue());}
			
			else if(tagName.equals("temp")) // 현재온도
			{request.setAttribute("temp", e.getValue());}
			
			else if(tagName.equals("max_temp")) // 최고온도
			{request.setAttribute("max_temp", e.getValue());}
			
			else if(tagName.equals("min_temp")) // 최저온도
			{request.setAttribute("min_temp", e.getValue());}
			
			else if(tagName.equals("wtext")) //
			{request.setAttribute("wtext", e.getValue());}
			
			else if(tagName.equals("icon")) // 아이콘
			{request.setAttribute("icon", e.getValue());}
			
			else if(tagName.equals("pm10")) // 미세먼지
			{request.setAttribute("pm10", e.getValue());}
		}
		
		return  "/main/main.jsp";
	}
	
	@RequestMapping("/mainadmin.nhn")
	public String mainadmin(HttpSession session,HttpServletRequest request){
		List<SlideDTO> list = new ArrayList<SlideDTO>();
		list = sqlMap.queryForList("main.selectAll",null);
		List<SlideDTO> list2 = new ArrayList<SlideDTO>();
		list2 = sqlMap.queryForList("main.cateselect",null);
		request.setAttribute("list2", list2);
		request.setAttribute("list", list);
		//System.out.println(((SlideDTO)list.get(0)).getOrgname());
		//System.out.println(((SlideDTO)list.get(0)).getFiletime());

		return "/admin/fixPage.jsp";
	}
	
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
		
		System.out.println(orgName);
		
		long time = System.currentTimeMillis(); 
		SimpleDateFormat dayTime = new SimpleDateFormat("yyMMddhhmmss");
		String str = dayTime.format(new Date(time));
		System.out.println(str);
		dto.setFiletime(str);

		System.out.println(dto.getFileaddr());
		sqlMap.insert("main.slideinsert",dto);
		
		File copy = new File(path+str+dto.getOrgname());
		try{mf.transferTo(copy);}
		catch(Exception e){e.printStackTrace();}
		
		request.setAttribute("dto", dto);
		request.setAttribute("path", path);
		request.setAttribute("count", count);
		return "redirect:mainadmin.nhn";
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
		
		System.out.println(orgName);
		
		long time = System.currentTimeMillis(); 
		SimpleDateFormat dayTime = new SimpleDateFormat("yyMMddhhmmss");
		String str = dayTime.format(new Date(time));
		System.out.println(str);
		dto.setFiletime2(str);

		System.out.println(dto.getFileaddr2());
		sqlMap.insert("main.cateinsert",dto);
		
		File copy = new File(path+str+dto.getOrgname2());
		try{mf.transferTo(copy);}
		catch(Exception e){e.printStackTrace();}
		
		request.setAttribute("dto", dto);
		request.setAttribute("path", path);
		return "redirect:mainadmin.nhn";
	}
	@RequestMapping("/slidedelete.nhn")
	public String slidedelete(HttpServletRequest request,SlideDTO dto){
		System.out.println(request.getParameterValues("check"));
		String ch[]=request.getParameterValues("check");
		String path=request.getServletContext().getRealPath("")+"\\adminImg\\";
		for(String c:ch)
		{
			dto=(SlideDTO) sqlMap.queryForObject("main.sldel",c);//
			System.out.println("파일시간="+dto.getFiletime()+"파일이름="+dto.getOrgname());
			File deleteFile = new File(path+dto.getFiletime()+dto.getOrgname());
			deleteFile.delete();
			sqlMap.delete("main.slidedelete",c);
		}
		return "redirect:mainadmin.nhn";
	}
	@RequestMapping("/categorydelete.nhn")
	public String categorydelete(HttpServletRequest request,SlideDTO dto){
		System.out.println(request.getParameterValues("check2"));
		String ch[]=request.getParameterValues("check2");
		String path=request.getServletContext().getRealPath("")+"\\categoryimg\\";
		for(String c:ch)
		{
			dto=(SlideDTO) sqlMap.queryForObject("main.cadel",c);//
			File deleteFile = new File(path+dto.getFiletime2()+dto.getOrgname2());
			deleteFile.delete();
			sqlMap.delete("main.categorydelete",c);
		}
		return "redirect:mainadmin.nhn";
	}
	
}
