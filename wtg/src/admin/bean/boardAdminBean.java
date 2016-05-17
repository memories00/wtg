package admin.bean;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class boardAdminBean {

	@Autowired
	private SqlMapClientTemplate sqlMap;

	@RequestMapping("/boardAdmin.nhn")
	public String boardAdmin(HttpServletRequest request, HttpSession session)
	{
		return "/admin/boardAdmin.jsp";
	}
	
	@RequestMapping("/boardReportAdmin.nhn")
	public String boardReportAdmin(HttpServletRequest request, HttpSession session)
	{
		return "/admin/boardReportAdmin.jsp";
	}
	
	@RequestMapping("/boardReplyAdmin.nhn")
	public String boardReplyAdmin(HttpServletRequest request, HttpSession session)
	{
		return "/admin/boardReplyAdmin.jsp";
	}
}
