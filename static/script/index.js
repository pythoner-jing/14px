$(document).ready(function(){
	var $page = $("#page");
	var $jump = $("#jump");
	console.log("test");
	$jump.click(function(){
		var p = $page.val() == "" ? "1" : $page.val();
		window.location.href = p;

		return false;
	});

	$page.keydown(function(event){
		if(event.which == 13){
			$jump.click();
		}
	});
});
