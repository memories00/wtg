package map;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;

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
		String e_point=dto.getE_point();
		int passCnt=0;
		if(dto.getP1_point()!=null){
			request.setAttribute("p1_name",dto.getP1_name());
			request.setAttribute("p1_point",dto.getP1_point());
			passCnt=1;
		}
		if(dto.getP2_point()!=null){
			request.setAttribute("p2_name",dto.getP2_name());
			request.setAttribute("p2_point",dto.getP2_point());
			passCnt=2;
		}
		if(dto.getP3_point()!=null){
			request.setAttribute("p3_name",dto.getP3_name());
			request.setAttribute("p3_point",dto.getP3_point());
			passCnt=3;
		}
		if(dto.getP4_point()!=null){
			request.setAttribute("p4_name",dto.getP4_name());
			request.setAttribute("p4_point",dto.getP4_point());
			passCnt=4;
		}
		if(dto.getP5_point()!=null){
			request.setAttribute("p5_name",dto.getP5_name());
			request.setAttribute("p5_point",dto.getP5_point());
			passCnt=5;
		}
		request.setAttribute("passCnt",passCnt);
		return  "/map/viewCourse.jsp";
	}

	
	
}
