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
	public String login(HttpServletRequest request,String code,String state)
	{
		request.setAttribute("code",code);
		request.setAttribute("state",state);
		return  "/login/login.jsp";
	}
	
	@RequestMapping("/map.nhn")
	public String map()
	{
		return  "/map/map.jsp";
	}
	@RequestMapping("/transTest.nhn")
	public String transTest()
	{
		return  "/map/transTest.jsp";
	}
	
	@RequestMapping("/total.nhn")
	public String total()
	{
		return  "/map/total.jsp";
	}
	
	@RequestMapping("/test.nhn")
	public String test()
	{
		return  "/map/test.xml";
	}
	@RequestMapping("/clickTest.nhn")
	public String clickTest()
	{
		return  "/map/clickTest.jsp";
	}

}
