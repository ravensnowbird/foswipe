$(document).ready(function() {
	$('.days_ago').text(function() {
		$(this).text(daydiff(new Date($('#' + $(this).attr("id") + '_ago').val()), new Date()));

	});

	$('.onsubmit').change(function() {
		console.log("HAi");
		this.form.submit();
	});
	$('.onclick').on('ifClicked', function() {
		alert('Well done, Sir');
	});

});

function daydiff(first, second) {
	return Math.round((second - first) / (1000 * 60 * 60 * 24));
}

//;