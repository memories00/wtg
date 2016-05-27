package theme;

import java.io.File;
import java.sql.Timestamp;
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


@Controller
public class theme {
	@Autowired
	private SqlMapClientTemplate sqlMapClientTemplate;
	
	@RequestMapping("/themeList.nhn")
	public String themeList(HttpSession session, HttpServletRequest request){
		String id= (String)session.getAttribute("memId");
		String name = (String)session.getAttribute("memName");
		String a =request.getParameter("a");
		
		System.out.println(id);
		System.out.println(name);
		
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
			list = sqlMapClientTemplate.queryForList("theme.selectAll", null);
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
		
		return "/theme/themeList.jsp";
	}
	
	@RequestMapping("/themeView.nhn")
	public String themeView(HttpServletRequest request,HttpSession session, ThemeDTO dto){
		int currentPage = Integer.parseInt(request.getParameter("currentPage"));
		String id= (String)session.getAttribute("memId");
		String name= (String)session.getAttribute("memName");
		
		System.out.println(id);
		System.out.println(name);
        
		sqlMapClientTemplate.update("theme.updateReadHit",dto.getNo());
	
		dto = (ThemeDTO)sqlMapClientTemplate.queryForObject("theme.selectOne", dto.getNo());
		
		request.setAttribute("dto", dto);
		request.setAttribute("currentPage", currentPage);
		
		
		//comment ¸®½ºÆ®
		
		return "/theme/themeView.jsp";
	}
	
	@RequestMapping("/themeWrite.nhn")
	public String boardWrite(HttpSession session, HttpServletRequest request){
		String id= (String)session.getAttribute("memId");
		int currentPage = Integer.parseInt(request.getParameter("currentPage"));
		request.setAttribute("currentPage", currentPage);
		return "/theme/themeWrite.jsp";
	}
	
	@RequestMapping("/themeWritePro.nhn")
	public String writePro(MultipartHttpServletRequest request,ThemeDTO dto){
		MultipartFile mf = request.getFile("save");
		String orgName = mf.getOriginalFilename();
		String path =request.getServletContext().getRealPath("")+"\\save\\";
		int num = 0;
	    if(orgName ==""){	
			sqlMapClientTemplate.insert("theme.insertTheme", dto);		
		}else{ 
			sqlMapClientTemplate.insert("theme.insertTheme", dto);
			dto = (ThemeDTO)sqlMapClientTemplate.queryForObject("theme.selectLastNo", null);
			String file_name = "file_"+dto.getNo();
			String file_ext = orgName.substring(
					         orgName.lastIndexOf('.') + 1,
					         orgName.length());
			dto.setFile_orgname(orgName);
			dto.setFile_savname(file_name+"."+file_ext);
			String savename=(file_name+"."+file_ext);
			
			
			File copy = new File(path+dto.getFile_savname());
			try{
				mf.transferTo(copy);
			}catch(Exception e){
				e.printStackTrace();
			}		
	}
	    sqlMapClientTemplate.update("theme.updateFile", dto);
		request.setAttribute("dto", dto);
		
		num = dto.getNo();
		sqlMapClientTemplate.update("theme.create", num);
		
		
		return "/themeList.nhn";
	}
	
	@RequestMapping("/del.nhn")
	public String delete(HttpServletRequest request,ThemeDTO dto){
        int no =Integer.parseInt(request.getParameter("no"));
        String path =request.getServletContext().getRealPath("")+"\\save\\";
		dto = (ThemeDTO)sqlMapClientTemplate.queryForObject("theme.selectOne", dto.getNo());
		
		File file = new File(path+dto.getFile_savname());
		file.delete();
		sqlMapClientTemplate.delete("theme.deleteTheme", dto);
		request.setAttribute("dto", dto);
	
		return "/themeList.nhn";
	}
	
	@RequestMapping("/themeM.nhn")
	public String modify(HttpServletRequest request, ThemeDTO dto){
		
		dto = (ThemeDTO)sqlMapClientTemplate.queryForObject("theme.selectOne", dto.getNo());
		request.setAttribute("dto", dto);
		
		return "/themeWrite.nhn";
	}
	
	@RequestMapping("/themeMP.nhn")
	public String modifyPro(MultipartHttpServletRequest request, ThemeDTO dto){
		
		MultipartFile mf = request.getFile("save");
		String orgName = mf.getOriginalFilename();
		String path =request.getServletContext().getRealPath("")+"\\save\\";
		if(orgName ==""){	
			sqlMapClientTemplate.update("theme.updateTheme", dto);		
		}else{  
			sqlMapClientTemplate.update("theme.updateTheme", dto);
			String file_name = "file_"+dto.getNo();
			String file_ext = orgName.substring(
					         orgName.lastIndexOf('.') + 1,
					         orgName.length());
			dto.setFile_orgname(orgName);
			dto.setFile_savname(file_name+"."+file_ext);

			File copy = new File(path+dto.getFile_savname());
			try{
				mf.transferTo(copy);
			}catch(Exception e){
				e.printStackTrace();
			}	
			File file = new File(path+dto.getFile_savname());
			file.delete();
	}
		sqlMapClientTemplate.update("theme.updateFile", dto);
		request.setAttribute("dto", dto);
		
		return "/themeView.nhn";
			
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
	public String sendComment(HttpSession session, CommentDTO a_dto, MemCommentDTO m_dto, String num, String id, String name, String text){
		
		Timestamp reg  = new Timestamp(System.currentTimeMillis());
		String nickname= (String)session.getAttribute("memName");
		
		System.out.println(nickname);
		
		a_dto.setBoard_Num(num);
		a_dto.setMem_Id(id);
		a_dto.setContent(text);
		a_dto.setReg(reg);
		
		m_dto.setNickname(nickname);
		m_dto.setId(id);
		m_dto.setContent(text);
		m_dto.setReg(reg);
		
		System.out.println(num);
		System.out.println(id);
		System.out.println(name);
		System.out.println(text);
		
		sqlMapClientTemplate.insert("theme.insertAllComment", a_dto);
		
		sqlMapClientTemplate.insert("theme.insertMemComment", m_dto);
		
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
//		System.out.println(info);
		return "/search/sample.jsp";
	}


}
