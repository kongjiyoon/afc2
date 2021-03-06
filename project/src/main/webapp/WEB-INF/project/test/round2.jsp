<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>TEST</title>
<link rel="stylesheet" type="text/css"
	href="/project/resources/common/css/round.css">
</head>
<body>
	<div class="row" style="background-color: rgb(50, 98, 149); border-top: 20pt solid rgb(50, 98, 149);">
		<div class="dropdown" style="padding-left: 100pt;">
			<button onclick="myFunction()" class="dropbtn"
				style="text-align: left;">ROUND 1</button>
			<div id="myDropdown" class="dropdown-content">
				<a href="#">ROUND 2</a> <a href="#">ROUND 3</a> <a href="#">ROUND
					4</a>
			</div>
		</div>
		40<br />The eight group winners and four best runners-up will advance to
		the third round of Asian qualifying for Qatar 2022.
	</div>
	<div class="row" style="background-color: rgb(50, 98, 149);border-bottom: 20pt solid rgb(50, 98, 149);">
		<div style="font-size: 13pt;font-weight: bold; margin-top:30pt; margin-left: 100pt;color: gray;">June 2019 - June 2019</div>
		<div class="col-sm-12">
			<img src="/project/resources/images/flags/afg.png" width="50px;" style="margin-top: 30pt; margin-left: 100pt;">
			<img src="/project/resources/images/flags/aus.png" width="50px;" style="margin-top: 30pt; margin-left: 100pt;">
			<img src="/project/resources/images/flags/bhr.png" width="50px;" style="margin-top: 30pt; margin-left: 100pt;">
			<img src="/project/resources/images/flags/ban.png" width="50px;" style="margin-top: 30pt; margin-left: 100pt;">
			<img src="/project/resources/images/flags/cam.png" width="50px;" style="margin-top: 30pt; margin-left: 100pt;">
			<img src="/project/resources/images/flags/chn.png" width="50px;" style="margin-top: 30pt; margin-left: 100pt;">
		</div>
		<div class="col-sm-12">
			<img src="/project/resources/images/flags/tpe.png" width="50px;" style="margin-top: 30pt; margin-left: 100pt;">
			<img src="/project/resources/images/flags/gum.png" width="50px;" style="margin-top: 30pt; margin-left: 100pt;">
			<img src="/project/resources/images/flags/hkg.png" width="50px;" style="margin-top: 30pt; margin-left: 100pt;">
			<img src="/project/resources/images/flags/ind.png" width="50px;" style="margin-top: 30pt; margin-left: 100pt;">
			<img src="/project/resources/images/flags/idn.png" width="50px;" style="margin-top: 30pt; margin-left: 100pt;">
			<img src="/project/resources/images/flags/irn.png" width="50px;" style="margin-top: 30pt; margin-left: 100pt;">
		</div>
	</div>
	
	<div class="row">
		<div class="col-sm-12">
			<div style="margin-left: 100pt;"><h1>MATCHES</h1></div>
			<hr> 
		</div>
	</div>
		<div class="col-sm-1"></div>
	<div class="col-sm-10">
		<h6>Kick-offs are shown in your time zone</h6>
		<div
			style="border-left: 20px solid rgb(213, 213, 213); background-color: rgb(213, 213, 213); color: white; font-size: 20pt;">Thursday
			6 June</div>
		<div class="games">
			<button class="tablinks" onmouseover="gameResult(event, 'round1')">1</button>
			<button class="tablinks" onmouseover="gameResult(event, 'round1')">2</button>
			<button class="tablinks" onmouseover="gameResult(event, 'round1')">3</button>
			<button class="tablinks" onmouseover="gameResult(event, 'round1')">4</button>
			<button class="tablinks" onmouseover="gameResult(event, 'round1')">5</button>
		</div>
		
		<div
			style="border-left: 20px solid rgb(213, 213, 213); background-color: rgb(213, 213, 213); color: white; font-size: 20pt;">Thursday
			7 June</div>
		<div class="games">
			<button class="tablinks" onmouseover="gameResult(event, 'round1')">1</button>
		</div>

		<div
			style="border-left: 20px solid rgb(213, 213, 213); background-color: rgb(213, 213, 213); color: white; font-size: 20pt;">Thursday
			11 June</div>
		<div class="games">
			<button class="tablinks" onmouseover="gameResult(event, 'round1')">1</button>
			<button class="tablinks" onmouseover="gameResult(event, 'round1')">2</button>
			<button class="tablinks" onmouseover="gameResult(event, 'round1')">3</button>
			<button class="tablinks" onmouseover="gameResult(event, 'round1')">4</button>
			<button class="tablinks" onmouseover="gameResult(event, 'round1')">5</button>
			<button class="tablinks" onmouseover="gameResult(event, 'round1')">6</button>
		</div>

	</div>
	<div class="col-sm-1"></div>

	<script type="text/javascript">
		function myFunction() {
			document.getElementById("myDropdown").classList.toggle("show");
		}

		window.onclick = function(event) {
			if (!event.target.matches('.dropbtn')) {
				var dropdowns = document
						.getElementsByClassName("dropdown-content");
				var i;
				for (i = 0; i < dropdowns.length; i++) {
					var openDropdown = dropdowns[i];
					if (openDropdown.classList.contains('show')) {
						openDropdown.classList.remove('show');
					}
				}
			}
		}
	</script>

</body>
</html>