package login.bean;

import java.io.IOException;
import java.sql.Timestamp;
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
	
	@RequestMapping("/main.nhn")
	public String move(HttpServletRequest request) throws JDOMException, IOException
	{	
		SAXBuilder builder = new SAXBuilder();
		Document doc=builder.build("C:/DATA/XML/get_today.xml");
		Element root=doc.getRootElement();
		List children = root.getChildren();
		
		for(int i=0;i<children.size();i++)
		{
			Element e =(Element)children.get(i);
			String tagName = e.getName();
			
			if(tagName.equals("state_ko")) // 지역
			{request.setAttribute("state_ko", e.getValue());}
			
			else if(tagName.equals("temp")) // 현재온도
			{request.setAttribute("temp", e.getValue());}
			
			else if(tagName.equals("max_temp")) // 최고온도
			{request.setAttribute("max_temp", e.getValue());}
			
			else if(tagName.equals("min_temp")) // 최저온도
			{request.setAttribute("min_temp", e.getValue());}
			
			else if(tagName.equals("wtext")) //
			{request.setAttribute("wtext", e.getValue());}
			
			else if(tagName.equals("icon")) // 아이콘
			{request.setAttribute("icon", e.getValue());}
			
			else if(tagName.equals("pm10")) // 미세먼지
			{request.setAttribute("pm10", e.getValue());}
		}	
		
		return  "/login/logintest.jsp";
	}
	
	@RequestMapping("/logout.nhn")
	public String logout(HttpSession session)
	{
		session.invalidate();
		
		return "/login/logout.jsp";
	}
	
	@RequestMapping("/login.nhn")
	public String login(HttpSession session, LoginDTO dto ,HttpServletRequest request, String ac_token, String re_token, String mem_id, String mem_name, String mem_image)
	{
		System.out.println("java");
		
		if(mem_id != null)
		{
			int count = (Integer)sqlMap.queryForObject("mem.loginCheck", mem_id);
			
			if (count==1)
			{
				session.setAttribute("memId", mem_id);
				System.out.println("login");
				System.out.println(mem_id);
			}
			else
			{
				Timestamp reg  = new Timestamp(System.currentTimeMillis());
				dto.setId(mem_id);
				dto.setReg(reg);
				sqlMap.insert("mem.join", dto);
				session.setAttribute("memId", mem_id);
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