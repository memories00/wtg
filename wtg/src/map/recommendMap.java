package map;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class recommendMap {
	
	@Autowired
	private SqlMapClientTemplate sqlMap;
	
	@RequestMapping("/recommendMain.nhn")
	public String recommendMain(HttpServletRequest request){	
		
		return  "/map/recommendMain.jsp";
	}
	@RequestMapping("/recomCourse.nhn")
	public String recomCourse(HttpServletRequest request,int cnt){	
		System.out.println(cnt);
		
		if(cnt==1)
		{
			
		}
		if(cnt==2)
		{
			
		}
		if(cnt==3)
		{
		 
			//List list=sqlMap.queryForList("rec.history",null);
			//request.setAttribute("list",list);
			//System.out.println(list.size());
		}
		if(cnt==4)
		{
			
		}
		
		return  "/map/recomCourse.jsp";
	}
	

}
