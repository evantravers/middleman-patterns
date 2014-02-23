$(document).ready(function() {
	$('iframe').iFrameResize({
		log: true
	});


	$('.codeblock').click(function() {
			$(this).toggleClass('revealed');
	});
});

