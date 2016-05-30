package admin.bean;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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
	@RequestMapping("/userstats.nhn")
	public String userstats(){

		return "/admin/userstats.jsp";
	}
	@RequestMapping("/oneday.nhn")
	public String oneday(HttpServletRequest request){
		long time = System.currentTimeMillis(); 
		SimpleDateFormat d = new SimpleDateFormat("dd");
		String day = d.format(new Date(time));
		int daycount=(Integer)sqlMap.queryForObject("admin.selectoneday",day);
		request.setAttribute("daycount",daycount);

		return "/admin/userstats.jsp";
	}
	@RequestMapping("/month.nhn")
	public String month(HttpServletRequest request){
		long time = System.currentTimeMillis(); 
		SimpleDateFormat y = new SimpleDateFormat("yy");
		String year = y.format(new Date(time));
		
		String one=year+"01";String two=year+"02";String thr=year+"03";String four=year+"04";
		String fiv=year+"05";String six=year+"06";String sev=year+"07";String eig=year+"08";
		String nin=year+"09";String ten=year+"10";String ele=year+"11";String twe=year+"12";
		
		int onecount=(Integer)sqlMap.queryForObject("admin.onecount",one);
		int twocount=(Integer)sqlMap.queryForObject("admin.twocount",two);
		int thrcount=(Integer)sqlMap.queryForObject("admin.thrcount",thr);
		int fourcount=(Integer)sqlMap.queryForObject("admin.fourcount",four);
		int fivcount=(Integer)sqlMap.queryForObject("admin.fivcount",fiv);
		int sixcount=(Integer)sqlMap.queryForObject("admin.sixcount",six);
		int sevcount=(Integer)sqlMap.queryForObject("admin.sevcount",sev);
		int eigcount=(Integer)sqlMap.queryForObject("admin.eigcount",eig);
		int nincount=(Integer)sqlMap.queryForObject("admin.nincount",nin);
		int tencount=(Integer)sqlMap.queryForObject("admin.tencount",ten);
		int elecount=(Integer)sqlMap.queryForObject("admin.elecount",ele);
		int twecount=(Integer)sqlMap.queryForObject("admin.twecount",twe);
		
		
		request.setAttribute("onecount",onecount);request.setAttribute("twocount",twocount);
		request.setAttribute("thrcount",thrcount);request.setAttribute("fourcount",fourcount);
		request.setAttribute("fivcount",fivcount);request.setAttribute("sixcount",sixcount);
		request.setAttribute("sevcount",sevcount);request.setAttribute("eigcount",eigcount);
		request.setAttribute("nincount",nincount);request.setAttribute("tencount",tencount);
		request.setAttribute("elecount",elecount);request.setAttribute("twecount",twecount);
		
		return "/admin/userstats.jsp";
	}
	@RequestMapping("/allday.nhn")
	public String allday(HttpServletRequest request){
		int allcount=(Integer)sqlMap.queryForObject("admin.allcount",null);
		request.setAttribute("allcount", allcount);
		return "/admin/userstats.jsp";
	}
}
