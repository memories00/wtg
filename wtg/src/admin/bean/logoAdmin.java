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
public class logoAdmin {

	@Autowired
	private SqlMapClientTemplate sqlMap;
	
	@RequestMapping("/logochange.nhn")
	public String logochange(MultipartHttpServletRequest request,LogoDTO dto){
		MultipartFile mf=request.getFile("logo_upload"); // 업로드명 갖고오기
		String orgname=mf.getOriginalFilename(); // 파일네임 가져오기
		dto.setOrgname(orgname); // dto에 파일네임 set시켜주기
		
		String path=request.getServletContext().getRealPath("")+"\\themeimg\\"; // 파일경로
		System.out.println(path);
		System.out.println(orgname);
		
		if(orgname=="") // 파일 선택
		{
			return "/main/return.jsp";
		}
		
		int count=(Integer)sqlMap.queryForObject("admin.logoselect",null);//슬라이드갯수
		
		if(count==0)
		{
			sqlMap.insert("admin.logoinsert",dto);
			File copy = new File(path+dto.getOrgname());
			try{mf.transferTo(copy);}
			catch(Exception e){e.printStackTrace();}
		}
		if(count==1)
		{
			sqlMap.update("admin.logoupdate",dto);
			File copy = new File(path+dto.getOrgname());
			try{mf.transferTo(copy);}
			catch(Exception e){e.printStackTrace();}
		}

		
		request.setAttribute("dto", dto);
		request.setAttribute("path", path);
		return "redirect:pageDesignAdmin.nhn";
	}
}
