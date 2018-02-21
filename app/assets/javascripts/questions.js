$(document).ready(function() {
  attachQuestionListener();
})


function attachQuestionListener() {
  $(document).on('click', "#next-question", function() {
    displayNextQuestion(this);
  })
}

function displayNextQuestion(button) {
  let id = $(button).attr("data-id")
  $.get(`/questions/${id}/next`, function(data) {
    $("#question-show").html("")
    let newQuestion = new Question(data);
    let questionHtml = newQuestion.formatShow();
    $("#question-show").html(questionHtml);
    $("#answers-show").html("");
    data.answers.forEach((answer) => {
      let newAnswer = new Answer(answer);
      console.log(newAnswer)
      let answerHtml = newAnswer.formatIndex();
      $("#answers-show").append(answerHtml);
    })
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

function Answer(data) {
  this.title = data.title
  this.user_id = data.user_id
  this.created_at = data.created_at
}

Answer.prototype.formatIndex = function() {
  let answerHtml = `
    <p>From ${this.user_id} on ${this.created_at}<br>
    ${this.title}
    </p>
  `
  return answerHtml;
}
