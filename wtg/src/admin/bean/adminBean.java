package admin.bean;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import main.bean.SlideDTO;

@Controller
public class adminBean {
	@Autowired
	private SqlMapClientTemplate sqlMap;
	
	@RequestMapping("/admin.nhn")
	public String admin(HttpServletRequest request, HttpSession session)
	{
		return "/admin/admin.jsp";
	}
	
	@RequestMapping("/memAdmin.nhn")
	public String memInfoAdmin(HttpServletRequest request, HttpSession session)
	{
		return "/admin/memAdmin.jsp";
	}
	
	@RequestMapping("/memStatsAdmin.nhn")
	public String memStatsAdmin(HttpServletRequest request, HttpSession session)
	{
		return "/admin/memStatsAdmin.jsp";
	}
}
