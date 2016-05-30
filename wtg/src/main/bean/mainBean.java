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
		
		int statscount=(Integer)sqlMap.queryForObject("admin.statsselect",dto);
		
		if(statscount==0){
			sqlMap.insert("admin.statsinsert", dto);
		}
		
		int count=(Integer)sqlMap.queryForObject("main.catecount", id);
		request.setAttribute("list2", list2);
		request.setAttribute("list", list);
		request.setAttribute("count", count);
		System.out.println(count);
		SAXBuilder builder = new SAXBuilder();
		Document doc=builder.build("C:/Users/user1/git/wtg/wtg/WebContent/main/get_today.xml");
		//C:/DATA/XML/get_today.xml
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
		return  "/main/main.jsp";
	}
	
	@RequestMapping("/main2.nhn")
	public String main()
	{
		return  "/main/main2.jsp";
	}
	@RequestMapping("/testsearch.nhn")
	public String testsearch(){
		return "/main/testsearch.jsp";
	}
	@RequestMapping("/searchaction.nhn")
	public String searchaction(HttpServletRequest request,SlideDTO dto){
		List<SlideDTO> list = new ArrayList<SlideDTO>();
		List<SlideDTO> listou = new ArrayList<SlideDTO>();
		List<SlideDTO> listts = new ArrayList<SlideDTO>();
		List<SlideDTO> listst = new ArrayList<SlideDTO>();
		List<SlideDTO> listsin = new ArrayList<SlideDTO>();
		List<SlideDTO> listga = new ArrayList<SlideDTO>();
		List<SlideDTO> listhat = new ArrayList<SlideDTO>();
		
		String ch[]=request.getParameterValues("check");
		String search=dto.getSearch();
		System.out.println(search);
		if(ch==null){
			System.out.println("체크를안함");
			list=sqlMap.queryForList("main.testsearch",search);
			request.setAttribute("list", list);
		}
		else{
			for(String c:ch)
			{
				System.out.println(c);
				if(c.equals("1")){
					listou=sqlMap.queryForList("main.searchou",search);
					request.setAttribute("listou", listou);
					System.out.println("일이다");
				}
				else if(c.equals("2")){
					listts=sqlMap.queryForList("main.searchts",search);
					request.setAttribute("listts", listts);
					System.out.println("이다");
				}
				else if(c.equals("3")){
					listst=sqlMap.queryForList("main.searchst",search);
					request.setAttribute("listst", listst);
					System.out.println("삼이다");
				}
				else if(c.equals("4")){
					listsin=sqlMap.queryForList("main.searchsin",search);
					request.setAttribute("listsin", listsin);
					System.out.println("사다");
				}
				else if(c.equals("5")){
					listga=sqlMap.queryForList("main.searchga",search);
					request.setAttribute("listga", listga);
					System.out.println("오다");
				}
				else if(c.equals("6")){
					listhat=sqlMap.queryForList("main.searchhat",search);
					request.setAttribute("listhat", listhat);
					System.out.println("육이다");
				}
			}
		}
		return "/main/testsearch.jsp";
	}
}
