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
		try 
		{
			request.setCharacterEncoding("EUC-KR");
			//System.out.println(basicName[0]);	
			String arrayName[]=basicName[0].split(",");
			String testCate="������";
			String testId="namuda";    
			for(int i=0;i<arrayName.length;i++)
			{
				System.out.println(arrayName[i]);
			}
		} 
		catch (Exception e) 
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return  "/map/resultName.jsp";
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
