class Tip < ApplicationRecord
  belongs_to :user
  belongs_to :trail

  def next(current_user)
    current_user_tips = Tip.where("user_id = ?", current_user.id)
    next_tip = current_user_tips.where("id > ?", id).first
  end

end
