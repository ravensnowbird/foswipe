$(document).ready(function() {
    $('#new_comment').hide();
    
    
    
    
    $("#create_new_note").click(function(){
    	$('#new_comment').show();
    	$('#comment_type').val("Foswipe::TicketNote");
    });
    
    $("#create_new_comment").click(function(){
    	$('#new_comment').show();
    	$('#comment_type').val("Foswipe::TicketComment");
    });
});