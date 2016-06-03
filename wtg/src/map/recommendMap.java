package map;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import main.bean.SlideDTO;


@Controller
public class recommendMap {
	
	@Autowired
	private SqlMapClientTemplate sqlMap;
	
	@RequestMapping("/recommendMain.nhn")
	public String recommendMain(HttpServletRequest request){	
		HttpSession session=request.getSession();
		session.setAttribute("memId","test");
		
		return  "/map/recommendMain.jsp";
	}
	@RequestMapping("/recomCourse.nhn")
	public String recomCourse(HttpServletRequest request,int cnt){	

		System.out.println(cnt);
		if(cnt==1)
		{
			
		}
		if(cnt==2)
		{
			List<recommendDto> list = new ArrayList<recommendDto>();
			list=sqlMap.queryForList("map.history","¿ª»ç°ü±¤");
			mapDto dto=new mapDto();

			for(int i=1; i<6;i++)
			{
				recommendDto recDto=new recommendDto();
				 recDto=list.get(i);
				 if(i==1)
				 {
					 dto.setCategory(recDto.getCategory());
					 dto.setP1_name(recDto.getP1_name());
					 dto.setP1_point(recDto.getP1_point());
				 }
				 if(i==2)
				 {
					 dto.setCategory(recDto.getCategory());
					 dto.setP2_name(recDto.getP1_name());
					 dto.setP2_point(recDto.getP1_point());
				 }
				 if(i==3)
				 {
					 dto.setCategory(recDto.getCategory());
					 dto.setP3_name(recDto.getP1_name());
					 dto.setP3_point(recDto.getP1_point());
				 }
				 if(i==4)
				 {
					 dto.setCategory(recDto.getCategory());
					 dto.setP4_name(recDto.getP1_name());
					 dto.setP4_point(recDto.getP1_point());
				 }
				 if(i==5)
				 {
					 dto.setCategory(recDto.getCategory());
					 dto.setP5_name(recDto.getP1_name());
					 dto.setP5_point(recDto.getP1_point());
				 }

			}
			
			request.setAttribute("dto",dto);
		}
		if(cnt==3)
		{
		 
			
			
		}
		if(cnt==4)
		{
			
		}
		
		return  "/map/recomCourse.jsp";
	}
	

}
