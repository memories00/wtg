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
		System.out.println("dd");
		return  "/login/logintest.jsp";
	}
	@RequestMapping("/login.nhn")
	public String login(HttpServletRequest request,String code,String state)
	{
		request.setAttribute("code",code);
		request.setAttribute("state",state);
		return  "/login/login.jsp";
	}

}