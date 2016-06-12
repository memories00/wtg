package theme;

import java.io.File;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import map.TypeSearch;
import map.recommendDto;

 
@Controller
public class theme {
	@Autowired
	private SqlMapClientTemplate sqlMapClientTemplate;
	
	@RequestMapping("/themeList.nhn")
	public String themeList(HttpSession session, HttpServletRequest request){
		String a =request.getParameter("a");
		String category = request.getParameter("cate");
		int currentPage = 1;
		int totalCount;
		int blockCount =5;
		int blockPage = 5;
		List list = null;
		String pagingHtml;
		themePaging page;
		int aa = 0; 
		if(a!=null){
			aa = Integer.parseInt(a);
		}
		if(aa==1){
			list = sqlMapClientTemplate.queryForList("theme.selectR", null);	
		}else if(aa==2){
			list = sqlMapClientTemplate.queryForList("theme.selectG", null);
		}else{
			list = sqlMapClientTemplate.queryForList("theme.selectCategory", category);
		}
		
		totalCount = list.size();
		
		if(request.getParameter("currentPage")!=null)
		{
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		page = new themePaging(currentPage, totalCount,blockCount, blockPage, aa);
		pagingHtml = page.getPagingHtml().toString();
		
		int lastCount = totalCount;
		
		if (page.getEndCount() < totalCount)
			lastCount = page.getEndCount() + 1; 
		list = list.subList(page.getStartCount(), lastCount);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("pagingHtml", pagingHtml);
		request.setAttribute("page", page);
		request.setAttribute("list", list);
		request.setAttribute("category", category);
		
		return "/theme/themeList.jsp";
	}
	
	@RequestMapping("/good.nhn")
	public String good(HttpSession session, HttpServletRequest request, ThemeDTO dto, GoodDTO gto){
		String id= (String)session.getAttribute("memId");
		gto.setId(id);
		gto.setNo(dto.getNo());
	    int ctGood = (int)sqlMapClientTemplate.queryForObject("theme.ctGood", gto);
	    int ctHate = (int)sqlMapClientTemplate.queryForObject("theme.ctHate", gto);
		if(ctGood==0 && ctHate==0){
			sqlMapClientTemplate.insert("theme.insertGood", gto);
			sqlMapClientTemplate.update("theme.updateGood", dto.getNo());	
		}else if(ctGood==1){
			sqlMapClientTemplate.delete("theme.delGood", gto);
			sqlMapClientTemplate.update("theme.downGood", dto.getNo());	
		}
		int good = (Integer)sqlMapClientTemplate.queryForObject("theme.selectGood", dto.getNo());
		request.setAttribute("good", good);
		request.setAttribute("ctGood", ctGood);
		request.setAttribute("ctHate", ctHate);
		return "/theme/good.jsp";
	}
	@RequestMapping("/hate.nhn")
	public String hate(HttpSession session, HttpServletRequest request, ThemeDTO dto, GoodDTO gto){
		String id= (String)session.getAttribute("memId");
		gto.setId(id);
		gto.setNo(dto.getNo());
		int ctGood = (int)sqlMapClientTemplate.queryForObject("theme.ctGood", gto);
	    int ctHate = (int)sqlMapClientTemplate.queryForObject("theme.ctHate", gto);
		if(ctGood==0 &&ctHate==0){
			sqlMapClientTemplate.insert("theme.insertHate", gto);
			sqlMapClientTemplate.update("theme.updateHate", dto.getNo());	
		}else if(ctHate==1){
			sqlMapClientTemplate.delete("theme.delHate", gto);
			sqlMapClientTemplate.update("theme.downHate", dto.getNo());	
		}
		int hate = (Integer)sqlMapClientTemplate.queryForObject("theme.selectHate", dto.getNo());
		request.setAttribute("hate", hate);
		request.setAttribute("ctGood", ctGood);
		request.setAttribute("ctHate", ctHate);
		return "/theme/hate.jsp";
	}
	
	@RequestMapping("/sendComment.nhn")
	public String sendComment(HttpSession session, CommentDTO a_dto, String num, String id, String text){
		
		HashMap m_map = new HashMap();
		
		Timestamp reg  = new Timestamp(System.currentTimeMillis());
		String nickname= (String)session.getAttribute("memName");
		
		System.out.println(nickname);
		
		a_dto.setBoard_num(num);
		a_dto.setMem_id(id);
		a_dto.setContent(text);
		a_dto.setReg(reg);
		
		m_map.put("num", num);
		m_map.put("id", id);
		m_map.put("nickname", nickname);
		m_map.put("content", text);
		m_map.put("reg", reg);
		
		System.out.println(num);
		System.out.println(id);
		System.out.println(text);
		
		sqlMapClientTemplate.insert("theme.insertAllComment", a_dto);
		
		sqlMapClientTemplate.insert("theme.insertMemComment", m_map);
		
		return "/theme/sendComment.jsp";
	}
 
	
	@RequestMapping("/typeMap.nhn")
	public String tMap()
	{
		return "/search/typeMap.jsp";
	}
	
	@RequestMapping("/typeSearch.nhn")
	public String type(HttpServletRequest request, String typeId)
	{
		System.out.println("ºó"+typeId);
		TypeSearch ty = new TypeSearch();
		String info = ty.typeTitle(typeId);			
		request.setAttribute("info", info);
		return "/search/sample.jsp";
	}
	@RequestMapping("/deleteCom.nhn")
	public void deleteCom(HttpServletRequest request,int num,String content)
	{
		HashMap m_map = new HashMap();
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("memId");
		
		m_map.put("num", num);
		m_map.put("id", id);
		m_map.put("content", content);
		
		sqlMapClientTemplate.delete("theme.deleteComment",m_map);
	
	}

	
	
	@RequestMapping("/selectBest.nhn")
	public String best()
	{
		return "/theme/selectBest.jsp";
	}
	
	@RequestMapping("/searchBest.nhn")
	public String sBest(HttpServletRequest request, String op, recommendDto rdto)
	{
		List list = null;	
		list = sqlMapClientTemplate.queryForList("map.history", op);
		request.setAttribute("list", list);
		return "/theme/result.jsp";
	}

}
