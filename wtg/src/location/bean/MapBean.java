package location.bean;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MapBean {
	@Autowired
	private SqlMapClientTemplate sqlMap;
	
	
	@RequestMapping("/search/searchTest.nhn")
	public String search(HttpServletRequest request, String keyword)
	{
		request.setAttribute("keyword", keyword);
		return "/search/searchTest.nhn";
	} 
	 
	@RequestMapping("/search/searchPage.nhn")
	public String searchPage(HttpServletRequest request, String keyword)
	{
		request.setAttribute("keyword", keyword);
		return "/search/searchPage.jsp";
	}
		
	@RequestMapping("/search/insertMap.nhn")
	public String insertMap(HttpServletRequest request, MapDto dto)
	{
		sqlMap.insert("insertMap", dto);
		System.out.println(dto);
		request.setAttribute("dto", dto);
		return "/search/insertOK.jsp";
	}
	

	
	
}
