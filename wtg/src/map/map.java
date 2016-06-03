package map;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import location.bean.MapDto;

@Controller
public class map
{
	@Autowired
	private SqlMapClientTemplate sqlMap;
	
	@RequestMapping("/courseInput.nhn")
	public String courseInput(HttpServletRequest request){	
		HttpSession session=request.getSession();
		session.setAttribute("memId","test");
		return  "/map/courseInput.jsp";
	}
	@RequestMapping("/courseView.nhn")
	public String courseView(HttpServletRequest request,int num){	
		mapDto dto=new mapDto();
		dto=(mapDto)sqlMap.queryForObject("map.getCourse",num);
		String s_point=dto.getS_point();
		String s_name=dto.getS_name();
		String e_point=dto.getE_point();
		String e_name=dto.getE_name();
		String passInfo="";
		if(dto.getP1_point()!=null){
			passInfo+=dto.getP1_name()+"/"+dto.getP1_point()+"@";
		}
		if(dto.getP2_point()!=null){
			passInfo+=dto.getP2_name()+"/"+dto.getP2_point()+"@";
		}
		if(dto.getP3_point()!=null){
			passInfo+=dto.getP3_name()+"/"+dto.getP3_point()+"@";

		}
		if(dto.getP4_point()!=null){
			passInfo+=dto.getP4_name()+"/"+dto.getP4_point()+"@";

		}
		if(dto.getP5_point()!=null){
			passInfo+=dto.getP5_name()+"/"+dto.getP5_point()+"^";
		}
		request.setAttribute("passInfo",passInfo);
		request.setAttribute("s_name",s_name);
		request.setAttribute("s_point",s_point);
		request.setAttribute("e_name",e_name);
		request.setAttribute("e_point",e_point);
		return  "/map/viewCourse.jsp";
	}

	
	
}
