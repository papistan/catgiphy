$(document).ready(function() {
	catspload();
});


var catspload = function(){ 
$("div").on("submit", "form", function(e){
	e.preventDefault()
	var $form = $(this)
	var $container = $form.closest("div")
	var url = $form.attr("action")
	var method = $form.attr("method")
	var data = $form.serialize()
	$.ajax({
	  url: url,
	  type: method,
	  data: data
	}).done(function(response){
		$form.hide();
		$container.append('<img src="/giphy.gif">');
		$container.hide();
		$container.append(response);
	})
})
}