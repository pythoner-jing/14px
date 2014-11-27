$(document).ready(function(){
	var $reply = $(".reply");
	var $comment = $("#comment .panel");
	var $replybox = $("#replybox");
	var $tip = $("#tip");
	var $cancel = $("#cancel");
	var $ref = $("#reply :hidden");
	var $delete = $(".delete");
	var $delete_article = $("#delete");
	var $time = $("#time");
	$reply.hide();
	$tip.hide();
	$cancel.hide();
	$delete.hide();
	$delete_article.hide();

	$comment.hover(function(){
		$(this).find(".reply").toggle();
		$(this).find(".delete").toggle();
	});

	$reply.click(function(){
		var $guest = $(this).parent().find("a.guest");
		$tip.text("回复 " + $guest.text() + " | ");
		$ref.val($guest.attr("guestid"));
		$tip.show();
		$cancel.show();
		window.location.href = "#reply";
		return false;
	});

	$cancel.click(function(){
		$ref.val("");
		$tip.hide();
		$cancel.hide();
	});

	$time.click(function(){
		$delete_article.toggle();
	});
});
