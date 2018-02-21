$(document).ready(function() {
  console.log('hi')
  attachQuestionListener();
})


function attachQuestionListener() {
  $(document).on('click', "#next-question", function() {
     console.log('yes')
    displayNextQuestion(this);
  })
}

function displayNextQuestion(button) {
  let id = $(button).attr("data-id")
  console.log(id)
  $.get(`/questions/${id}/next`, function(data) {
    $("#question-show").html("")
    let newQuestion = new Question(data);
    let questionHtml = newQuestion.formatShow();
    $("#question-show").html(questionHtml);
    history.pushState(null, null, `/questions/${data.id}`)
  })
}

function Question(data) {
  this.id = data.id
  this.title = data.title
  this.created_at = data.created_at
  this.trail_name = data.trail.name
  this.trail_id = data.trail_id
  this.username = data.user.username
}

Question.prototype.formatShow = function() {
  let questionHtml = `
  <h5>From: ${this.username} on ${this.created_at}</h5>
  <h5>Regarding: <a href="/trail/${this.trail_id}">${this.trail_name}</a></h5>
  <h2>${this.title}</h2>
  <button id="next-question" data-id="${this.id}">Next Question</button>

  `
  return questionHtml;
}
