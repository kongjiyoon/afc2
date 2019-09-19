<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	pageContext.setAttribute("br", "<br/>");
	pageContext.setAttribute("cn", "\n");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
.btn_global {
	display: block;
	width: 100%;
	height: 61px;
	margin: 30px 0 14px;
	padding-top: 1px;
	border: none;
	border-radius: 0;
	background-color: #03c75a;
	cursor: pointer;
	text-align: center;
	color: #fff;
	font-size: 20px;
	font-weight: 700;
	line-height: 61px;
	-webkit-appearance: none;
}

#boardhead {
	text-align: center;
	background-color: red;
}
.delbtn{
    width:100px;
    background-color: #f8585b;
    border: none;
    color:#fff;
    padding: 15px 0;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 15px;
    margin-bottom : 50px;
    cursor: pointer;

}
.modify{
    width:100px;
    background-color: skyblue;
    border: none;
    color:#fff;
    padding: 15px 0;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 15px;
    margin-bottom : 50px;
    cursor: pointer;

}
#addbtn{
	position: absolute;
	left: 61.7%;
	

}


</style>
<script type="text/javascript">
	function del() {
		location.href ='/project/store/store/delete.do?code=${store.code}';		
	}
	function modify(){
		alert("${store.code}")
		location.href ='/project/store/read.do?code=${store.code}&state=update';
	}

	function getSelect() {
		countval = document.getElementById("count").value;
		priceval = document.getElementById("price").value;
		var sum = countval*priceval;
		//alert(sum);
		$("#totalPrice").val(sum);
	}
	
		


</script>

</head>

<body>

	<div align="center">
	
		<form name="form" action="/project/store/store/order.do?state=order" method="post" style="margin-top: 50px;">
		<input type="hidden" name="code" value="${store.code}">
		<table>
			<tbody>
				
			
				<tr>
					<td width="500" valign="top"><img
						src="/project/resources/images/store/${store.mainimg}" width="450"
						height="450" border="0"></td>
					<td width="400" height="500" valign="top" align="left">
						<table width="372" border="0" cellspacing="0" cellpadding="0">
							<tbody >
								<tr class="btntr" align="right">
									<td colspan="3">
									<input type="button" value="수정하기 " class="modify" onclick="modify();">
									<input type="button" value="삭  제" class="delbtn" onclick="del();"></td>
								</tr>	
								</br>
							
								<tr>									
									<td width="19" height="28"><img
										src="/project/resources/images/store/chk_10x10.gif" width="9"
										height="9"></td>
									<td width="56">상 품 명</td>
									<td width="297">: ${store.name}
									</td>
									
								</tr>
								<tr>
									<td height="28"><img
										src="/project/resources/images/store/chk_10x10.gif" alt=""
										width="9" height="9"></td>
									<td width="56">제 조 사</td>
									<td>: 미라클</td>
								</tr>

								<tr>
									<td height="28"><img
										src="/project/resources/images/store/chk_10x10.gif" alt=""
										width="9" height="9"></td>
									<td bgcolor="#FFFFFF" height="23">판 매 가</td>
									<td>:<fmt:formatNumber value="${store.price}" type="number" /> 원
									<input type="hidden" name="price" id="price" value="${store.price}"> </td>
									
								</tr>

								<tr>
									<td height="28"><img
										src="/project/resources/images/store/chk_10x10.gif" alt=""
										width="9" height="9"></td>
									<td bgcolor="#FFFFFF" height="23">수 량</td>
									<td>: <select name="count" id="count" onchange="getSelect(this.form);">
											<option value>수 량</option>
											<option value="1">1</option>
											<option value="2">2</option>
											<option value="3">3</option>
											<option value="4">4</option>
											<option value="5">5</option>
											<option value="6">6</option>
											<option value="7">7</option>
									</select>
									</td>
								</tr>

								<tr>
									<td height="28"><img
										src="/project/resources/images/store/chk_10x10.gif" alt=""
										width="9" height="9"></td>
									<td bgcolor="#FFFFFF" height="23">사 이 즈</td>
									<td>: <select name="or_size">
											<option value>사 이 즈</option>
											<option value="M">M(95)</option>
											<option value="L">L(100)</option>
											<option value="XL">XL(105)</option>

									</select>
									</td>
								</tr>

							
								
								
								
								
								
								
								<tr>
									<td colspan="3" ><input type="submit" title="주문하기"
										alt="주문하기" value="주문하기" class="btn_global">
										<input type="hidden" name="totalPrice" id="totalPrice" >
										</td>
										
								</tr>
							</tbody>
						</table>
					</td>
				</tr>				
			</tbody>			
		</table>
		</form>		
		<hr />
	</div>
	<div align="center">
		<img alt="내용" src="/project/resources/images/store/${store.content}">
	</div>
	
	
	<div align="center" class="container">
		<hr />
		<h3>상품후기</h3>
		<form action="/project/store/board/insert.do?code=${store.code}">
			<div>
				<input type="hidden" name="code" value=${store.code}>
				<div>로그인된 아이디</div>
				
				<div>
					<input type="text" name="title"  placeholder="제목을 입력해주세요" style="width: 40%;" id="comm1"> <br/>
					<textarea name="content" placeholder="내용을 입력하세요"  style="resize: none; width: 40%; height: 100px;"></textarea>					
				</div>
				
				<div>
				<button class="btn btn-success" id="addbtn" style="width: 60px;"  >등록</button>
				</div>
				<br/><br/><br/>
				
			</div>
		</form>
		<br/>

		<table class="table" style="width: 60%;">
			<thead>
				<tr>
					<th id="boardhead">내용</th>
					<th id="boardhead">작성자</th>
					<th id="boardhead">등록일</th>
					<th id="boardhead"></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="board" items="${boardlist}">
					<tr>						
						<td style="width: 60%; height:30%; "><span>${board.title}</span></br>
						${fn:replace(board.content,cn,br)}</td>
						<td>${board.id}</td>
						<td>${board.re_date}</td>
						<td>
							<button type="button" class="btn btn-info btn-sm"
								onclick="location.href='/project/store/delete.do?review_no=${board.review_no}&code=${board.code}'">삭제</button>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	</div>

	</div>




</body>
</html>