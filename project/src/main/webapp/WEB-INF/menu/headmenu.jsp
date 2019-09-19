<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta charset="UTF-8">
<title>Asia Qualifiers</title>

</head>
<body>
<!-- menu -->
	<div class="headmenu">
		<ul class="list-inline">
			<li><a id="a" href="#">QUALIFIERS</a></li>
			<li><a id="a" href="#">NEWS</a></li>
			<li><a id="a" href="#">PHOTOS</a></li>s
			<li><a id="a" href="#">VIDEOS</a></li>
			<li><a id="a" href="/project/store/store.do">E-STORE</a></li>
			<li><a id="a" href="#">RANKING</a></li>
			<li><a id="a" href="/project/ticketing/matchlist.do">TICKETING</a></li>
<!-- icons -->
			<li><a id="icons" href="/project/store/store.do"><i class="fas fa-shopping-cart" id="store_i"></i></a></li>
			<li><a id="icons"><i onclick="document.getElementById('login').style.display='block'" class="far fa-user" id="login_i"></i></a></li>
			<li><a id="icons" href="#"><i class="fas fa-font" id="lang_i"></i></a></li>
			<li><a id="icons" href="#"><i class="fas fa-search" id="search_i"></i></a></li>
			<li><a id="icons" href="#"><i class="fas fa-bars" id="menu_i"></i></a></li>
		</ul>
	</div>
<!-- login modal -->
	<div id="login" class="modal">
		<form class="modal-content animate" style="cursor: default;">
			<div id="logintitle"> 
				<span onclick="document.getElementById('login').style.display='none'"
						class="close" title="Close">&times;</span>
				<div id="logintitle0">WELCOME</div>
				<div id="logintitle1">AFC QUALIFIERS</div>
				<div id="logintitle2">LOGIN</div>
			</div>
			<hr /> 
			<div id="idpass">UserID</div>
			<input id="idpass2" type="text" placeholder="Enter UserID">
			<div id="idpass">Password</div>
			<input id="idpass2" type="password" placeholder="Enter Password">
			<div> 
				<button id="loginbtn" type="submit">Login</button>
			</div>
			<div>
				<input id="rm" type="checkbox"><span id="rm2"> Remember me</span>
				<span id="spw">Forgot <a href="#">password?</a></span>
			</div>
			<hr />
			<div>
				<a href="/project/signup.do"><button id="signupbtn" type="button">Sign up</button></a>
			</div>
		</form>
	</div>
	<script>
		var modal = document.getElementById('login'); 
		// 화면 어디를 클릭하든 닫기 
		window.onclick = function(event) {
			if (event.target == modal) {
				modal.style.display = "none";
			}
		}
	</script>
</body>
</html>