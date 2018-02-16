module TrailsHelper

  def assign_region(trail)
    if trail < (-87)
      "Western Upper Peninsula"
    end
  end
end
