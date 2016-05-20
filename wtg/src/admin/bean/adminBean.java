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
import admin.bean.MemDTO;

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
	@RequestMapping("/testsql.nhn")
	public String testsql(HttpServletRequest request){
		List<SlideDTO> list = new ArrayList<SlideDTO>();
		list = sqlMap.queryForList("admin.testsql",null);
		request.setAttribute("list", list);
		return "/admin/testsql.jsp";
	}
	@RequestMapping("/member.nhn")
	public String member(HttpServletRequest request){
		List<MemDTO> list = new ArrayList<MemDTO>();
		list=sqlMap.queryForList("admin.member",null);
		request.setAttribute("list", list);
		return "/admin/member.jsp";
	}
	@RequestMapping("/memsearch.nhn")
	public String memsearch(HttpServletRequest request,MemDTO dto){
		List<MemDTO> list = new ArrayList<MemDTO>();
		String search=dto.getSearch();
		list=sqlMap.queryForList("admin.memsearch",search);
		
		request.setAttribute("list", list);
		return "/admin/member.jsp";
	}
	@RequestMapping("/memdelete.nhn")
	public String memdelete(HttpServletRequest request,MemDTO dto){
		List<MemDTO> list = new ArrayList<MemDTO>();
		String search=dto.getSearch();
		list=sqlMap.queryForList("admin.memsearch",search);
		
		String ch[]=request.getParameterValues("check");
		for(String c:ch)
		{
			sqlMap.delete("admin.memdelete",c);
		}
		request.setAttribute("list", list);
		return "/admin/memboard.jsp";
	}
	@RequestMapping("/memboard.nhn")
	public String memboard(HttpServletRequest request,MemDTO dto){
		List<MemDTO> list = new ArrayList<MemDTO>();		
		String ch[]=request.getParameterValues("check");
		for(String c:ch)
		{
			list=sqlMap.queryForList("admin.memsearch",c);
		}
		request.setAttribute("list", list);
		return "redirect:memboard.nhn";
	}
	@RequestMapping("/per.nhn")
	public String per(HttpServletRequest request,MemDTO dto){
		dto=(MemDTO) sqlMap.queryForObject("admin.per",null);
		request.setAttribute("dto", dto);
		return "/admin/personal.jsp";
	}
	@RequestMapping("/personal.nhn")
	public String personal(MemDTO dto){System.out.println(dto.getPer());
		sqlMap.update("admin.personal",dto);
		return "redirect:per.nhn";
	}
	
}
