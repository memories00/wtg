package main.bean;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.jdom.Document;
import org.jdom.Element;
import org.jdom.JDOMException;
import org.jdom.input.SAXBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import admin.bean.MemDTO;
import admin.bean.UserstatsDTO;
import main.bean.SlideDTO;
import theme.ThemeDTO;
import theme.reportPaging;
import theme.themePaging;

@Controller
public class mainBean 
{
	@Autowired
	private SqlMapClientTemplate sqlMap;
	
	@RequestMapping("/main.nhn")
	public String main(HttpSession session, HttpServletRequest request,UserstatsDTO dto) throws JDOMException, IOException
	{	
		String id=(String)session.getAttribute("memId");
		List<SlideDTO> list = new ArrayList<SlideDTO>();
		list = sqlMap.queryForList("main.selectAll",null);
		List<ThemeDTO> list2 = new ArrayList<ThemeDTO>();
		list2 = sqlMap.queryForList("main.cateselect",id);
		
		String logo=(String) sqlMap.queryForObject("admin.logocount", null);
		
		long time = System.currentTimeMillis(); 
		SimpleDateFormat y = new SimpleDateFormat("yy");
		String year = y.format(new Date(time));
		SimpleDateFormat m = new SimpleDateFormat("yyMM");
		String month = m.format(new Date(time));
		SimpleDateFormat d = new SimpleDateFormat("dd");
		String day = d.format(new Date(time));
		String yemoda=month+day;
		String stats=id+yemoda;
		
		dto.setId(id);
		dto.setYear(year);
		dto.setMonth(month);
		dto.setDay(day);
		dto.setYemoda(yemoda);
		dto.setStats(stats);
		
		if(id!=null)
		{
			int statscount=(Integer)sqlMap.queryForObject("admin.statsselect",dto);
		
			if(statscount==0)
			{
				sqlMap.insert("admin.statsinsert", dto);
			}
		}
		int count=(Integer)sqlMap.queryForObject("main.catecount", id);
		request.setAttribute("list2", list2);
		request.setAttribute("list", list);
		request.setAttribute("count", count);
		request.setAttribute("logo", logo);
		SAXBuilder builder = new SAXBuilder();
		Document doc=builder.build("C:/Users/user1/git/wtg/wtg/WebContent/main/get_today.xml");
		//Document doc=builder.build("C:/DATA/XML/get_today.xml");
		Element root=doc.getRootElement();
		List children = root.getChildren();
		
		List comment = sqlMap.queryForList("main.commentAll",null);
		request.setAttribute("comment", comment);
		
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
		return  "/main/main.jsp";
	}
	
	@RequestMapping("/main2.nhn")
	public String main()
	{
		return  "/main/main2.jsp";
	}
	@RequestMapping("/searchaction.nhn")
	public String searchaction(HttpServletRequest request,SearchDTO dto){
		int currentPage = 1;
		int totalCount;
		int blockCount =5;
		int blockPage = 5;
		String pagingHtml;
		reportPaging page;
		
		List<SearchDTO> searchlist = new ArrayList<SearchDTO>();
		List list=new ArrayList();
		String ch[]=request.getParameterValues("check");
		String search=dto.getSearch();
		System.out.println(search);
		
		if(ch==null)
		{
			System.out.println("체크를안함");
			searchlist=sqlMap.queryForList("admin.mainsearch",search);
			request.setAttribute("searchlist", searchlist);
			for(int i=0;i<searchlist.size();i++)
			{
				SearchDTO sdto=new SearchDTO();
				sdto=searchlist.get(i);
				sdto=(SearchDTO)sqlMap.queryForObject("admin.courselist", sdto.getNum());
				list.add(sdto);
			}
		}
		totalCount = list.size();
		
			
		if(request.getParameter("currentPage")!=null)
		{
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
			
		page = new reportPaging(currentPage, totalCount,blockCount, blockPage);
		pagingHtml = page.getPagingHtml().toString();

		int lastCount = totalCount;
			
		if (page.getEndCount() < totalCount)
		lastCount = page.getEndCount() + 1; 
		list = list.subList(page.getStartCount(), lastCount);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("pagingHtml", pagingHtml);
		request.setAttribute("page", page);
		request.setAttribute("list",list);

		return "/theme/searchlist.jsp";
	}
	@RequestMapping("/testsearch.nhn")
	public String testsearch(HttpSession session, HttpServletRequest request,UserstatsDTO dto) throws JDOMException, IOException
	{
		SAXBuilder builder = new SAXBuilder();
		//Document doc=builder.build("C:/Users/user1/git/wtg/wtg/WebContent/main/get_today.xml");
		Document doc=builder.build("C:/DATA/XML/get_today.xml");
		Element root=doc.getRootElement();
		List children = root.getChildren();
		
		List comment = sqlMap.queryForList("main.commentAll",null);
		request.setAttribute("comment", comment);
		
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
		return  "/main/testsearch.jsp";
	}
}