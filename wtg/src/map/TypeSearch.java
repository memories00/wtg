package map;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;

public class TypeSearch {
	public static String typeTitle(String typeId){   
System.out.println("�Ľ�"+typeId);
	   URL url;
	   String result="";	   
	   try{
			String responseType = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList"
					+ "?ServiceKey=qczVz%2FMEZtFm3v%2Fl4ofQvjR4rEtDWICqtPhpwhwGpzSk5Iwd8Wk%2BRvegrpM1W%2Foyd0TveGp7zjfDTCUve9cC9w%3D%3D"
					+ "&MobileOS=ETC"			/*OS ����*/
					+ "&MobileApp=WTG"			/*�����̸�*/
					+ "&contentTypeId="+typeId	/*Ÿ�� ID*/
					+ "&arrange=P"				/*����(O=�����, P=��ȸ��, Q=�����ϼ�, R=�����ϼ�)*/
					+ "&areaCode=1"				/*�����ڵ�(1=����)*/
					+ "&numOfRows=10"			/*�������������*/
					+ "&pageNo=1";				/*��������ȣ*/
			url = new URL(responseType);

        HttpURLConnection conn = (HttpURLConnection)url.openConnection();
        
        int responseCode = conn.getResponseCode();
//        System.out.println(responseCode);
        
	    if (responseCode == HttpURLConnection.HTTP_OK) 
	    { 
	      InputStream in = conn.getInputStream(); 
	      DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
	      DocumentBuilder db = dbf.newDocumentBuilder();

	      // Parse the earthquake feed.
	      Document dom = db.parse(in);      
	      Element docEle = dom.getDocumentElement();
	      // Get a list of each earthquake entry.
	      NodeList nl = docEle.getElementsByTagName("item");
	      if (nl != null && nl.getLength() > 0)
	      {
		        for (int i = 0 ; i < nl.getLength(); i++) 
		        {
		          Element entry = (Element)nl.item(i);
		          Element title = (Element)entry.getElementsByTagName("title").item(0);
		          Element mapX = (Element)entry.getElementsByTagName("mapx").item(0);
		          Element mapY = (Element)entry.getElementsByTagName("mapy").item(0);
		    //      System.out.println(mapX.getFirstChild().getNodeValue()+"/"+mapY.getFirstChild().getNodeValue());
	          
		          result += title.getFirstChild().getNodeValue()+"--"
		        		  +mapX.getFirstChild().getNodeValue()+"--"
		        		  +mapY.getFirstChild().getNodeValue()+"//";
		        }
	      } 
	    }        
	   }catch(Exception e){
		   e.printStackTrace();
	   }
	   System.out.println("URL PARSING RESULT = "+result);
	   return result;
   }
}



