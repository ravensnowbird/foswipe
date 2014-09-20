$(document).ready(function() {
  $(".select2.filter_item").select2({
  });
  
  $(".custome-select").each(function(index, value) { $(this).val($(this).data("selected-value"));});
  
  
  
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
	
		 var offset = 0;
        chatbox_manager = new ChatboxManager();
       $('.addChat').on('click', function(e) {
         var id = $(this).attr("id");
         var title = $(this).text();
         chatbox_manager.addBox(id, title);
       });
  
});



function daydiff(first, second) {
	return Math.round((second - first) / (1000 * 60 * 60 * 24));
}
