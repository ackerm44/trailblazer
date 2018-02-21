$(document).ready(function() {
  attachTipListeners();
})

function attachTipListeners() {
  $("#next-tip").on("click", function() {
    let id = $(this).attr('data-id')
    $.get(`/tips/${id}/next`, function(data) {
      $("#user-tip").html(data.comment)
    })
  })
}
