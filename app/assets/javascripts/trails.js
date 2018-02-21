$(document).ready(function() {
  attachListeners();

  if ($("#hiked-before-display").html() == "Marked as Hiked") {
    $("#hiked-before-form").css("display", "none");
  };
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

  $("#next-trail").on("click", function() {
    displayNextTrail(this);
  })
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

function hikedBeforeSubmit(form) {
  let hikedBeforeValues = $(form).serialize();
  let hikedBeforePosting = $.post($(form).attr("action"), hikedBeforeValues);
  hikedBeforePosting.done(function(data) {
    $("#hiked-before-form").hide();
    $("#hiked-before-display").html("Marked as Hiked");
  });
}

function displayNextTrail(button) {
  let id = $(button).attr('data-id')
  $.get(`/trails/${id}/next`, function(data) {
    $("#trail-info").html("");
    let newTrail = new Trail(data);
    let trailHtml = newTrail.formatShow();
    $("#trail-info").html(trailHtml);

  })
}

function Trail(data) {
  this.id = data.id
  this.name = data.name
  this.directions = data.directions
}

Trail.prototype.formatShow = function() {
  let trailHtml = `
  <h1>${this.name}</h1>
  `

  return trailHtml
}



// t.string "name"
// t.string "nearest_city"
// t.string "directions"
// t.float "distance"
// t.text "description"
// t.string "features"
// t.boolean "dog_friendly"
// t.boolean "user_submitted"
// t.integer "region_id"
// t.datetime "created_at", null: false
// t.datetime "updated_at", null: false
// t.float "latitude"
// t.float "longitude"
