package theme;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import main.bean.SearchDTO;
import main.bean.SlideDTO;


@Controller
public class Report {
	@Autowired
	private SqlMapClientTemplate sqlMapClientTemplate;
	
	@RequestMapping("/report.nhn")
	public String report(HttpServletRequest request,HttpSession session,String num){
		String id= (String)session.getAttribute("memId");
		int no=Integer.parseInt(num);
		System.out.println(id);
		request.setAttribute("id", id);
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
	public String reportList(HttpServletRequest request){
	    int currentPage =1;	
	    int totalCount; 		
		int blockCount = 10;	
		int blockPage = 5; 
		List<ReportDTO> list = new ArrayList<ReportDTO>();
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
	public String reportView(HttpServletRequest request,SearchDTO dto){
		dto = (SearchDTO)sqlMapClientTemplate.queryForObject("theme.selectView",dto.getNum());
		request.setAttribute("dto", dto);
		return "/theme/reportView.jsp";
	}
	
	@RequestMapping("/reportDel.nhn")
	public String reportDel(HttpServletRequest request,SearchDTO dto){
		sqlMapClientTemplate.update("theme.updateReadHit",dto.getNo());
		dto = (SearchDTO)sqlMapClientTemplate.queryForObject("theme.selectOne", dto.getNo());
		request.setAttribute("dto", dto);
		
		return "/theme/reportDel.jsp";
	}
	
	@RequestMapping("/reportDelete.nhn")
	public String delete(HttpServletRequest request,ThemeDTO dto, ReportDTO rto){

        String path =request.getServletContext().getRealPath("")+"\\save\\";
		dto = (ThemeDTO)sqlMapClientTemplate.queryForObject("theme.selectOne", dto.getNo());
		File file = new File(path+dto.getFile_savname());
		file.delete();
		int no=dto.getNo();
		int num=rto.getNum();
		sqlMapClientTemplate.update("theme.proTwo",num );
		sqlMapClientTemplate.delete("theme.deletetheme",no);
		

		request.setAttribute("dto", dto);
		return "redirect:reportList.nhn";
	}
	@RequestMapping("/reportcheck.nhn")
	public String reportcheck(HttpServletRequest request,ReportDTO dto){
		int num=dto.getNum();
		System.out.println(dto.getNum());
		dto = (ReportDTO)sqlMapClientTemplate.queryForObject("theme.selectView",num);
		request.setAttribute("dto", dto);
		sqlMapClientTemplate.update("theme.proOne",num);
		return "/theme/reportView.jsp";
	}
	@RequestMapping("/reportcom.nhn")
	public String reportcom(HttpServletRequest request,ReportDTO dto){
		System.out.println(dto.getNo());
		int num=dto.getNum();
		dto = (ReportDTO)sqlMapClientTemplate.queryForObject("theme.selectView",num);
		request.setAttribute("dto", dto);
		sqlMapClientTemplate.update("theme.proThree",num);
		return "redirect:reportList.nhn";
	}
}
