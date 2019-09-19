<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
		$("#section1").change(function(){
			section1 = $(this).val();
			//alert(section1);
			var $target = $("select[name='section2']");
			
			$target.empty();
			if(section1==""){
				$target.append("<option value=''>-구역선택-</option>");
				return;
			}
			
			$.ajax({
				type: "get",
				url:"/project/ticketing/ajax_stadium.do",
				data:{ "section" : section1},
				dataType: "json",
				success: function(jdata){
					$target.empty();
					$target.append("<option value=''>-구역선택-</option>");
					if(jdata.length!=0){
						$(jdata).each(function(i) {
							$target.append("<option value="+jdata[i].section_name+">"+jdata[i].section_name+"</option>");
						});
					}
				}, error: function(xhr){
					console.log(xhr.responseText);
					alert("ajax error");
					return;
				}
			});
			
			
		});
		$("#section2").change(function(){
			section1 = $("#section1 option:selected").val();
			section2 = $("#section2 option:selected").val();
			imgdefaultpath = "/project/resources/images/stadium/"
			imgpath = imgdefaultpath+"stadium.gif";
			//alert(section1+","+section2);
			if(section2==""){
				$("#stadiumimg").attr("src", imgpath);
				return;
			}
			
			$.ajax({
				type: "get",
				url:"/project/ticketing/ajax_showstadiumimg.do",
				data:{ "section_name" : section2, "section" : section1},
				dataType: "text",
				success: function(jdata){
					if(jdata.length!=0){
						imgpath = imgdefaultpath+jdata;	
					}else{
						imgpath = imgdefaultpath+"stadium.gif";
					}
					
				}, error: function(xhr,request,error){
					console.log(xhr.responseText);
					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					return;
				}
			});
		});
		$("#stadiumsearchbtn").click(function() {
			//alert("버튼눌림"+imgpath);
			$("#stadiumimg").attr("src", imgpath);
		});
		$("#nextbtn").click(function() {
			location.href="/project/ticketing/seatchoice.do?section1="
				+section1+"&section2="+section2+"&code=${code}"
		});
	
});	
	
</script>
</head>
<body>


<div class="container" style="text-align: center;">
  <p>좌석 방향과 번호를 입력하시고 찾기를 클릭 하시면 하단 평면도에서 좌석의 위치를 찾으실 수 있습니다.</p> 
  	 방향&nbsp;&nbsp;
		
				<select name="section1"  id="section1">
					<option value="">-방향선택-</option>
					<option value="east">동쪽(E)</option>
					<option value="west">서쪽(W)</option>
					<option value="south">남쪽(S)</option>
					<option value="north">북쪽(N)</option>
				</select>
			
  	&nbsp;&nbsp;&nbsp;&nbsp;
  	구역&nbsp;&nbsp;
		
				<select name="section2"  id="section2">
					<option value="">-구역선택-</option>
				</select>
		
 
  	&nbsp;&nbsp;&nbsp;&nbsp;
  	<br/>
  	<button type="button" class="btn btn-default" id= "stadiumsearchbtn">검색</button>
  <br/>
  <img src="/project/resources/images/stadium/stadium.gif" id="stadiumimg">
  &nbsp;&nbsp;&nbsp;&nbsp;
  	<br/>
  	<button type="button" class="btn btn-default" id= "nextbtn">좌석선택하기</button>
</div>

</body>
</html>