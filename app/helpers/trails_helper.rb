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
end
