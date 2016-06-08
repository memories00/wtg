<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style type="text/css">

.hovergallery img{
-webkit-transform:scale(1.0); /*Webkit: Scale down image to 0.8x original size*/
-moz-transform:scale(1.0); /*Mozilla scale version*/
-o-transform:scale(1.1); /*Opera scale version*/
-webkit-transition-duration: 0.5s; /*Webkit: Animation duration*/
-moz-transition-duration: 0.5s; /*Mozilla duration version*/
-o-transition-duration: 0.5s; /*Opera duration version*/
opacity: 1; /*initial opacity of images*/
margin: 0 10px 5px 0; /*margin between images*/
}

.hovergallery img:hover{
-webkit-transform:scale(0.9); /*Webkit: Scale up image to 1.2x original size*/
-moz-transform:scale(0.9); /*Mozilla scale version*/
-o-transform:scale(0.9); /*Opera scale version*/
opacity: 0.8;
}

</style>



<div class="hovergallery">
<img src="/wtg/adminImg/160516010536c.jpg" />
<img src="2.jpg" width="200" height="200" />
<img src="3.jpg" width="200" height="200" />

</div>
