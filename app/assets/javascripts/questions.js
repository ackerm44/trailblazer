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

// 2018-02-20T16:29:08.774Z
Question.prototype.formatDate = function() {
  const months = [
    "January", "February", "March", "April",
    "May", "June", "July", "August", "September",
    "October", "November", "December"
  ];

  let date = this.created_at
  let year = date.slice(0, 4);
  let month = date.slice(5, 7);
  if (month[0] == 0) {
    month = month.slice(1,2)
    month = months[month - 1]
  }
  let day = date.slice(8, 10);
  let dateHtml = `${month} ${day}, ${year}`;
  return dateHtml;
}


Question.prototype.formatShow = function() {
  let questionDate = this;
  let questionHtml = `
  <h5>From: ${this.username} on ${questionDate.formatDate()}</h5>
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

Answer.prototype.formatDate = function() {
  const months = [
    "January", "February", "March", "April",
    "May", "June", "July", "August", "September",
    "October", "November", "December"
  ];
  let date = this.created_at;
  let year = date.slice(0, 4);
  let month = date.slice(5, 7);
  if (month[0] == 0) {
    month = month.slice(1,2)
    month = months[month - 1]
  }
  let day = date.slice(8, 10);
  let dateHtml = `${month} ${day}, ${year}`;
  return dateHtml;
}

Answer.prototype.formatIndex = function() {
  let answerDate = this;
  let answerHtml = `
    <p>From ${this.user_id} on ${answerDate.formatDate()}<br>
    ${this.title}
    </p>
  `
  return answerHtml;
}
