$(document).ready(function() {
  attachListeners();

})

function attachListeners() {
  $("#tip-form").on('submit', () => tipFormSubmit());

}

function tipFormSubmit() {
  $('#tip-form').submit(function(e) {
    e.preventDefault();
    let values = $(this).serialize();
    let posting = $.post('/tips', values);
    posting.done(function(data) {
      let user = "<%= current_user.username %>"
      $("#tip-comment").append(`From user: ${user} - ${data.comment} `)
      // $("#tip-comment").append(data.comment);
    });
  });
}


$(function() {
  $('#question-form').on('submit', function(e) {
    e.preventDefault();
    let questionValues = $(this).serialize();
    let QuestionPosting = $.post('/questions', questionValues);
    QuestionPosting.done(function(data) {
      let user = "<%= @user %>"
      $("#question-user").append(user)
      $("#question-title").append(data.title);
    });
  });
  $(`#answer-question`).on("submit", function(e) {

    // Not finding the question-answer-question id on done
    e.preventDefault();
    let answerValues = $(this).serialize();
    let answerPosting = $.post('/answers', answerValues);
    answerPosting.done(function(data) {
      let user = "<%= current_user.username %>";
      $(`#question-answer-${data.question_id}`).append(`${data.title} - ${user}`)
    });
  });
  if ($("#hiked-before-display").text() == "Marked as Hiked") {
    $("#hiked-before-form").hide();
  };

  $("#hiked-before-form").on("submit", function(e) {
    e.preventDefault();
    let trail_user = "<%= current_user.id %>";
    let trail_id = "<%= @trail.id %>";
    $.ajax(`/trails/${trail_id}`, {
      type: 'POST',
      data: { _method: 'PATCH', 'trail[user_ids]': trail_user },
      success: function(data) {
        $("#hiked-before-form").hide();
      }
    });
  })
})
