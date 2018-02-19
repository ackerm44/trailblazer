module TrailsHelper

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
