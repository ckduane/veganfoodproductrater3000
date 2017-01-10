// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require_tree

$(document).ready(function(){
	// slide out navigation
	$('nav').hide();
	$('.fa-bars').on('click', function(){
		$('nav').toggle('slide')
		$('#overlay').toggleClass('overlay')
		})

	// focus search, move icon
	$('.search-bar').focus(function(){
		$('.fa-search').css('transform', 'translateY(5px)')
	})

	// hover search, move icon
	$('.search-bar').hover(function(){
		$('.fa-search').css('transform', 'translateY(5px)')
	}, function(){
		$('.fa-search').css('transform', 'translateY(0px)')
	})

	var wiggleHotdog = new TimelineMax();

	$('.hotdog').each(function(index, element){
		TweenLite.to(element, 1, {y: '5px', ease:Bounce.easeOut});
	})
})