<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="UTF-8">
<title>flexiSeats</title>
<!--   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script> -->
<link href="/project/resources/common/styles/flexiseats.css"
	rel="stylesheet" />
<link href="/project/resources/common/styles/tooltipster.css"
	rel="stylesheet" />
<link href="/project/resources/common/styles/tooltipster-shadow.css"
	rel="stylesheet" />
<link href="/project/resources/common/styles/font-awesome.min.css"
	rel="stylesheet" />

<script src="/project/resources/common/scripts/jquery-2.1.4.min.js"></script>
<script src="/project/resources/common/scripts/flexiseats.js"></script>
<script
	src="/project/resources/common/scripts/jquery.tooltipster.min.js"></script>

<script type="text/javascript">
	section1 = "${section1}";
	section2 = "${section2}";
	code = "${code}";
	var seats_selected = new Array();
	alert(section1+","+section2+","+code);
	$(document).ready(
			function() {

				var seats = $('#seats').flexiSeats({
					rows : 20,
					columns : 30,
					multiple : false,
					booked : [ '1_2', '4_7' ]
				});

				getBlocks();

				$('#btnDraw').click(function() {
					var _rows = parseInt($('#txtRows').val());
					var _cols = parseInt($('#txtCols').val());
				});

				$('#btnAddBlock').click(function() {
					var _label = $('#txtBlockLabel').val();
					var _price = $('#txtBlockPrice').val();
					var _color = $('#txtBlockColor').val();

					seats.addBlock(_label, _price, _color);
					getBlocks();
				});

				function getBlocks() {
					$('#lstBlocks').empty();
					$.each(seats.getBlocks(), function(i, v) {
						var _block = $('<option value="' + this.label + '">'
								+ this.label + ' (' + this.price
								+ ' Rs.)</option>');
						$('#lstBlocks').append(_block);
					});
				}

				$('.flexiSeatsMode').click(function() {
					seats.setMultiple($(this).val());
				});

				$('#btnDefineGold').click(function() {
					var _label = $('#lstBlocks').val();
					seats.defineBlock(_label, seats.getSelected());
				});

				$('.seat').tooltipster({
					offsetY : -10,
					theme : 'tooltipster-shadow'
				});
				$('#btnGetSelected').click(function() {
					//seats.alertSelected();
					//alert(seats.getSeats());
					seats_selected = seats.getSeats();
					ea = parseInt($("#seatchoiceCount option:selected").val());
					alert(seats_selected);
					
					var form = document.createElement("form");      // form 엘리멘트 생성
				    form.setAttribute("method","post");             // method 속성 설정
				    form.setAttribute("action","/project/ticketing/ticketingorder.do");       // action 속성 설정
				    document.body.appendChild(form);                // 현재 페이지에 form 엘리멘트 추가
				  
				    var insert1 = document.createElement("input");   // input 엘리멘트 생성
				    insert1.setAttribute("type","hidden");           // type 속성을 hidden으로 설정
				    insert1.setAttribute("name","section1");               // name 속성을 'stadium'으로 설정
				    insert1.setAttribute("value",section1);             // value 속성을 삽입
				    form.appendChild(insert1);                       // form 엘리멘트에 input 엘리멘트 추가
				    
				    var insert2 = document.createElement("input");   // input 엘리멘트 생성
				    insert2.setAttribute("type","hidden");           // type 속성을 hidden으로 설정
				    insert2.setAttribute("name","section2");               // name 속성을 'stadium'으로 설정
				    insert2.setAttribute("value",section2);             // value 속성을 삽입
				    form.appendChild(insert2);   
				    
				    var insert3 = document.createElement("input");   // input 엘리멘트 생성
				    insert3.setAttribute("type","hidden");           // type 속성을 hidden으로 설정
				    insert3.setAttribute("name","ea");               // name 속성을 'stadium'으로 설정
				    insert3.setAttribute("value",ea);             // value 속성을 삽입
				    form.appendChild(insert3);                       // form 엘리멘트에 input 엘리멘트 추가
				    
				    var insert4 = document.createElement("input");   // input 엘리멘트 생성
				    insert4.setAttribute("type","hidden");           // type 속성을 hidden으로 설정
				    insert4.setAttribute("name","seats_selected");               // name 속성을 'stadium'으로 설정
				    insert4.setAttribute("value",seats_selected);             // value 속성을 삽입
				    form.appendChild(insert4);                       // form 엘리멘트에 input 엘리멘트 추가
				    
				    var insert5 = document.createElement("input");   // input 엘리멘트 생성
				    insert5.setAttribute("type","hidden");           // type 속성을 hidden으로 설정
				    insert5.setAttribute("name","code");               // name 속성을 'stadium'으로 설정
				    insert5.setAttribute("value",code);             // value 속성을 삽입
				    form.appendChild(insert5);                       // form 엘리멘트에 input 엘리멘트 추가
				 
				    form.submit();                                  // 전송

					
					  /* $.ajax({
						type: "get",
						url:"/project/ticketing/ticketingorder.do",
						data:{ "section1" : section1, "section2" : section2, "ea" : ea , "seats_selected" : seats_selected},
						dataType: "json",
						async:true,
						success: function(jdata){
							if(jdata.length!=0){
							}
							 
						}, error: function(xhr){
							console.log(xhr.responseText);
							alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);

							return;
						}
					});  */ 
				});
				
				$("#seatchoiceCount").change(function() {
					count = parseInt($(this).val());
					seats.alertSelected2(count);
				});

				
			});
