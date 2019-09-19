<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<script type="text/javascript">


 
 
 function list(page){
	 location.href="/project/store/store.do?curPage="+page+"&searchOption-${map.searchOption}"+"&keyword=${map.keyword}";
	// $("#keyword").val("");
 }
</script>

</head>
<body>

	<div class="container">
		<div class="row">
			<div class="col-lg-3">
				<h1 class="my-4">E-Store</h1>
				<div>
				<div class="list-group">
					<ul class="nav" >
					<li><a href="/project/store/store.do" class="list-group-item">전체보기</a></li>
					<li><a href="/project/store/store.do?searchOption=name&keyword=대한민국" class="list-group-item">대한민국</a></li>
					<li><a href="#" class="list-group-item">독일</a></li>
					</ul>
					
					
				</div>
				<ul class="nav">
				<li><a href="/project/store/purchase/history.do">구매내역</a></li>
				
				<li><a href="/project/store/insert.do">등록하기</a></li>
				</ul>
				</div>
				
			</div>
			<!-- /.col-lg-3 -->
			
			
			
			<div class="col-lg-9">
				<div class="row" align="center">
				<div class="body" style="width: 100%;">
<h1>상품 리스트</h1>
		<br><br>
		<form action="/project/store/store.do" name="form1">
			<select name="searchOption">
				<option value="all" <c:out value="${map.searchOption == 'all'?'selected':'' }"/>>전체검색 </option>
				<option value="name"<c:out value="${map.searchOption == 'name'?'selected':''}"/>>상품명</option>
			</select>
			<input name="keyword" id="keyword" value="${map.keyword}">
			<input type="submit" value="조회">
			${map.count}개의 상품이 있습니다.						
		</form>
		<br><br>
		
					<c:forEach var="store" items="${map.list}">
						<div class="col-lg-4 col-md-6 mb-4">
							<div class="card h-100">
								<a href="/project/store/read.do?code=${store.code}&state=READ&curPage=${map.boardPager.curPage}"><img
									class="card-img-top"
									src="/project/resources/images/store/${store.mainimg}" alt=""></a>
								<div class="card-body">
									<h4 class="card-title">
										<a href="/project/store/read.do?code=${store.code}&state=READ">${store.name}</a>
									</h4>																
									<h5> <fmt:formatNumber value="${store.price}" type="number" />원</h5>
								</div>
								<br><br>
							</div>
						</div>
					</c:forEach>
					
					<br>
					</div>			
				
				<div class="row">					
						<div class="col-sm-12">	
						<div class="footer">		
					<c:if test="${map.boardPager.curBlock > 1}">
					<a href="javascript:list('1')">[처음]</a>
					</c:if>
				
				<!-- 이전페이지 블록으로 이동 : 현재 페이지 블럭이 1보다 크면 [이전]하이퍼링크를 화면에 출력 -->
				<c:if test="${map.boardPager.curBlock > 1}">
					<a href="javascript:list('${map.boardPager.prevPage}')">[이전]</a>
				</c:if>
				
				<!-- **하나의 블럭 시작페이지부터 끝페이지까지 반복문 실행 -->
				<c:forEach var="num" begin="${map.boardPager.blockBegin}" end="${map.boardPager.blockEnd}">
					<!-- 현재페이지이면 하이퍼링크 제거 -->
					<c:choose>
						<c:when test="${num == map.boardPager.curPage}">
							<span style="color: red">${num}</span>&nbsp;
						</c:when>
						<c:otherwise>
							<a href="javascript:list('${num}')">${num}</a>&nbsp;
						</c:otherwise>
					</c:choose>
				</c:forEach>				
				<!-- 다음페이지 블록으로 이동 : 현재 페이지 블럭이 전체 페이지 블럭보다 작거나 같으면 [다음]하이퍼링크를 화면에 출력 -->
				<c:if test="${map.boardPager.curBlock <= map.boardPager.totBlock}">
					<a href="javascript:list('${map.boardPager.nextPage}')">[다음]</a>
				</c:if>				
				<!-- 끝페이지로 이동 : 현재 페이지가 전체 페이지보다 작거나 같으면 [끝]하이퍼링크를 화면에 출력 -->
				<c:if test="${map.boardPager.curPage <= map.boardPager.totPage}">
					<a href="javascript:list('${map.boardPager.totPage}')">[끝]</a>
				</c:if>					
					</div>	
					</div>				
					</div>
				</div>			
			</div>		
		</div>
	</div>
</body>
</html>