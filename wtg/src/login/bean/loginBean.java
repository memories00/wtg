package login.bean;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;



@Controller
public class loginBean
{
	@Autowired
	private SqlMapClientTemplate sqlMap;
	
	@RequestMapping("/main.nhn")
	public String move()
	{
		return  "/login/logintest.jsp";
	}
	@RequestMapping("/login.nhn")
	public String login(HttpServletRequest request, String token)
	{

		Object memInfo = "";
		request.setAttribute("token",token);
		
		System.out.println("java");
		
		return  "/login/login.jsp";
	}
	
	@RequestMapping("/map.nhn")
	public String map()
	{
		return  "/map/map.jsp";
		
	}
	
	@RequestMapping("/search/search.nhn")
	public String search(HttpServletRequest request, String keyword)
	{
		request.setAttribute("keyword", keyword);
		return "/search/searchPage.jsp";
	}
}
