// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.


function highlight_code(){
	$("pre.code").each(function(i, e){
		hljs.highlightBlock(e);
	});
}