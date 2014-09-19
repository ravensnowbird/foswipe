$(document).ready(function() {
  $(".select2.filter_item").select2({
  });
  
  $(".custome-select").each(function(index, value) { $(this).val($(this).data("selected-value"));});
});
