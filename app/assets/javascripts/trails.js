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
    questionFormSubmit(this);
  });

  $("#answer-form").submit(function(e) {
    e.preventDefault();
    answerFormSubmit(this);
  });

  $("#hiked-before-form").submit(function(e) {
    e.preventDefault();
    hikedBeforeSubmit(this);
  });
}

function tipFormSubmit(form) {
  let values = $(form).serialize();
  let posting = $.post('/tips', values);
  posting.done(function(data) {
    $("#tip-comment").append(`${data.comment} - ${data.user.username} `);
  });
}

function questionFormSubmit(form) {
  let questionValues = $(form).serialize();
  let questionPosting = $.post('/questions', questionValues);
  questionPosting.done(function(data) {
    $("#question-title").append(`${data.title} - ${data.user.username}`);
  });
}

function answerFormSubmit(form) {
  let answerValues = $(form).serialize();
  let answerPosting = $.post('/answers', answerValues);
  answerPosting.done(function(data) {
    $(`#question-answer-${data.question_id}`).append(`${data.title} - ${data.user.username}`)
  });
}

$(function() {

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
