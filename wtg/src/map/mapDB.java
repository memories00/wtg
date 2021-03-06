package map;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import theme.thDTO;

@Controller
public class mapDB 
{
	@Autowired
	private SqlMapClientTemplate sqlMap;
	
	
	@RequestMapping("/insertTable.nhn")
	public String insertTable(HttpServletRequest request,String cate,String[] basicName,String[] allTitle,String endStn){	
		mapDto dto=new mapDto();
		startDto sDto=new startDto();
		endDto eDto=new endDto();
		ArrayList list=new ArrayList();
		HttpSession session =request.getSession();
		String id=(String)session.getAttribute("memId");
		try 	{
			request.setCharacterEncoding("EUC-KR");
			
			//System.out.println(allTitle[0]);
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
			
			dto.setS_name(startTitle[0]);
			dto.setS_point(startDistance[3]);
			dto.setE_name(endTitle[0]);
			dto.setE_point(endDistance[3]);
			dto.setCategory(cate);
			dto.setId(id);
			int num=0;
			for(int i=1;i<arrayName.length-1;i++)	{
				String a[]=arrayName[i].split("/");
				String b[]=allTitle[0].split(",");
				//System.out.println(b[0]);
				String parseDis[]=b[i].split("/");
				//System.out.println(parseDis[0]);
				int distance=Integer.parseInt(parseDis[0]);
				//System.out.println(distance);
				int walkTime = distance / 67 | 0;
				
				list.add(a[0]+"/"+a[3]+"/"+a[4]+"/"+parseDis[1]+"/"+parseDis[0]+"/"+walkTime+"/");
				//System.out.println(walkTime);

				if(i==1){
					dto.setP1_name(a[0]);
					dto.setP1_point(a[1]+"^"+a[2]);
				}
				if(i==2){
					dto.setP2_name(a[0]);
					dto.setP2_point(a[1]+"^"+a[2]);
				}
				if(i==3){
					dto.setP3_name(a[0]);
					dto.setP3_point(a[1]+"^"+a[2]);
				}
				if(i==4){
					dto.setP4_name(a[0]);
					dto.setP4_point(a[1]+"^"+a[2]);
				}
				if(i==5){
					dto.setP5_name(a[0]);
					dto.setP5_point(a[1]+"^"+a[2]);
				}
				if(i==arrayName.length-2){
					
					sqlMap.insert("map.insertInfo", dto);	
					num=(Integer)sqlMap.queryForObject("map.getNum",null);
					sDto.setNum(num);
					sDto.setStartPlace(startTitle[0]);
					sDto.setStartAddress(startTitle[3]);
					sDto.setStartPhone(startTitle[4]);
					sDto.setStartStn(startDistance[1]);
					sDto.setStartDis(Integer.parseInt(startDistance[0]));
					sDto.setStartWT(stWalk);
					
					eDto.setNum(num);
					eDto.setEndPlace(endTitle[0]);
					eDto.setEndAddress(endTitle[3]);
					eDto.setEndPhone(endTitle[4]);
					eDto.setEndStn(endDistance[1]);
					eDto.setEndDis(Integer.parseInt(endDistance[0]));
					eDto.setEndWT(endWalk);
					
					sqlMap.insert("map.insertStartInfo", sDto);
					sqlMap.insert("map.insertEndInfo", eDto);
	
				}
			}
			
			if(list.size()>0)
			{
	
				for(int i=0;i<list.size();i++)
				{
					passDto pDto=new passDto();
					String listAll=list.get(i).toString();	
					String listStr[]=listAll.split("/");
					
					pDto.setNum(num);
					pDto.setPassPlace(listStr[0]);
					pDto.setPassAddress(listStr[1]);
					pDto.setPassPhone(listStr[2]);
					pDto.setPassStn(listStr[3]);
					pDto.setPassDis(Integer.parseInt(listStr[4]));
					pDto.setPassWT(Integer.parseInt(listStr[5]));
					
					sqlMap.update("map.insertPassInfo",pDto);
					
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
	public String  insertDB(HttpServletRequest request,String daumeditor,String subject,String hashtag) {	
		try {		
			thDTO dto=new thDTO();
			request.setCharacterEncoding("EUC-KR");
			int num=(Integer)sqlMap.queryForObject("map.getNum",null);
			//System.out.println(daumeditor);
		
			String parseStr=daumeditor.substring(3,daumeditor.indexOf("</p>"));
			//System.out.println(parseStr);
			dto.setNum(num);
			dto.setContent(parseStr);
			dto.setHashtag(hashtag);
			dto.setSubject(subject);
			System.out.println(num);
			
			sqlMap.insert("theme.createComment",num);//쓴글에대한 댓글 게시판 테이블을 생성
			sqlMap.update("map.inputContent",dto);
			
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return "/main.nhn";
	}
	
	
	@RequestMapping("/imageInsert.nhn" )
	public ModelAndView imageInsert(HttpServletRequest request, String filePath,String fileName ) throws Exception{//
	 
	String path= request.getRealPath("img");
	System.out.println("야호");
	System.out.println(path);
	 try {
		 String fpath = mapDB.class.getResource("").getPath();

		 

		   FileInputStream fis = new FileInputStream(fpath+filePath);
		   FileOutputStream fos = new FileOutputStream(path+"\\"+fileName);
		   
		   int data = 0;
		   while((data=fis.read())!=-1) {
		    fos.write(data);
		   }
		   fis.close();
		   fos.close();
		   
		  } catch (Exception e) {
		   // TODO Auto-generated catch block
		   e.printStackTrace();
		  }
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("path",path);
		mv.setViewName("/map/resultPage.jsp");
		
		return mv;
	}
	
	 @RequestMapping("/plase.nhn")
		public String plase(HttpServletRequest request,String totalName){	
		
		 mapDto dto=new mapDto();
		 int num=(Integer)sqlMap.queryForObject("map.getNum",null);
		 String m_image[]=totalName.split("@");
		 dto.setNum(num);
		 dto.setM_image(m_image[0]);
		 dto.setS_image(m_image[1]);
		 
		 sqlMap.update("map.inputImage",dto);
			return  "/map/courseInput.jsp";
		}

}
