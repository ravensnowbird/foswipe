$(document).ready(function() {

	$('#new_comment').hide();
	$("#create_new_note").click(function() {
		$('#new_comment').show();
		$('#comment_type').val("Foswipe::TicketNote");
	});

	$("#create_new_comment").click(function() {
		$('#new_comment').show();
		$('#comment_type').val("Foswipe::TicketComment");
	});

	$('.days_ago').text(function() {
		$(this).text(daydiff(new Date($('#' + $(this).attr("id") + '_ago').val()), new Date()));

	});

	$('.onsubmit').change(function() {
		this.form.submit();
	});
	$('.onclick').on('ifToggled', function() {
		this.form.submit();
	});
	
		
	

});

function daydiff(first, second) {
	return Math.round((second - first) / (1000 * 60 * 60 * 24));
}

//;
