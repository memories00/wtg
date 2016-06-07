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
import theme.thDTO;


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
		thDTO thDto=new thDTO();
		List  < thDTO>list = new ArrayList<thDTO>();
		 list=sqlMap.queryForList("map.searchTag",tag);

		request.setAttribute("list",list);
		return  "/map/recomCourse.jsp";
	}
	@RequestMapping("/gAndh.nhn")
	public void gAndh(HttpServletRequest request,int cnt,int num){	
		HttpSession session=request.getSession();
		System.out.println(cnt);
		if(cnt==0)
		{
			sqlMap.update("map.updateGood",num);
		}
		//return  "/map/recommendMain.jsp";
	}
	

}
