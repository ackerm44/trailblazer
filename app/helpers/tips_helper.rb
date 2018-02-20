module TipsHelper

  def user_tip_delete(current_user, tip)
    if current_user == tip.user
      link_to "Delete", tip_path(tip), :method => 'delete'
    end
  end

end
