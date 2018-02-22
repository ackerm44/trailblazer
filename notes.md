  4.  Work on Devise Authentication
  6.  Consider removing features column
  8.  See if possible to put a map with pinpointed location
  10. Fix api data on directions
  13. Mark questions/answers on welcome page as read?
  16. Put data somewhere about other users trail activity
  17.  Add "miles" to new trail form
  18.  Remove next trail from trail show page
  19.  Fix user_id on answers has_many render on questions
  20.  Delete button not performing any action on trails show
  21.  Slim down routes


Requirements
3. spec-js.md and spec.md
4. Walk thru video
5. Blog
7. Nested form with custom attribute writer   ???
11. Readme, contributing, license

<script type="text/javascript" charset="utf-8">
  $(document).ready(function () {
    $('#show-trail-form').hide();
    attachNewTrailListener();
  })

  function attachNewTrailListener() {
    $(document).on('click', "#list-add-new-trail", function(e) {
      e.preventDefault();
      $('#show-trail-form').show();
    })

  }
</script>


<!-- <%=# render 'list_trails_form', f: trail_builder %> -->
