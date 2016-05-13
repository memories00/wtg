package admin.bean;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class adminBean {
	@Autowired
	private SqlMapClientTemplate sqlMap;
	
	@RequestMapping("/memAdmin.nhn")
	public String memAdmin(HttpServletRequest request, HttpSession session)
	{
		return "/admin/memAdmin.jsp";
	}
}
