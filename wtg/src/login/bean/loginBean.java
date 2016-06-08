package login.bean;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.jdom.Document;
import org.jdom.Element;
import org.jdom.JDOMException;
import org.jdom.input.SAXBuilder;
import org.jdom.output.Format;
import org.jdom.output.XMLOutputter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;



@Controller
public class loginBean
{
	@Autowired
	private SqlMapClientTemplate sqlMap;
	
	@RequestMapping("/logout.nhn")
	public String logout(HttpSession session)
	{
		session.invalidate();
		
		return "/login/logout.jsp";
	}
	
	@RequestMapping("/login.nhn")
	public String login( LoginDTO ldto, JoinDTO jdto, HttpServletRequest request, String ac_token, String re_token, String mem_id, String mem_name, String mem_pro, String mem_thumb)
	{
		System.out.println("java");
		HttpSession session=request.getSession();
		HashMap log_map = new HashMap();
		HashMap join_map = new HashMap();
		
		if(mem_id != null)
		{
			int count = (Integer)sqlMap.queryForObject("mem.loginCheck", mem_id);
			
			if (count==1)
			{
				session.setAttribute("memId",mem_id);
				session.setAttribute("memName",mem_name);
				String sessId=(String)session.getAttribute("memId");
				System.out.println("loginsesdfs"+sessId);
				System.out.println(mem_id);
			}
			else
			{
				Timestamp reg  = new Timestamp(System.currentTimeMillis());
				
				log_map.put("id",mem_id);
				log_map.put("reg",reg);
				
				join_map.put("num",mem_id);
				join_map.put("id",mem_id);
				join_map.put("nickname",mem_name);
				join_map.put("profile",mem_pro);
				join_map.put("thumbnail",mem_thumb);
				join_map.put("reg",reg);
				
				sqlMap.insert("mem.login", log_map);
				sqlMap.update("mem.create", mem_id);
				sqlMap.insert("mem.join", join_map);
				session.setAttribute("memId", mem_id);
				session.setAttribute("memName", mem_name);
				System.out.println("join");
			}
		}
		
		System.out.println("ac_token: " + ac_token );
		System.out.println("id: " + mem_id );
		System.out.println("name: " + mem_name);
		
		request.setAttribute("acToken", ac_token);
		
		return  "/login/login.jsp";
	}
}