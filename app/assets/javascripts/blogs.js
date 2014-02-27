// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.


function highlight_code(){
	$("pre.code").each(function(i, e){
		hljs.highlightBlock(e);
	});
}

function make_comment(){
	$("#create_comment a").click(function(e){
		if ($("#create_comment #comment_content").val() == ""){
			alert("留言不能为空哦！");
		}
		else {
			$.ajax({
				type: "post", 
				url: $(this).attr("href"), 
				dataType: "script", 
				data: {
					blog_id: $("#create_comment #blog_id").val(), 
					name: $("#create_comment #name").val(), 
					content: $("#create_comment #comment_content").val()
				}
			});
		}
		e.preventDefault();
	});
}