</script>

</head>
<body>
	<!-- <div>
        Rows: <input id="txtRows" type="text" />
        Columns: <input id="txtCols" type="text" />
        <input type="button" id="btnDraw" value="Draw" />
    </div> -->
    
    <!-- <form action="/project/ticketing/ticketingorder.do" method="post"> -->
	<div class="container" style="text-align: center;">
		<h3>${section1 },${section2 }&nbsp;구역</h3>

		<%-- <input type="hidden" name="section1" value="${section1 }"/>
		<input type="hidden" name="section2" value="${section2 }"/> --%>
		
		<div>
			구매할 좌석 갯수:&nbsp;&nbsp; 
			<select name="ea" id="seatchoiceCount">
				<option value="0">-선택-</option>
				<option value="1">1</option>
				<option value="2">2</option>
				<option value="3">3</option>
				<option value="4">4</option>
				<option value="5">5</option>
				<option value="6">6</option>
			</select>

		</div>
		
		<div class="legends">
			<input id="legAvailable" type="checkbox" disabled /> <label
				for="legAvailable"> Available</label> <input id="legAvailable"
				type="checkbox" data-status="notavailable" disabled /> <label
				for="legAvailable"> Not Available</label> <input id="legBooked"
				type="checkbox" data-status="booked" checked disabled /> <label
				for="legBooked"> Booked</label> <input id="legBooked"
				type="checkbox" checked disabled /> <label for="legBooked">
				Selected</label>
		</div>

		<div id="seats"></div>
		<div class="methods">
			<button type="submit" id="btnGetSelected">예매하기 ></button>
		</div>
	</div>
	</form>
	<!-- <div>
        <br />
        <h4>Mode</h4>
        <input type="radio" name="mode" value="false" class="flexiSeatsMode" />Single
        <input type="radio" name="mode" value="true" class="flexiSeatsMode" />Multiple
    </div> -->

	<!-- <div class="methods">        
        <select id="lstBlocks"></select>
        <button type="button" id="btnDefineGold">Define Selected</button>
    </div>

    <h6>Add Block</h6>
    <table>
        <tr>
            <td>Label</td>
            <td><input type="text" id="txtBlockLabel" /></td>
            <td>Price</td>
            <td><input type="text" id="txtBlockPrice" /></td>
            <td>Color</td>
            <td><input type="text" id="txtBlockColor" /></td>
        </tr>
    </table>
    <button type="button" id="btnAddBlock">Add</button>  -->
</body>
</html>
