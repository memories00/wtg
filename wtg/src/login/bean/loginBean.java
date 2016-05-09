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
	public String move(String ac_token, String re_token, String mem_id, String mem_nickname, String pf_image)
	{
		System.out.println("ac_token: " + ac_token );
		System.out.println("re_token: " + re_token);
		System.out.println("id: " + mem_id);
		System.out.println("nickname: " + mem_nickname);
		System.out.println("pf_image: " + pf_image);
		
		
		
		
		return  "/login/logintest.jsp";
	}
	@RequestMapping("/login.nhn")
	public String login(HttpServletRequest request, String ac_token, String re_token, String mem_id, String mem_name, String mem_image)
	{
		System.out.println("java");
		
		System.out.println("ac_token: " + ac_token );
		System.out.println("re_token: " + re_token);
		System.out.println("id: " + mem_id );
		System.out.println("name: " + mem_name);
		System.out.println("image: " + mem_image );
		
		request.setAttribute("acToken", ac_token);
		request.setAttribute("reToken", re_token);
		
		return  "/login/login.jsp";
	}
}
