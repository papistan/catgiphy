$(document).ready(function() {
	signUp();
	logInz();
	catspload();
	giphyzSearch();
	$('.carousel').carousel();
});


var signUp = function() {
	$(".navbar").on("click", ".signupz", function(e){
	e.preventDefault();

		

		var $link = $(this);
		var url = $link.attr("href");
		var method = "get";

		$.ajax({
	  url: url,
	  type: method
		}).done(function(response){
		$("#catz").hide();
		$("#loginread").hide();
			$("#main").prepend(response);
		})
	})
};

var logInz = function() {
	$(".navbar").on("click", ".loginz", function(e){
	e.preventDefault();

		

		var $link = $(this);
		var url = $link.attr("href");
		var method = "get";

		$.ajax({
	  url: url,
	  type: method
		}).done(function(response){
		$("#catz").hide();
		$("#loginread").hide();
			$("#main").prepend(response);
		})
	})
};


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


var giphyzSearch = function(){ 
	$("#giphy_container").on("submit", "#sign-up", function(e){
	e.preventDefault();

	var $form = $(this);
	var url = $form.attr("action")
	var method = $form.attr("method")
	var data = $form.serialize()
	
	$.ajax({
	  url: url,
	  type: method,
	  data: data
	}).done(function(response){
		// $form.hide();
		console.log(response);
		$("#show").prepend(response);
	})
})
}