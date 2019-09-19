<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
	function onlyNumber(event) {
		event = event || window.event;
		var keyID = (event.which) ? event.which : event.keyCode;
		if ((keyID >= 48 && keyID <= 57) || (keyID >= 96 && keyID <= 105)
				|| keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39)
			return;
		else
			return false;
	}
	function removeChar(event) {
		event = event || window.event;
		var keyID = (event.which) ? event.which : event.keyCode;
		if (keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39)
			return;
		else
			event.target.value = event.target.value.replace(/[^0-9]/g, "");
	}
</script>
<style type="text/css">
.mainImage {
	align-content: center;
	text-align: center;
}
</style>
</head>

<body>
	<div class="container">
		<form method="post" role="form" class="form-horizontal"
			action="/project/store/store/update.do" enctype="multipart/form-data">

				<div id="legend">
					<h3 style="text-align: center;">상품 수정</h3>
				</div>

				<div class="mainImage">
					<p class="centered">
						<img id="mainImage"
							src="/project/resources/images/store/${store.mainimg}"
							style="width: 240px;">
					</p>


				</div>

				<div class="row">
					<div class="col-sm-3"></div>
					<div class="col-sm-9">
						<div class="form-group" id="itemid">
							<label class="control-label col-sm-2" for="uploadFiles">메인이미지</label>
							<div class="col-sm-3">
							 <input type="text" id="mainimg" name="mainimg"
									 class="form-control" value="${store.mainimg}"  readonly>
							</div>
						</div>


						<div class="form-group" id="itemid">
							<!-- 제품코드-->
							<label class="control-label col-sm-2" for="code">상품코드</label>
							<div class="col-sm-3">
								<input type="text" id="code" name="code"
									 class="form-control" value="${store.code}"  readonly>

							</div>

						</div>
						<div class="form-group" id="itemid">
							<!-- 성명-->
							<label class="control-label col-sm-2" for="itemname">상품명</label>
							<div class="col-sm-3">
								<input type="text" id="itemname" name="name"
									value="${store.name}" class="form-control" required >

							</div>
						</div>


						<div class="form-group" id="itemid">
							<!-- 카테고리-->
							<label class="control-label col-sm-2" for="category">카테고리</label>
							<div class="col-sm-3">
								<input type="text" id="category" name="category"
									value="${store.category}" class="form-control">

							</div>
						</div>

						<div class="form-group" id="itemid">
							<!-- 금액-->
							<label class="control-label col-sm-2" for="price">상품 가격</label>
							<div class="col-sm-3">
								<input type="text" id="price" name="price" value="${store.price}"
									class="form-control" onkeydown='return onlyNumber(event)'
									onkeyup='removeChar(event)'>
							</div>
						</div>

<!-- 						<div class="form-group" id="itemid">
							<label class="control-label col-sm-2" for="CONTENT">상세 설명</label>
							<div class="col-sm-3">
								<input multiple type="file" name="uploadFiles" accept="image/*"
									onchange="document.getElementById('content').value=this.files[0].name">
								<input type="hidden" id="content" name="content" value="test">
							</div>
						</div> -->




						<div class="form-group" id="itemid">
							<!-- Button -->
							<div class="col-sm-3 col-sm-offset-2">
								<input type="submit" value="수정하기" class="btn btn-success" />
								<input type="button" value="취소하기" class="btn btn-success"
								onclick="location.href='/project/store/read.do?code=${store.code}&state=READ'" />
							</div>
						</div>
					</div>
					
				</div>
		</form>

	</div>

</body>
</html>