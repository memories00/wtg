package map;
import java.io.*;
import java.net.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.GregorianCalendar;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import javax.xml.parsers.*;
import org.w3c.dom.*;
public class searchStation
{
	public static String input2Station(String start,String end) 
	{
		  URL url;
		  String result="";
		  try 
		  {
			  //String first = URLDecoder.decode(start,"UTF-8");
			  //String last = URLDecoder.decode(end, "UTF-8");
		    String responseStation = "http://swopenAPI.seoul.go.kr/api/subway/4b71584d6f6573633131314552586b5a/xml/shortestRoute/0/5/"+start+"/"+end;
		    url = new URL(responseStation);
		         
		    URLConnection connection;
		    connection = url.openConnection();
		       
		    HttpURLConnection httpConnection = (HttpURLConnection)connection; 
		    
		    int responseCode = httpConnection.getResponseCode(); 
		    //System.out.println(responseCode);
		    
		    if (responseCode == HttpURLConnection.HTTP_OK) 
		    { 
		      InputStream in = httpConnection.getInputStream(); 
		      DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
		      DocumentBuilder db = dbf.newDocumentBuilder();

		      // Parse the earthquake feed.
		      Document dom = db.parse(in);      
		      Element docEle = dom.getDocumentElement();
		      // Get a list of each earthquake entry.
		      NodeList nl = docEle.getElementsByTagName("row");
		      if (nl != null && nl.getLength() > 0)
		      {
			        for (int i = 0 ; i < nl.getLength(); i++) 
			        {
			          Element entry = (Element)nl.item(i);
			          Element title = (Element)entry.getElementsByTagName("shtStatnNm").item(0);
			         
			           result = title.getFirstChild().getNodeValue();
			           result=result.replaceAll("\\s", "");
			         // System.out.println("i2s"+result);
			        }
		      }
		    }
		  } 
		  catch (Exception e)
		  {
		    e.printStackTrace();
		  }
		  return result;
		}	
	
	public static String searchStnNum(String stnName) 
	{
		  URL url;
		  String result="";
		 // System.out.println("ssn"+stnName);
		  try 
		  {
			  String name = URLEncoder.encode(stnName,"UTF-8");
			 //System.out.println("ssn"+name); 
			  //String last = URLDecoder.decode(end, "UTF-8");
		    String responseStation = "http://openAPI.seoul.go.kr:8088/4b71584d6f6573633131314552586b5a/xml/SearchInfoBySubwayNameService/1/5/"+name;
		    url = new URL(responseStation);
		         
		    URLConnection connection;
		    connection = url.openConnection();
		       
		    HttpURLConnection httpConnection = (HttpURLConnection)connection; 
		    
		    int responseCode = httpConnection.getResponseCode(); 
		    //System.out.println(responseCode);
		    
		    if (responseCode == HttpURLConnection.HTTP_OK) 
		    { 
		      InputStream in = httpConnection.getInputStream(); 
		      DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
		      DocumentBuilder db = dbf.newDocumentBuilder();

		      // Parse the earthquake feed.
		      Document dom = db.parse(in);      
		      Element docEle = dom.getDocumentElement();
		      // Get a list of each earthquake entry.
		      NodeList nl = docEle.getElementsByTagName("row");
		      if (nl != null && nl.getLength() >0)
		      {
			        for (int i = 0 ; i <nl.getLength(); i++) 
			        {
			          Element entry = (Element)nl.item(i);
			          Element title = (Element)entry.getElementsByTagName("FR_CODE").item(0);
			         
			           result = title.getFirstChild().getNodeValue();
			          //System.out.println("ssnR"+result);
			        }
		      }
		    }
		  } 
		  catch (Exception e)
		  {
		    e.printStackTrace();
		  }
		  return result;
		}
	
	public static String searchStnPos(String stnNum) 
	{
		  URL url;
		  String result="";
		  //System.out.println(stnName);
		  try 
		  {
			 // int num =Integer.parseInt(stnNum);
			// System.out.println("¿©±â"+num); 
			  String num =  URLEncoder.encode(stnNum, "UTF-8");
		    String responseStation = "http://openAPI.seoul.go.kr:8088/4b71584d6f6573633131314552586b5a/xml/SearchSTNInfoByFRCodeService/1/5/"+num;
		    url = new URL(responseStation);
		         
		    URLConnection connection;
		    connection = url.openConnection();
		       
		    HttpURLConnection httpConnection = (HttpURLConnection)connection; 
		    
		    int responseCode = httpConnection.getResponseCode(); 
		    //System.out.println(responseCode);
		    
		    if (responseCode == HttpURLConnection.HTTP_OK) 
		    { 
		      InputStream in = httpConnection.getInputStream(); 
		      DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
		      DocumentBuilder db = dbf.newDocumentBuilder();

		      // Parse the earthquake feed.
		      Document dom = db.parse(in);      
		      Element docEle = dom.getDocumentElement();
		      // Get a list of each earthquake entry.
		      NodeList nl = docEle.getElementsByTagName("row");
		      if (nl != null && nl.getLength() > 0)
		      {
			        for (int i = 0 ; i < nl.getLength(); i++) 
			        {
			          Element entry = (Element)nl.item(i);
			          Element xPoint = (Element)entry.getElementsByTagName("XPOINT_WGS").item(0);
			          Element yPoint = (Element)entry.getElementsByTagName("YPOINT_WGS").item(0);
			         
			           result = xPoint.getFirstChild().getNodeValue()+","+yPoint.getFirstChild().getNodeValue();
			          //System.out.println(result);
			           
			        }
		      }
		    }
		  } 
		  catch (Exception e)
		  {
		    e.printStackTrace();
		  }
		  return result;
		}
	

}
