$(document).ready(function() {

	$('#new_comment').hide();
	$("#create_new_note").click(function() {
		$('#new_comment').show();
		$('#comment_type').val("Foswipe::TicketNote");
		$('#ticket_comment_type').text("write Your Note:");
		$('#ticket_attachment_type').text("Note Attachment");
		$('.btn btn-primary').value("Create Note");
		
	});

	$("#create_new_comment").click(function() {
		$('#new_comment').show();
		$('#comment_type').val("Foswipe::TicketComment");
		$('#ticket_comment_type').text("write Your Comment:");
		$('#ticket_attachment_type').text("Comment Attachment");
		$('.btn btn-primary').value("Create Comment");
	});

	$('.days_ago').text(function() {
		$(this).text(daydiff(new Date($('#' + $(this).attr("id") + '_ago').val()), new Date()));

	});

	$('.onsubmit').change(function() {
		this.form.submit();
	});
	$('.onclick').on('ifChecked', function() {
		this.form.submit();
	});
	
		
	

});

function daydiff(first, second) {
	return Math.round((second - first) / (1000 * 60 * 60 * 24));
}

//;
