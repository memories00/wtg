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
public class pageAdminBean {
	
	@Autowired
	private SqlMapClientTemplate sqlMap;
	
	@RequestMapping("/pageAdmin.nhn")
	public String pageAdmin(HttpServletRequest request, HttpSession session)
	{
		return "/admin/pageAdmin.jsp";
	}
	
	@RequestMapping("/pageDesignAdmin.nhn")
	public String mainadmin(HttpSession session,HttpServletRequest request){
		List<SlideDTO> list = new ArrayList<SlideDTO>();
		list = sqlMap.queryForList("main.selectAll",null);
		List<SlideDTO> list2 = new ArrayList<SlideDTO>();
		list2 = sqlMap.queryForList("main.cateselect",null);
		request.setAttribute("list2", list2);
		request.setAttribute("list", list);

		return "/admin/fixPage.jsp";
	}
}
