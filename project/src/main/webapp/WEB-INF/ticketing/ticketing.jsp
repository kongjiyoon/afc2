<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Insert title here</title>
<style type="text/css">
body {
	font-family: Verdana, sans-serif;
}
</style>
</head>
<body>
	<div class="row">
		<div class="col-sm-12" style="background-color: black;">
			<div class="container">
				<div style="color: white;">
					<h2 style="font-weight: bolder;">A S I A</h2>
					<hr>
					<div style="font-size: 15pt;">ROUND 2</div>
					<p>September 2019 - June 2020</p>
				</div>
				
				<c:forEach var="code" begin="0" end="7" step="1">
				<div class="panel-group" id="#${fn:substring(TextValue,code,code+1) }">
				<c:set var="TextValue" value="ABCDEFGH"/>
					<div class="panel panel-default">
						<div class="panel-heading">
							<h4 class="panel-title">
								<a data-toggle="collapse" data-parent="#${fn:substring(TextValue,code,code+1) }"
									href="#collapse1">Group ${fn:substring(TextValue,code,code+1) }</a>
							</h4>
						</div>
						<div id="collapse1" class="panel-collapse collapse in">
							<div class="panel-body">
								<div class="container" style="width: 100%;">
									<table class="table">

										<tr>
											<td>Kick-offs are shown in your time zone</td>
										</tr>
					<c:forEach var="match" items="${matchlist}" begin="${code*20 }" end="${code*20+19 }" step="1">
						<tr>
							<td valign="middle">${match.day }<br />Group ${fn:substring(fn:toUpperCase(match.code),0,1) }
							</td>
							<td align="right" style="font-size: 13pt;">${match.home }&nbsp;<img src="/project/resources/images/flags/${match.home_img }" width="70px">
							</td>
							<td align="center">--:--</td>
							<td><img src="/project/resources/images/flags/${match.away_img }"
										width="70px">&nbsp;${match.away }</td>
							<td valign="middle"><button type="button" class="btn btn-default"
											onclick="location.href='/project/ticketing/stadium.do?code='+'${match.code}' ">예매하기</button></td>
						</tr>
						
					</c:forEach>
					</table>
								</div>
							</div>
						</div>
					</div>
					</div>
				</c:forEach>
				
			</div>
		</div>
	</div>
</body>
</html>