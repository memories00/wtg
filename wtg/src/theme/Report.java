package theme;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class Report {
	@Autowired
	private SqlMapClientTemplate sqlMapClientTemplate;
	
	@RequestMapping("/report.nhn")
	public String report(HttpServletRequest request,HttpSession session){
		String id= (String)session.getAttribute("memId");
		int no=Integer.parseInt(request.getParameter("no"));
		request.setAttribute("no",no);
		return "/theme/report.jsp";
	}
	
	@RequestMapping("/reportP.nhn")
	public String reportP(HttpServletRequest request, ReportDTO dto){
		sqlMapClientTemplate.insert("theme.insertReport",dto);
		request.setAttribute("dto", dto);
		return "/theme/reportP.jsp";
	}
	
	@RequestMapping("/reportList.nhn")
	public String reportList(HttpSession session,HttpServletRequest request){
		String id= (String)session.getAttribute("memId");
	    int currentPage =1;	
	    int totalCount; 		
		int blockCount = 10;	
		int blockPage = 5; 
		List list;
		String pagingHtml; 	
		reportPaging page; 	
		
		list = sqlMapClientTemplate.queryForList("theme.selectReport", null);
        
		totalCount = list.size(); 
		
		if(request.getParameter("currentPage")!=null)
		{
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
			
		page = new reportPaging(currentPage, totalCount, blockCount, blockPage);
		pagingHtml = page.getPagingHtml().toString();
		
		int lastCount = totalCount;
		
		if (page.getEndCount() < totalCount)
			lastCount = page.getEndCount() + 1;

		list = list.subList(page.getStartCount(), lastCount);
        
        request.setAttribute("currentPage", currentPage);
        request.setAttribute("pagingHtml", pagingHtml);
        request.setAttribute("page", page);
        request.setAttribute("list", list);
		
		return "/theme/reportList.jsp";
	}
	
	@RequestMapping("/reportView.nhn")
	public String reportView(HttpServletRequest request,ReportDTO dto){
		dto = (ReportDTO)sqlMapClientTemplate.queryForObject("theme.selectView",dto.getNum());
		sqlMapClientTemplate.update("theme.proOne", dto.getNum());
		request.setAttribute("dto", dto);
		return "/theme/reportView.jsp";
	}
	
	@RequestMapping("/reportDel.nhn")
	public String reportDel(HttpServletRequest request,ThemeDTO dto,ReportDTO rto){
		sqlMapClientTemplate.update("theme.updateReadHit",dto.getNo());
		dto = (ThemeDTO)sqlMapClientTemplate.queryForObject("theme.selectOne", dto.getNo());
		request.setAttribute("dto", dto);
		request.setAttribute("rto", rto);
		return "/theme/reportDel.jsp";
	}
	
	@RequestMapping("/reportDelete.nhn")
	public String delete(HttpServletRequest request,ThemeDTO dto, ReportDTO rto){
        int no =Integer.parseInt(request.getParameter("no"));
        int num =Integer.parseInt(request.getParameter("num"));
        String path =request.getServletContext().getRealPath("")+"\\save\\";
		dto = (ThemeDTO)sqlMapClientTemplate.queryForObject("theme.selectOne", dto.getNo());
		File file = new File(path+dto.getFile_savname());
		file.delete();
		sqlMapClientTemplate.delete("theme.deletetheme", dto);
		sqlMapClientTemplate.update("theme.proTwo", rto.getNum());

		request.setAttribute("dto", dto);
	
		return "/reportList.nhn";
	}
}
