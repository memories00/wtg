package map;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import location.bean.MapDto;

@Controller
public class map
{
	@Autowired
	private SqlMapClientTemplate sqlMap;
	
	@RequestMapping("/courseInput.nhn")
	public String courseInput(){	
		
		return  "/map/courseInput.jsp";
	}
	@RequestMapping("/insertTable.nhn")
	public String insertTable(HttpServletRequest request,String[] basicName,String[] allTitle,String endStn){	
		mapDto dto=new mapDto();
		ArrayList list=new ArrayList();
		
		try 	{
			request.setCharacterEncoding("EUC-KR");
			//System.out.println(endStn);
			String testCate="스포츠";
			String testId="namuda";
			
			String parseTitle[]=allTitle[0].split(",");
			String startDistance[]=parseTitle[0].split("/");//startDistance[0] 출발지 근처역까지거리
			String endDistance[]=endStn.split("/");//endDistance[0] 도착지 근처역까지거리
			String returnName=basicName[0];
			String arrayName[]=basicName[0].split(",");
			  		
			String startTitle[]=arrayName[0].split("/");
			String endTitle[]=arrayName[arrayName.length-1].split("/");
			
			int stDtn=Integer.parseInt(startDistance[0]);
			int stWalk=stDtn/67| 0;
			
			int endDtn=Integer.parseInt(endDistance[0]);
			int endWalk=endDtn/67| 0;
			
			dto.setCategory(testCate);
			dto.setId(testId);
			
			for(int i=1;i<arrayName.length-1;i++)	{
				String a[]=arrayName[i].split("/");
				String b[]=allTitle[0].split(",");
				//System.out.println(b[0]);
				String parseDis[]=b[0].split("/");
				//System.out.println(parseDis[0]);
				int distance=Integer.parseInt(parseDis[0]);
				//System.out.println(distance);
				int walkTime = distance / 67 | 0;
				
				list.add(a[0]+"/"+a[3]+"/"+a[4]+"/"+parseDis[1]+"/"+parseDis[0]+"/"+walkTime+"/");
				//System.out.println(walkTime);

				if(i==1){
					dto.setP1_name(a[0]);
					dto.setP1_point(a[1]+"/"+a[2]);
				}
				if(i==2){
					dto.setP2_name(a[0]);
					dto.setP2_point(a[1]+"/"+a[2]);
				}
				if(i==3){
					dto.setP3_name(a[0]);
					dto.setP3_point(a[1]+"/"+a[2]);
				}
				if(i==4){
					dto.setP4_name(a[0]);
					dto.setP4_point(a[1]+"/"+a[2]);
				}
				if(i==5){
					dto.setP5_name(a[0]);
					dto.setP5_point(a[1]+"/"+a[2]);
				}
				if(i==arrayName.length-2){
				sqlMap.insert("map.insertInfo", dto);	
				}
			}		
			request.setAttribute("list",list);
			request.setAttribute("dto",dto);
			
			request.setAttribute("startDtc",startDistance[0]);
			request.setAttribute("startWalk",stWalk);
			request.setAttribute("startStn",startDistance[1]);
			request.setAttribute("startTitle",startTitle[0]);
			request.setAttribute("startPhone",startTitle[4]);
			request.setAttribute("startAddress",startTitle[3]);
			
			request.setAttribute("endDtc",endDistance[0]);
			request.setAttribute("endWalk",endWalk);
			request.setAttribute("endStn",endDistance[1]);
			request.setAttribute("endTitle",endTitle[0]);
			request.setAttribute("endPhone",endTitle[4]);
			request.setAttribute("endAddress",endTitle[3]);
			request.setAttribute("returnName",returnName);
		} 
		catch (Exception e) 	{
			e.printStackTrace();
		}
		return  "/map/nextStep.jsp";
	}

	@RequestMapping("/insertDB.nhn")
	public String insertDB(HttpServletRequest request,String daumeditor) {	
		try {
			request.setCharacterEncoding("EUC-KR");
			System.out.println(daumeditor);
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return "/main/main.jsp";
	}
	 @RequestMapping(value = "/imagePopup.nhn")
	    public String imagePopup(){     
		// System.out.println("dd");
	        return "daumeditor/image.jsp";
	    }
	
	
}
