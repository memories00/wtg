package map;

import java.io.*;
import java.net.*;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.GregorianCalendar;

import javax.xml.parsers.*;
import org.w3c.dom.*;

public class Test {

	public static void main(String []args){
		Test.refreshEarthquakes();
	}
	private static void refreshEarthquakes() {
		  URL url;
		  try {
		    String quakeFeed = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList?ServiceKey=qczVz%2FMEZtFm3v%2Fl4ofQvjR4rEtDWICqtPhpwhwGpzSk5Iwd8Wk%2BRvegrpM1W%2Foyd0TveGp7zjfDTCUve9cC9w%3D%3D&areaCode=35&MobileOS=ETC&MobileApp=AppTesting ";
		    url = new URL(quakeFeed);
		         
		    URLConnection connection;
		    connection = url.openConnection();
		       
		    HttpURLConnection httpConnection = (HttpURLConnection)connection; 
		    int responseCode = httpConnection.getResponseCode(); 
		    System.out.println(responseCode);
		    if (responseCode == HttpURLConnection.HTTP_OK) { 
		      InputStream in = httpConnection.getInputStream(); 
		      DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
		      DocumentBuilder db = dbf.newDocumentBuilder();

		      // Parse the earthquake feed.
		      Document dom = db.parse(in);      
		      Element docEle = dom.getDocumentElement();
		      // Get a list of each earthquake entry.
		      NodeList nl = docEle.getElementsByTagName("item");
		      if (nl != null && nl.getLength() > 0) {
		        for (int i = 0 ; i < nl.getLength(); i++) {
		          Element entry = (Element)nl.item(i);
		          Element title = (Element)entry.getElementsByTagName("addr1").item(0);
		         
		          String details = title.getFirstChild().getNodeValue();
		          System.out.println(details);

		        }
		      }
		    }
		  } catch (Exception e) {
		    e.printStackTrace();
		  }finally {
		  }
		}	
}
