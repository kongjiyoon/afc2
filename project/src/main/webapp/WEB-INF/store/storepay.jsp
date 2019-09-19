<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script>
	$(function() {
		var IMP = window.IMP; // 생략가능
		IMP.init('imp79016328'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
		var msg;
		IMP
				.request_pay(
						{
							pg : 'kakaopay',
							pay_method : 'card',
							merchant_uid : 'afc' + new Date().getTime(),
							name : 'AFC 스토어 이용',
							amount : '${order.totalPrice}',
							buyer_name : '${order.or_name}',
							buyer_tel : '${order.or_phone}',
							buyer_addr : '${order.or_roadaddr}',
							buyer_postcode : '${order.or_postcode}',
						//m_redirect_url : 'http://www.naver.com'
						},
						function(rsp) {
							if (rsp.success) {
								//[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
								jQuery.ajax({
									url : "/project/store/resultinsert.do", //cross-domain error가 발생하지 않도록 주의해주세요
									type : 'POST',
									dataType : 'json',
									data : {										
										or_num : rsp.merchant_uid,
										id : 'user',
										or_name : '${order.or_name}',
										count : '${order.count}',
										price : '${order.price}',
										totalPrice : '${order.totalPrice}',
										or_size :'${order.or_size}',
										//or_date : ddate,
										or_phone : '${order.or_phone}',
										or_postcode : '${order.or_postcode}',
										or_roadaddr : '${order.or_roadaddr}',
										or_detailaddr : '${order.or_detailaddr}',
										or_content : '${order.or_content}',
										or_payment : 'kakaopay'																									
																			//기타 필요한 데이터가 있으면 추가 전달
									}
								}).done(
										function(data) {
											//[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
											if (everythings_fine) {
												msg = '결제가 완료되었습니다.';
												msg += '\n고유ID : '
														+ rsp.imp_uid;
												msg += '\n상점 거래ID : '
														+ rsp.merchant_uid;
												msg += '\결제 금액 : '
														+ rsp.paid_amount;
												msg += '카드 승인번호 : '
														+ rsp.apply_num;

												alert(msg);
											} else {
												//[3] 아직 제대로 결제가 되지 않았습니다.
												//[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
											}
										});
								//성공시 이동할 페이지
																				
								//alert(rsp.paid_amount);//결제금액
								//alert(rsp.merchant_uid);//결제코드
								//alert(rsp.paid_at);//결제시간
								location.href = '/project/store/result.do?or_num='+rsp.merchant_uid;
							} else {

								msg = '결제에 실패하였습니다.';
								msg += '에러내용 : ' + rsp.error_msg;
								//실패시 이동할 페이지
								alert(msg);
								//alert('${order.price}');
								location.href = '/project/store/store.do';
							}
						});
	});
</script>
</head>
<body>

	<div class="container" style="height: 60%;">
		<h2 align="center">결제 진행중 입니다.</h2>
		<div class="progress">
			<div class="progress-bar progress-bar-striped active"
				role="progressbar" aria-valuenow="100" aria-valuemin="0"
				aria-valuemax="100" style="width: 100%">진행중</div>
		</div>

	</div>




</body>
</html>