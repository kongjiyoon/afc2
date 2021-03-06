<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Asia Qualifiers</title>
</head>
<body>
	<div>
		<tiles:insertAttribute name="top"></tiles:insertAttribute>
	</div>
	<div class="row" style="margin-left: auto; margin-right: auto;">
		<div class="col-sm-12">
			<tiles:insertAttribute name="menu"></tiles:insertAttribute>
		</div>
	</div>
	<div class="col-sm-12" style="width: 100%;">
		<tiles:insertAttribute name="content"></tiles:insertAttribute>
	</div>
	<div class="col-sm-12" style="width: 100%;">
		<tiles:insertAttribute name="content2"></tiles:insertAttribute>
	</div>
	<div class="col-sm-12" style="width: 100%;">
		<tiles:insertAttribute name="footer"></tiles:insertAttribute>
	</div>



</body>
</html>