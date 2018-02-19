module TrailsHelper

  def user_trail_edit(current_user, trail)
    if current_user == @trail.users.first && @trail.user_submitted?
      link_to "Edit Trail", edit_trail_path(@trail)
    end
  end

  def user_trail_delete(current_user, trail)
    if current_user == @trail.users.first && @trail.user_submitted?
      link_to "Delete Trail", trail_path(@trail), :method => 'delete'
    end
  end


  def submitting_user(trail)
    if trail.user_submitted == true
      trail.users.first.username
    else
      "System Submitted"
    end
  end

  def display_dog_friendly(trail)
    if trail.dog_friendly.nil?
      "Unknown"
    elsif trail.dog_friendly == true
      "Yes"
    else
      "No"
    end
  end

  def display_hiked_before(current_user)
    if @trail.users.include?(current_user)
      "Marked as Hiked"
    end
  end

end
