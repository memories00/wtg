<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html>
<head>
	<style>
     
    /* css */
    .header {
        background-image: none;
        background-color: #027dfc;
    }
     
    /* ����÷��(.file) */
    .file {
        display: inline-block;
        margin-top: 8px;
        overflow: hidden;
    }
     
    .file .file-text {
        display: inline-block;
        padding: 6px 10px 8px 10px;
        border : 1px solid #c7c7c7;
        width: 179px;
        font-size: 14px;
        color: #8a8a8a;
        float: left;
    }
     
    .file .file-text:FOCUS {
        border-color: #54c4e5;
        outline: 0;
        -webkit-box-shadow: inset 0px 1px 1px rgba(0,0,0,0.075), 0px 0px 8px rgba(102,175,233,0.6);
        box-shadow: inset 0px 1px 1px rgba(0,0,0,0.075), 0px 0px 8px rgba(102,175,233,0.6);
    }
     
    .file .file-btn {
        margin-left: 2px;
        padding: 6px 8px 4px 8px;
        height: 20px;
        line-height: 20px;
        font-size: 12px;
        font-weight: bold;
        background-color: #fff;
        border: 1px solid #989898;
        color: #989898;
        cursor: pointer;
        float: left;
    }
     
    .file .file-btn:HOVER {
        background-color: #edfbff;
        border: 1px solid #009bc8;
        color: #009bc8;
    }
     
</style>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	
	<title>Daum������ - �̹��� ÷��</title>
	
	<!-- �������¿����� ���̺귯�� -->
	<link rel="stylesheet" href="daumeditor/css/popup.css" type="text/css"  charset="EUC-KR"/>
	<script src="daumeditor/js/popup.js" type="text/javascript" charset="EUC-KR"></script>
	 
	<script>
		
		//÷���� �̹����� �����Ϳ� �����Ű�� �Լ�
		function done() {
			if (typeof(execAttach) == 'undefined') {
				return;
	    		}
			
			var _mockdata = {
				'imageurl': 'http://cfile284.uf.daum.net/image/116E89154AA4F4E2838948',
				'filename': 'editor_bi.gif',
				'filesize': 640,
				'imagealign': 'C',
				'originalurl': 'http://cfile284.uf.daum.net/original/116E89154AA4F4E2838948',
				'thumburl': 'http://cfile284.uf.daum.net/P150x100/116E89154AA4F4E2838948'
			};
			execAttach(_mockdata);
			closeWindow();
		}
		
		//�߸��� ��η� ������ �� ȣ��Ǵ� �Լ�
		function initUploader(){
	    		var _opener = PopupUtil.getOpener();
	    		if (!_opener) {
				alert('�߸��� ��η� �����ϼ̽��ϴ�.');
	        		return;
	    		}
			
	    		var _attacher = getAttacher('image', _opener);
	    		registerAction(_attacher);
		}
		$(document).ready(function (){
	         
		    //<input type="file">�±� ��� ����
		    $('.file input[type=file]').change(function (){
		        var inputObj = $(this).prev().prev(); //�ι�° �� ����(text) ��ü
		        var fileLocation = $(this).val(); //���ϰ�� ��������
		         
		        inputObj.val(fileLocation.replace('C:\\fakepath\\','')); //��� �������� ������ ������ ��ΰ� ����Ǽ� �����Ƿ� ��ü �� text�� ��� �ֱ�
		    });
		 
		});
		
		
		
	</script>
	
</head>

<body onload="initUploader();">

	<div class="wrapper">
		<div class="header">
			<h1>���� ÷��</h1>
		</div>	
		<div class="body">
			<dl class="alert">
		    		<dt>���� ÷�� Ȯ��</dt>
		    		<dd>
		    			Ȯ���� �����ø� �ӽ� �����Ͱ� ����÷�� �˴ϴ�.<br /> 
		    			�������̽��� �ҽ��� Ȯ�����ּ���.
		    		</dd>
			</dl>
		</div>
		<div class="footer">
			<p>
				<a href="#" onclick="closeWindow();" title="�ݱ�" class="close">�ݱ�</a>
			</p>
			<ul>
				<li class="submit"><a href="#" onclick="done();" title="���" class="btnlink">���</a> </li>
				<li class="cancel"><a href="#" onclick="closeWindow();" title="���" class="btnlink">���</a></li>
			</ul>
		</div>
	</div>
</body>

</html>