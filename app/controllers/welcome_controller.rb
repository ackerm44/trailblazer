class WelcomeController < ApplicationController
  # Root
  def index
    @tip = current_user.tips.first
  end
end
