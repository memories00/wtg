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
		MultipartFile mf=request.getFile("logo_upload"); // ���ε�� �������
		String orgname=mf.getOriginalFilename(); // ���ϳ��� ��������
		dto.setOrgname(orgname); // dto�� ���ϳ��� set�����ֱ�
		
		String path=request.getServletContext().getRealPath("")+"\\themeimg\\"; // ���ϰ��
		System.out.println(path);
		System.out.println(orgname);
		
		if(orgname=="") // ���� ����
		{
			return "/main/return.jsp";
		}
		
		int count=(Integer)sqlMap.queryForObject("admin.logoselect",null);//�����̵尹��
		
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
