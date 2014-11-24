$(document).ready(function(){
	var $login = $("#login p");
	var $login_box = $("#login form");
	$login_box.hide();
	$login.click(function(){
		$login_box.toggle();
	});
});