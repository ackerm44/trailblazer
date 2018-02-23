$(document).ready(function() {
  attachTipListeners();
})

function attachTipListeners() {
  $("#get-user-tips").on("click", function() {
    $.get('/tips', function(tips) {
      $('#user-tips').html("<h2>Your Tips You've Written: </h2>");
      tips.forEach((tip) => {
        let newTip = new Tip(tip);
        let tipHtml = newTip.formatIndex();
        $("#user-tips").append("<ul>" + tipHtml + "</ul>");
      });
    });
  });
  // $(document).on('click', "#user-tip-delete", function(e) {
  //   e.preventDefault;
  //   console.log('Here');
  //   $("#user-tip-delete").remove();
  // })
}


function Tip(data) {
  this.comment = data.comment;
  this.trail_name = data.trail.name;
  this.trail_id = data.trail_id;
}

Tip.prototype.formatIndex = function() {
  let tipHtml = `
  <li>
  ${this.comment}
  - <a href="/trails/${this.trail_id}">${this.trail_name}</a>
  </li>
  `
  return tipHtml;
}
