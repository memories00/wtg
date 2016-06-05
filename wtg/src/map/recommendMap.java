package map;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import main.bean.SlideDTO;


@Controller
public class recommendMap {
	
	@Autowired
	private SqlMapClientTemplate sqlMap;
	
	@RequestMapping("/recommendMain.nhn")
	public String recommendMain(HttpServletRequest request){	
		HttpSession session=request.getSession();
		session.setAttribute("memId","test");
		
		return  "/map/recommendMain.jsp";
	}
	@RequestMapping("/recomCourse.nhn")
	public String recomCourse(HttpServletRequest request,String tag){	
		
		System.out.println(tag);
		return  "/map/recomCourse.jsp";
	}
	

}
