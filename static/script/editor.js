$(document).ready(function(){
	var $preview = $("#preview");
	var $editor = $("#editor");
	$preview.hide();


	$("#preview_btn").click(function(){
		$.post(
			"/editor/",
			{editor: $editor.val()},
			function(data, status){
				$preview.show().html(data);
				window.location.href = "#top";
			}
		);
	});
});