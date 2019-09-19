<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<script>

	function sample4_execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var roadAddr = data.roadAddress; // 도로명 주소 변수
						var extraRoadAddr = ''; // 참고 항목 변수

						// 법정동명이 있을 경우 추가한다. (법정리는 제외)
						// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
						if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
							extraRoadAddr += data.bname;
						}
						// 건물명이 있고, 공동주택일 경우 추가한다.
						if (data.buildingName !== '' && data.apartment === 'Y') {
							extraRoadAddr += (extraRoadAddr !== '' ? ', '
									+ data.buildingName : data.buildingName);
						}
						// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
						if (extraRoadAddr !== '') {
							extraRoadAddr = ' (' + extraRoadAddr + ')';
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('or_postcode').value = data.zonecode;
						document.getElementById("or_roadaddr").value = roadAddr;

						// 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
				
						var guideTextBox = document.getElementById("guide");
						// 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
						if (data.autoRoadAddress) {
							var expRoadAddr = data.autoRoadAddress
									+ extraRoadAddr;
							guideTextBox.innerHTML = '(예상 도로명 주소 : '
									+ expRoadAddr + ')';
							guideTextBox.style.display = 'block';

						}else if(data.autoJibunAddress) {
		                    var expJibunAddr = data.autoJibunAddress;
		                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
		                    guideTextBox.style.display = 'block';
		                }						
						else {
							guideTextBox.innerHTML = '';
							guideTextBox.style.display = 'none';
						}
					}
				}).open();
	}
</script>

<style type="text/css">
.d_form {
	margin: .2em 0;
	font-size: 1em;
	padding: .5em;
	border: 1px solid #ccc;
	border-color: #dbdbdb #d2d2d2 #d0d0d0 #d2d2d3;
	box-shadow: inset 0.1em 0.1em 0.15em rgba(0, 0, 0, .1);
	vertical-align: middle;
	line-height: 1.25em;
	outline: 0;
	width: 20em;
}

.d_form.mini {
	width: 7em;
}
</style>
</head>

<body>
	<div class="container">

		<div class="row cart-pg payment-deliver">
			<h2 class="tit-txt-big tit-line">배송/결제정보 입력</h2>
			<form id="myform" name="myform" action="/project/store/pay.do" method="post" onsubmit="return submitCheck()">
				<strong class="drv-msg pay">결제 정보</strong><br/>
				<table class="form-list pay-list">
					<colgroup>
						<col style="width: 120px">
						<col>
					</colgroup>

					<tbody>
						<tr>
							<th scope="col">상품명</th>
							<td>${store.name}
							<input type="hidden"name="or_name"  value="${store.name}">
							</td>
							
						</tr>
						<tr>
							<th scope="col">수량</th>
							<td>${order.count}
							<input type="hidden"name="count"  value="${order.count}">
							</td>
						</tr>
						<tr>
							<th scope="col">사이즈</th>
							<td>${order.or_size}
							<input type="hidden"name="or_size"  value="${order.or_size}">
							</td>
						</tr>

						<tr>
							<th scope="col">결제 금액</th>
							<td><fmt:formatNumber value="${order.totalPrice}" type="number" /> 원
							<input type="hidden"name="price"  value="${order.price}">
							<input type="hidden"name="totalPrice"  value="${order.totalPrice}">
							</td>
						</tr>


					</tbody>
				</table>
				<br>
				<strong class="drv-msg baesongReceiveInfo">배송 정보</strong> 
				<table class="form-list baesongReceive">
					<colgroup>
						<col style="width: 120px">
						<col>
					</colgroup>

					<tbody>
						<tr>
							<th scope="col"><label for="zipcode1" class="tit-form">배송주소</label></th>
							<td>
								<div class="in-row" style="position: relative; margin-top: -1px; width: 460px;">
									<input type="text" id="or_postcode" placeholder="우편번호" class="d_form mini" name="or_postcode"> <input
										type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br> 

								</div>
								<p>
									<input type="text" id="or_roadaddr" name="or_roadaddr"
										class="d_form std" placeholder="도로명주소">
								<span id="guide" style="color: #999; display: none"></span>
								
									<input type="text" id="or_detailaddr" name="or_detailaddr"
										class="d_form std" placeholder="상세주소">
										
								</p>
								
								
								
							</td>
						</tr>
						<tr>
							<th scope="col"><label for="username" class="tit-form">이름</label></th>
							<td><input type="text" name="username" id="name"
								class="in-text" style="width: 148px" tabindex="3"
								placeholder="이름"><span id="name_msg"></span></td>
						</tr>
						<tr>
							<th scope="col"><label for="" class="tit-form">연락처</label></th>
							<td><input type="text" name="or_phone" class="tit-form" style="width: 148px"
								maxlength="11" id="mobile" tabindex="4" placeholder="연락처"
								> 

							</td>
						</tr>
						<tr>
							<th scope="col"><label for="" class="tit-form">배송요청사항</label></th>
							<td><label class="placeholder"></label><span
								class="sticky-placeholder-wrapper"><input type="text"
									class="in-text" style="width: 442px height: 23px;"
									name="or_content" id="or_content" maxlength="20"
									placeholder="배송 메시지를 입력해주세요. 20자이내"></span></td>
						</tr>
					</tbody>
				</table>




				<input type="submit" value="결제">
			</form>

		</div>



	</div>



</body>
</html>