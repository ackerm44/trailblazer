$(document).ready(function() {
  attachListeners();
});

function attachListeners() {
  $("#tip-form").submit(function(e) {
    e.preventDefault();
    tipFormSubmit(this);
  });

  $("#question-form").submit(function(e) {
    e.preventDefault();
  })
}

function tipFormSubmit(form) {
    let values = $(form).serialize();
    let posting = $.post('/tips', values);
    posting.done(function(data) {
      $("#tip-comment").append(`${data.comment} - ${data.user.username} `);
    });
}


$(function() {
  $('#question-form').on('submit', function(e) {
    e.preventDefault();
    let questionValues = $(this).serialize();
    let QuestionPosting = $.post('/questions', questionValues);
    QuestionPosting.done(function(data) {
      $("#question-title").append(data.title);
    });
  });
  $(`#answer-question`).on("submit", function(e) {

    // Not finding the question-answer-question id on done
    e.preventDefault();
    let answerValues = $(this).serialize();
    let answerPosting = $.post('/answers', answerValues);
    answerPosting.done(function(data) {
      $(`#question-answer-${data.question_id}`).append(`${data.title}`)
    });
  });
  if ($("#hiked-before-display").text() == "Marked as Hiked") {
    $("#hiked-before-form").hide();
  };

  // $("#hiked-before-form").on("submit", function(e) {
  //   e.preventDefault();
  //   let trail_user = "<%= @user %>";
  //   $.ajax(`/trails/${trail_id}`, {
  //     type: 'POST',
  //     data: { _method: 'PATCH', 'trail[user_ids]': trail_user },
  //     success: function(data) {
  //       $("#hiked-before-form").hide();
  //     }
  //   });
  // })
})
