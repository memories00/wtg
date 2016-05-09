package login.bean;

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
		    String quakeFeed = "http://swopenapi.seoul.go.kr/api/subway/sample/xml/shortestRoute/0/5/%EC%86%8C%EC%9A%94%EC%82%B0/%EC%9E%A0%EC%8B%A4%EB%82%98%EB%A3%A8";
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
		      NodeList nl = docEle.getElementsByTagName("row");
		      if (nl != null && nl.getLength() > 0) {
		        for (int i = 0 ; i < nl.getLength(); i++) {
		          Element entry = (Element)nl.item(i);
		          Element title = (Element)entry.getElementsByTagName("shtStatnNm").item(0);
		         
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
