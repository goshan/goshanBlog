// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.


function on_add_multimedia(){
	//add image content
	$("#edit_blog #blog_images .image a").click(function(e){
		var text_area = $("#edit_blog form .text_input");
		var image_id = $(this).attr("image_id");
		text_area.val(text_area.val()+"<gImage id="+image_id+">");

		e.preventDefault();
	});
	//add music content
	$("#edit_blog #blog_musics .music a").click(function(e){
		var text_area = $("#edit_blog form .text_input");
		var music_id = $(this).attr("music_id");
		text_area.val(text_area.val()+"<gMusic id="+music_id+">");

		e.preventDefault();
	});
	//add attachment content
	$("#edit_blog #blog_attachs .attach a").click(function(e){
		var text_area = $("#edit_blog form .text_input");
		var attach_id = $(this).attr("attach_id");
		text_area.val(text_area.val()+"<gFile id="+attach_id+">");

		e.preventDefault();
	});
	//add link
	$("#new_blog #link_add, #edit_blog #link_add").click(function(e){
		console.log("dfadafsd");
		var text_area = $("#new_blog form .text_input, #edit_blog form .text_input");
		text_area.val(text_area.val()+"<a class='gLink' href='' target='blank'></a>");
		
		e.preventDefault();
	});
	//add code
	$("#new_blog #code_add, #edit_blog #code_add").click(function(e){
		var text_area = $("#new_blog form .text_input, #edit_blog form .text_input");
		text_area.val(text_area.val()+"<gCode content=\r\n\r\n/>");
		
		e.preventDefault();
	});
}
