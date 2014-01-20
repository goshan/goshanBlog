// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.


function on_add_link(){
	$("#new_blog #link_add a, #edit_blog #link_add a").click(function(e){
		var text_area = $(this).parent().parent().children(".text_input");
		text_area.val(text_area.val()+"<a class='gLink' href='' target='blank'></a>");
		
		e.preventDefault();
	});
}
