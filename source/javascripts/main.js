$(document).ready(function() {
	$('iframe').iFrameResize({
		log: true,
		contentWindowBodyMargin: 0
	});


	$('.codeblock').click(function() {
			$(this).toggleClass('revealed');
	});
});
