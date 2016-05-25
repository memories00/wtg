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
	
	@RequestMapping("/inputForm.nhn")
	public String inputForm(){	
		
		return  "/map/inputForm.jsp";
	}
	@RequestMapping("/courseInput.nhn")
	public String courseInput(){	
		
		return  "/map/courseInput.jsp";
	}
	@RequestMapping("/clickTest.nhn")
	public String clickTest()
	{	
		return  "/map/clickTest.jsp";
	}
	@RequestMapping("/insertTable.nhn")
	public String insertTable(HttpServletRequest request,String[] basicName)
	{	
		mapDto dto=new mapDto();
		try 
		{
			request.setCharacterEncoding("EUC-KR");
			System.out.println("ghrdfa"+basicName[0]);	
			String arrayName[]=basicName[0].split(",");
			String testCate="������";
			String testId="namuda";    
			dto.setCategory(testCate);
			dto.setId(testId);
			for(int i=1;i<arrayName.length-1;i++)
			{
				String a[]=arrayName[i].split("/");
				if(i==1)
				{
					dto.setPass1name(a[0]);
					dto.setPass1xy(a[1]+"/"+a[2]);
				}
				if(i==2)
				{
					dto.setPass2name(a[0]);
					dto.setPass2xy(a[1]+"/"+a[2]);
				}
				if(i==3)
				{
					dto.setPass3name(a[0]);
					dto.setPass3xy(a[1]+"/"+a[2]);
				}
				if(i==4)
				{
					dto.setPass4name(a[0]);
					dto.setPass4xy(a[1]+"/"+a[2]);
				}
				if(i==5)
				{
					dto.setPass5name(a[0]);
					dto.setPass5xy(a[1]+"/"+a[2]);
				}
				if(i==arrayName.length-2)
				{
				sqlMap.insert("map.insertInfo", dto);	
				}
			}
		} 
		catch (Exception e) 
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return  "/map/nextStep.jsp";
	}
	
	
	
	@RequestMapping("/searchStation.nhn")
	public String searchStation(HttpServletRequest request,String start,String end)
	{	

		 ArrayList list=new ArrayList();
		searchStation station=new searchStation();
		String stnName=station.input2Station(start, end);
		stnName=stnName.substring(0, stnName.length()-1);
		String parseStn[]=stnName.split(",");
		//System.out.println(parseStn.length);
		for(int i =1; i<parseStn.length-1;i++)
		{
			//System.out.println("inputBefore"+parseStn[i]);
			String stnNum=station.searchStnNum(parseStn[i]);
			//System.out.println(stnNum);
			String stnPos=station.searchStnPos(stnNum);
			//System.out.println(stnPos);
			//System.out.println(parseStn[i]+"^"+stnPos+"/");
			list.add(parseStn[i]+"^"+stnPos+"/");
		}
		
		request.setAttribute("list",list);
			
		return  "/map/result.jsp";
	}
}
