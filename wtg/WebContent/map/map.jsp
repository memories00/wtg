<%@ page language="java" contentType="text/html; charset=EUC-KR" 
    pageEncoding="EUC-KR"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
 <head> 
<meta charset="utf-8"/> 
<title>Daum 지도 시작하기</title> 
</head> 
 <body> 
 
<div ID="theLayer" style="WIDTH:330px; POSITION:absolute; HEIGHT:183px; LEFT:230; TOP:35;DISPLAY:block;z-index:1;">
    <div>    
        <div id="titleBar" style="width:50px; height:10px; background:#000000;cursor:move; color:#FFFFFF; float:left;"> 
            이동
        </div>
        <div style="width:50px; height:10px; background:#000000; color:#ffffff; float:left;"><a href="#" onclick="div_close()" onkeypress="this.onClick()"></a>&nbsp;</div>
    </div>
    <div style="width:330px; height:200px; background:#CCCCCC;"></div>
</div>

<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=06fa7b42a2af7b8c46c9ca9a71d40206"></script> 
<script> 
	


<script>
 isIE=document.all;
 isNN=!document.all&&document.getElementById;
 isN4=document.layers;
 isHot=false;

 function ddInit(e){
  topDog=isIE ? "BODY" : "HTML";
  whichDog=isIE ? document.all.theLayer : document.getElementById("theLayer");
  hotDog=isIE ? event.srcElement : e.target;
  while (hotDog.id!="titleBar"&&hotDog.tagName!=topDog){
   hotDog=isIE ? hotDog.parentElement : hotDog.parentNode;
  }
  if (hotDog.id=="titleBar"){
   offsetx=isIE ? event.clientX : e.clientX;
   offsety=isIE ? event.clientY : e.clientY;
   nowX=parseInt(whichDog.style.left);
   nowY=parseInt(whichDog.style.top);
   ddEnabled=true;
   document.onmousemove=dd;
  }
 }

 function dd(e){
  if (!ddEnabled) return;
  whichDog.style.left=isIE ? nowX+event.clientX-offsetx : nowX+e.clientX-offsetx;
  whichDog.style.top=isIE ? nowY+event.clientY-offsety : nowY+e.clientY-offsety;
  return false;
 }

 document.onmousedown=ddInit;
 document.onmouseup=Function("ddEnabled=false");

</script> 
 	 
 	
 </body> 
 </html>    
