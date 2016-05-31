package map;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;

public class TypeSearch {
	public String typeTitle(String typeId){   
	System.out.println("파싱"+typeId);
	   URL url;
	   String result="";	   
	   try{
			String responseType = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList"
					+ "?ServiceKey=qczVz%2FMEZtFm3v%2Fl4ofQvjR4rEtDWICqtPhpwhwGpzSk5Iwd8Wk%2BRvegrpM1W%2Foyd0TveGp7zjfDTCUve9cC9w%3D%3D"
					+ "&numOfRows=100"		 	/*한페이지결과수*/
					+ "&arrange=P"				/*정렬(O=제목순, P=조회순, Q=수정일순, R=생성일순)*/
					+ "&contentTypeId="+typeId	/*타입 ID*/
					+ "&areaCode=1"				/*지역코드(1=서울)*/
					+ "&MobileOS=ETC"			/*OS 구분*/
					+ "&MobileApp=WTG";			/*어플이름*/
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
		        { //System.out.println(i);
		          Element entry = (Element)nl.item(i);
		          
		          Element title = (Element)entry.getElementsByTagName("title").item(0);
		          result += title.getFirstChild().getNodeValue()+"--";
		          
		          Element mapX =(Element)entry.getElementsByTagName("mapx").item(0);
		          if(mapX == null){continue;}else{result += mapX.getFirstChild().getNodeValue()+"--"; }
		          
		          Element mapY = (Element)entry.getElementsByTagName("mapy").item(0);
		          if(mapY == null){continue;}else{result += mapY.getFirstChild().getNodeValue()+"--"; }
		          
		          Element addr1 = (Element)entry.getElementsByTagName("addr1").item(0);
		          if(addr1 == null){continue;}else{result += addr1.getFirstChild().getNodeValue()+"--"; }

		          Element addr2 =(Element)entry.getElementsByTagName("addr2").item(0);
		          if(addr2 == null){String a=" --"; result+=a;}else{result += addr2.getFirstChild().getNodeValue()+"--"; }
		          
		          Element firstimage2 = (Element)entry.getElementsByTagName("firstimage2").item(0);
		          if(firstimage2 == null){String a=" --"; result+=a;}else{result += firstimage2.getFirstChild().getNodeValue()+"--"; }
		          
		          Element tel = (Element)entry.getElementsByTagName("tel").item(0);
		          if(tel == null){result+=" ^^";}else{result += tel.getFirstChild().getNodeValue()+"^^"; }
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



