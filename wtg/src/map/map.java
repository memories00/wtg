package map;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import location.bean.MapDto;
import theme.MemCommentDTO;
import theme.thDTO;

@Controller
public class map
{
	@Autowired
	private SqlMapClientTemplate sqlMap;
	
	@RequestMapping("/courseInput.nhn")
	public String courseInput(HttpServletRequest request){	
		HttpSession session=request.getSession();
		//session.setAttribute("memId","test");
		String sessionId=(String)session.getAttribute("memId");
		
		return  "/map/courseInput.jsp";
	}
	@RequestMapping("/courseView.nhn")
	public String courseView(HttpServletRequest request,int num){	
		thDTO dto=new thDTO();
		startDto sDto=new startDto();
		endDto eDto=new endDto();
		List<passDto> list = new ArrayList<passDto>();
		
		HttpSession session=request.getSession();
		gAndHDto ghDto=new gAndHDto();
		//session.setAttribute("memId","test");
		String sessionId=(String)session.getAttribute("memId");
		
		ghDto.setNum(num);
		ghDto.setId(sessionId);
		
		int check=(Integer)sqlMap.queryForObject("map.checkGandH",ghDto);
		
		if(check==1)
		{
			int statusCnt=(Integer)sqlMap.queryForObject("map.getStatus",ghDto);
			request.setAttribute("statusCnt",statusCnt);
		}
		else
		{
			request.setAttribute("statusCnt",new Integer(2));
		}
		
		sqlMap.update("map.updateReadHit",num);//조회수 증가
		
		dto=(thDTO)sqlMap.queryForObject("map.getCourse",num);
		sDto=(startDto)sqlMap.queryForObject("map.startCourse",num);
		eDto=(endDto)sqlMap.queryForObject("map.endCourse",num);	
		list=sqlMap.queryForList("map.passCourse",num);
		
		String passInfo="";		

		if(dto.getP1_point()!=null){
			passInfo+=dto.getP1_name()+"/"+dto.getP1_point()+"@";
		}
		if(dto.getP2_point()!=null){
			passInfo+=dto.getP2_name()+"/"+dto.getP2_point()+"@";
		}
		if(dto.getP3_point()!=null){
			passInfo+=dto.getP3_name()+"/"+dto.getP3_point()+"@";
		}
		if(dto.getP4_point()!=null){
			passInfo+=dto.getP4_name()+"/"+dto.getP4_point()+"@";
		}
		if(dto.getP5_point()!=null){
			passInfo+=dto.getP5_name()+"/"+dto.getP5_point()+"^";
		}
		//System.out.println(passInfo);
		String s_imgArr[]=dto.getS_image().split("/");
		String imgNameArr[]=new String[4];
		ArrayList imageList=new ArrayList();
		List<MemCommentDTO>commentList=new ArrayList<MemCommentDTO>();
		
		for(int i=0;i<s_imgArr.length;i++)
		{
			if(!(s_imgArr[i].equals("default.jsp")))
			{
				imgNameArr[i]=s_imgArr[i];
				imageList.add(imgNameArr[i]);
			}
		}
		
		commentList=sqlMap.queryForList("theme.memCommentAll",num);//table에서 글의 댓글들을 가져옴
		
		request.setAttribute("commentList",commentList);
		request.setAttribute("dto",dto);
		request.setAttribute("sDto",sDto);
		request.setAttribute("eDto",eDto);
		request.setAttribute("list",list);
		request.setAttribute("passInfo",passInfo);
		request.setAttribute("s_name",dto.getS_name());
		request.setAttribute("s_point",dto.getS_point());
		request.setAttribute("e_name",dto.getE_name());
		request.setAttribute("e_point",dto.getE_point());
		request.setAttribute("imageList",imageList);
		
		return  "/map/viewCourse.jsp";
	}

	
	
}
