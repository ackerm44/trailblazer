$(document).ready(function() {
  attachTipListeners();
})

function attachTipListeners() {
  $("#get-user-tips").on("click", function() {
    $.get('/tips', function(tips) {
      $('#user-tips').html("<h2>Your Tips You've Written: </h2>");
      let tipsFilter = tips.filter(tip => tip.trail.name == "Jordan River Pathway")
      tipsFilter.forEach(tip => {
        const newTip = new Tip(tip);
        let tipHtml = newTip.formatIndex();
        $("#user-tips").append("<ul>" + tipHtml + "</ul>");
      });
    });
  });
}


function Tip(data) {
  this.comment = data.comment;
  this.trailName = data.trail.name;
  this.trailID = data.trail_id;
}

Tip.prototype.formatIndex = function() {
  let tipHtml = `
  <li>
  ${this.comment} <br><br>
  Regarding: <a href="/trails/${this.trailID}">${this.trailName}</a><br>
  ---------------
  </li>
  `
  return tipHtml;
}
