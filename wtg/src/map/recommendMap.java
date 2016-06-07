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
	public String  gAndh(HttpServletRequest request,int cnt,int num){	
		HttpSession session=request.getSession();
		gAndHDto ghDto=new gAndHDto();
		session.setAttribute("memId","test");
		String sessionId=(String)session.getAttribute("memId");
		ghDto.setNum(num);
		ghDto.setId(sessionId);
		ghDto.setStatus(cnt);
		
		int check=(Integer)sqlMap.queryForObject("map.checkGandH",ghDto);
		System.out.println(check);
		if(check==1)
		{
			int statusCnt=(Integer)sqlMap.queryForObject("map.getStatus",ghDto);
			if(statusCnt==0 && cnt==1)
			{
				sqlMap.update("map.downGood",num);
				sqlMap.update("map.updateHate",num);
				request.setAttribute("statusCnt",new Integer(0));
			}
			if(statusCnt==1 && cnt==0)
			{
				sqlMap.update("map.downHate",num);
				sqlMap.update("map.updateGood",num);
				request.setAttribute("statusCnt",new Integer(1));
			}		
			sqlMap.update("map.updateGandH",cnt);
		}
		if(check==0)
		{
			if(cnt==0)
			{
				sqlMap.update("map.updateGood",num);
				sqlMap.insert("map.insertGandH",ghDto);
			}
			if(cnt==1)
			{
				sqlMap.update("map.updateHate",num);
				sqlMap.insert("map.insertGandH",ghDto);
			}
		}
		return  "/map/status.jsp";
	}
	

}
